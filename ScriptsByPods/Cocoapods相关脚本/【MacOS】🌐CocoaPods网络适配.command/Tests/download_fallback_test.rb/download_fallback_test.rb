# frozen_string_literal: true

# JOBS_TERMINAL_STYLE_GUARD_V1_BEGIN
if $PROGRAM_NAME == __FILE__
  # 直接运行时由 fork 父进程保护配色；子进程继续原文件，不重放 Ruby 参数和预载模块。
  def jobs_terminal_style_bootstrap_v1
    return unless $PROGRAM_NAME == __FILE__
    plain = lambda do
      ENV.update('PLAIN_OUTPUT' => '1', 'NO_COLOR' => '1', 'FORCE_COLOR' => '0',
                 'CLICOLOR' => '0', 'ANSI_COLORS_DISABLED' => '1', 'npm_config_color' => 'false')
    end
    notify = lambda do |message|
      encoding = $stderr.external_encoding || Encoding::UTF_8
      $stderr.write((message + "\n").encode(encoding, invalid: :replace, undef: :replace))
    end
    return unless $stdin.tty? && $stdout.tty?
    return if ENV.key?('NO_COLOR') || ENV['PLAIN_OUTPUT'] == '1' ||
              ENV['IS_SOURCETREE_RUNTIME'] == '1' ||
              ENV.keys.any? { |key| key.match?(/\A(?:SOURCETREE|SOURCE_TREE)/i) }
    return if ['', 'dumb'].include?(ENV.fetch('TERM', ''))
    if File::ALT_SEPARATOR == '\\' || !Process.respond_to?(:fork) ||
       Thread.list.length > 1 || ENV['TMUX'] || ENV['STY']
      plain.call
      return
    end
    tty_name = IO.popen(['tty'], err: File::NULL, &:read).strip
    groups = IO.popen(['ps', '-o', 'pgid=', '-o', 'tpgid=', '-p', Process.pid.to_s], err: File::NULL, &:read).split
    unless tty_name.match?(%r{\A/dev/[A-Za-z0-9_./-]+\z}) && groups.length == 2 &&
           groups.all? { |group| group.match?(/\A\d+\z/) } && groups[0].to_i > 0 && groups[0] == groups[1]
      plain.call
      return
    end
    owner = ENV['JOBS_TERMINAL_STYLE_OWNER']
    if ENV['JOBS_TERMINAL_STYLE_TTY'] == tty_name && owner && owner.match?(/\A\d+\z/)
      begin
        Process.kill(0, owner.to_i)
        return
      rescue Errno::ESRCH, Errno::EPERM
      end
    end
    require 'io/console'
    require 'tmpdir'
    if Thread.list.length > 1
      plain.call
      return
    end
    tty = File.open('/dev/tty', 'r+')
    tty.binmode
    tty.sync = true
    keys = ['10', '11', '12'] + (0..15).map { |index| "4;#{index}" }
    palette = %w[000000 ff5f56 5fd787 ffd75f 5fafff d787ff 5fd7ff eeeeee
                 9e9e9e ff8787 87ffaf ffff87 87bfff ffafff afffff ffffff]
    targets = { '10' => 'ffffff', '11' => '000000', '12' => 'ffffff' }
    palette.each_with_index { |color, index| targets["4;#{index}"] = color }
    query = lambda do |key|
      tty.write("\e]#{key};?\a")
      bytes = ''.b
      deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + 0.3
      loop do
        remaining = deadline - Process.clock_gettime(Process::CLOCK_MONOTONIC)
        return nil if remaining <= 0 || !IO.select([tty], nil, nil, remaining)
        piece = tty.read_nonblock(256, exception: false)
        next if piece == :wait_readable
        return nil unless piece && !piece.empty?
        bytes << piece
        return nil if bytes.bytesize > 256 || !bytes.start_with?("\e".b)
        break if bytes.end_with?("\a".b) || bytes.end_with?("\e\\".b)
      end
      match = bytes.match(/\A\e\]#{Regexp.escape(key)};rgb:([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})\/([0-9a-fA-F]{1,4})(?:\a|\e\\)\z/n)
      return nil unless match
      components = match.captures.map { |hex| (hex.to_i(16) * 65535.0 / (16**hex.length - 1)).round }
      { raw: bytes, rgb: components }
    rescue IOError, SystemCallError
      nil
    end
    snapshot = lambda do
      values = {}
      tty.raw(min: 0, time: 0, intr: true) do
        keys.each do |key|
          value = query.call(key)
          return nil unless value
          values[key] = value
        end
      end
      values
    rescue IOError, SystemCallError, ArgumentError
      nil
    end
    original = snapshot.call
    unless original
      notify.call('终端不支持完整配色保存，或启动时收到其它输入；保留原配色并使用纯文本。')
      tty.close
      plain.call
      return
    end
    directory = Dir.mktmpdir('jobs-terminal-style-')
    recovery = File.join(directory, 'restore.sh')
    original_bytes = keys.map { |key| original.fetch(key).fetch(:raw) }.join
    recovery_source = "#!/bin/sh\n" \
      "[ -t 0 ] && [ \"$(tty)\" = '#{tty_name}' ] || { printf '请在原终端运行恢复入口。\\n' >&2; exit 1; }\n" \
      "printf '本操作会覆盖此终端当前配色。确认恢复脚本启动前的配色，请输入 YES：' >&2\n" \
      "IFS= read -r jobs_restore_choice\n[ \"$jobs_restore_choice\" = YES ] || exit 1\n" \
      "printf '%s\\033[0m' '#{original_bytes}' > /dev/tty\n"
    File.open(recovery, File::WRONLY | File::CREAT | File::EXCL, 0o600) do |file|
      file.binmode
      file.write(recovery_source.b)
    end
    notify.call("本次终端临时使用黑底白字；强退后恢复入口：sh \"#{recovery}\"")
    changed = false
    applied = nil
    # 比较仍生效的本轮颜色，只恢复未被用户另行修改的项。
    cleanup = lambda do
      current = applied && snapshot.call
      unless current
        notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
        return false
      end
      conflicts = []
      restore_bytes = ''.b
      keys.each do |key|
        if current.fetch(key).fetch(:rgb) == applied.fetch(key).fetch(:rgb)
          restore_bytes << original.fetch(key).fetch(:raw)
        else
          conflicts << key
        end
      end
      tty.write(restore_bytes + "\e[0m".b)
      if conflicts.empty?
        File.unlink(recovery)
        Dir.rmdir(directory)
        true
      else
        notify.call("检测到运行期间的配色变更，已保留这些项：#{conflicts.join(' ')}")
        notify.call("确认要覆盖后续改色时才使用恢复入口：sh \"#{recovery}\"")
        false
      end
    rescue IOError, SystemCallError
      notify.call("终端配色未能安全自动恢复；确认覆盖当前配色后可运行：sh \"#{recovery}\"")
      false
    end
    child_pid = nil
    guardian = false
    interrupted = nil
    previous_signals = {}
    %w[INT TERM HUP].each do |name|
      previous_signals[name] = Signal.trap(name) do
        interrupted = name
        if child_pid && name != 'INT'
          begin
            Process.kill(name, child_pid)
          rescue Errno::ESRCH
          end
        end
      end
    end
    begin
      changed = true
      tty.write(targets.map { |key, color| "\e]#{key};##{color}\a" }.join + "\e[0m")
      applied = snapshot.call
      unless applied
        notify.call('无法核实本次临时配色，已停止启动业务。')
        raise SystemExit, 1
      end
      desired = targets.all? do |key, hex|
        rgb = hex.scan(/../).map { |component| component.to_i(16) * 257 }
        applied.fetch(key).fetch(:rgb).zip(rgb).all? { |actual, expected| (actual - expected).abs <= 255 }
      end
      unless desired
        notify.call('终端未接受本次配色，恢复后使用纯文本。')
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      if interrupted
        raise SystemExit, 128 + Signal.list.fetch(interrupted)
      end
      if Thread.list.length > 1
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      $stdout.flush
      $stderr.flush
      begin
        child_pid = Process.fork
      rescue NotImplementedError, SystemCallError
        restored = cleanup.call
        changed = false
        raise SystemExit, 1 unless restored
        plain.call
        return
      end
      unless child_pid
        changed = false
        ENV['JOBS_TERMINAL_STYLE_TTY'] = tty_name
        ENV['JOBS_TERMINAL_STYLE_OWNER'] = Process.ppid.to_s
        raise SystemExit, 128 + Signal.list.fetch(interrupted) if interrupted
        return
      end
      guardian = true
      result = nil
      loop do
        begin
          _, result = Process.wait2(child_pid)
          break
        rescue Interrupt, Errno::EINTR
        end
      end
      status_code = result.exitstatus || 128 + result.termsig
      %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
      restored = cleanup.call
      changed = false
      status_code = 1 if !restored && status_code.zero?
      tty.close
      Process.exit!(status_code)
    ensure
      if changed
        %w[INT TERM HUP].each { |name| Signal.trap(name, 'IGNORE') }
        cleanup.call
      end
      previous_signals.each { |name, handler| Signal.trap(name, handler) } unless guardian
      tty.close unless tty.closed?
    end
  rescue IOError, SystemCallError, LoadError => error
    if guardian
      notify.call("终端保护监督进程异常：#{error.message}")
      Process.exit!(1)
    end
    raise SystemExit, 1 if changed
    notify.call("终端保护不可用，使用纯文本：#{error.message}")
    plain.call
  end
  jobs_terminal_style_bootstrap_v1

end
# JOBS_TERMINAL_STYLE_GUARD_V1_END

require 'cocoapods'
require 'cocoapods/downloader'
require 'fileutils'
require 'open3'
require 'stringio'
require 'tmpdir'
require_relative '../../jobs_cocoapods_download_fallback.rb/jobs_cocoapods_download_fallback'

# 用途：验证真实 CocoaPods 请求与 Http 解包的下载回退；仅网络传输由本地夹具替代，不访问远端。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

module DownloadFallbackTest
  ADAPTER = JobsCocoaPodsDownloadFallback
  REPOSITORY = 'https://github.com/andreamazz/AMPopTip.git'.freeze
  COMMIT = 'db495eea0747a3493ca8b3c737d037c0090973db'.freeze
  NETWORK_MESSAGE = "fatal: unable to access '#{REPOSITORY}/': Failed to connect to github.com port 443 after 75003 ms: Couldn't connect to server".freeze

  class << self
    attr_accessor :git_error, :checkout_error, :archive_error, :fixture, :events, :last_downloader

    # 失败带用例说明，便于受限机器在无测试框架依赖时复跑。
    def assert(value, message = '断言失败')
      raise message unless value
    end

    # 每个用例清空网络替身与短日志。
    def check(name)
      self.git_error = Pod::Downloader::DownloaderError.new(NETWORK_MESSAGE)
      self.checkout_error = nil
      self.archive_error = nil
      self.events = []
      self.fixture = @normal_fixture
      @diagnostics = StringIO.new
      previous_stderr = $stderr
      $stderr = @diagnostics
      yield
      @passed = (@passed || 0) + 1
      puts "PASS #{name}"
    ensure
      $stderr = previous_stderr
      Thread.current[ADAPTER::CONTEXT_KEY] = nil
      ENV.delete('JOBS_POD_GITHUB_ARCHIVE_FALLBACK')
    end

    # 捕获原对象而非只比较文字，验证回退失败没有伪装成成功。
    def expect_error(expected = git_error)
      begin
        yield
      rescue StandardError => actual
        assert(actual.equal?(expected), "错误对象被替换：#{actual.class}")
        return actual
      end
      raise '应失败却成功'
    end

    # 构造真实已发布请求，不改第三方 podspec 或安装目录。
    def request(source = nil, version: '4.12.0', prepare: nil, released: true, name: 'AMPopTip', **source_keywords)
      source ||= source_keywords.empty? ? { :git => REPOSITORY, :tag => '4.12.0' } : source_keywords
      spec = Pod::Specification.new do |entry|
        entry.name = name
        entry.version = version
        entry.source = source
        entry.prepare_command = prepare if prepare
      end
      Pod::Downloader::Request.new(:spec => spec, :released => released)
    end

    # 目标只位于测试临时目录，走真实 download_request 与 source 分发。
    def download(value = request)
      target = Pathname(@root).join('download-target')
      Pod::Downloader.download_request(value, target)
    end

    # 夹具由系统 tar 生成，后续解包交回 CocoaPods 自带 Http 实现。
    def archive(name, attributes: '*.pbxproj binary merge=union', lfs: false, symlink: false, modules: false, missing: false)
      directory = File.join(@root, "source-#{name}")
      package = File.join(directory, 'AMPopTip-fixture')
      FileUtils.mkdir_p(File.join(package, 'Source'))
      File.write(File.join(package, 'Source', 'Tip.swift'), lfs ? "version https://git-lfs.github.com/spec/v1\n" : "public class Tip {}\n")
      File.write(File.join(package, 'LICENSE'), 'MIT') unless missing
      File.write(File.join(package, '.gitattributes'), attributes)
      File.write(File.join(package, '.gitmodules'), '[submodule]') if modules
      File.symlink('/etc/passwd', File.join(package, 'outside-link')) if symlink
      output = File.join(@root, "#{name}.tar.gz")
      _, errors, status = Open3.capture3('/usr/bin/tar', 'czf', output, '-C', directory, 'AMPopTip-fixture')
      assert(status.success?, errors)
      output
    end

    # 验证挂载开关、版本保护和可重复挂载。
    def installation_checks
      check('关闭开关时不挂载') do
        ENV['JOBS_POD_GITHUB_ARCHIVE_FALLBACK'] = '0'
        assert(!ADAPTER.install!)
        assert(!Pod::Downloader::Git.ancestors.include?(ADAPTER::GitArchiveFallback))
      end
      check('未知 downloader 版本只告警跳过') do
        original = Pod::Downloader::VERSION
        Pod::Downloader.send(:remove_const, :VERSION)
        Pod::Downloader.const_set(:VERSION, '999.0')
        begin
          assert(!ADAPTER.install!)
          assert(@diagnostics.string.include?('未验证'))
          assert(!Pod::Downloader::Git.ancestors.include?(ADAPTER::GitArchiveFallback))
        ensure
          Pod::Downloader.send(:remove_const, :VERSION)
          Pod::Downloader.const_set(:VERSION, original)
        end
      end
      check('已验证 API 挂载且重复调用幂等') do
        assert(ADAPTER.install!)
        assert(ADAPTER.install!)
        assert(Pod::Downloader::Git.ancestors.count(ADAPTER::GitArchiveFallback) == 1)
      end
    end

    # 使用真实原请求、原 spec 与本地 tar 验证成功路径。
    def successful_checks
      check('AMPopTip tag 失败后下载同一审定 release 的官方 commit 归档') do
        value = request
        before_spec = value.spec.to_hash
        before_params = Marshal.dump(value.params)
        lock = Pod::Lockfile.new('PODS' => ['AMPopTip (4.12.0)'], 'SPEC CHECKSUMS' => { 'AMPopTip' => 'original' })
        before_lock = Marshal.dump(lock.to_hash)
        response, specs = download(value)
        assert(response.spec.equal?(value.spec) && specs['AMPopTip'].equal?(value.spec))
        assert(response.checkout_options.equal?(value.params), 'CocoaPods 原锁参数对象被替换')
        assert(Marshal.dump(value.params) == before_params && value.spec.to_hash == before_spec)
        assert(Marshal.dump(lock.to_hash) == before_lock)
        assert(response.location.join('Source/Tip.swift').file?)
        assert(!response.location.join('AMPopTip-fixture').exist?, '官方 Http 未正确压平归档')
        assert(last_downloader.checkout_options == { :git => REPOSITORY, :commit => COMMIT })
        assert(events.map(&:first) == [:clone, :curl])
        arguments = events.last[1]
        assert(arguments.include?("https://codeload.github.com/andreamazz/AMPopTip/tar.gz/#{COMMIT}"))
        assert(arguments.include?('--max-time') && arguments.include?('60'))
        assert(!arguments.include?('--netrc-optional'))
      end
      check('完整审定 commit 回退后不调用不存在的 Git checkout') do
        value = request(:git => REPOSITORY, :commit => COMMIT)
        response, = download(value)
        assert(response.checkout_options == value.params)
        assert(events.map(&:first) == [:clone, :curl])
        assert(last_downloader.checkout_options[:commit] == COMMIT)
      end
      check('Git 正常时不请求归档且 checkout 保留') do
        self.git_error = nil
        download(request(:git => REPOSITORY, :commit => COMMIT))
        assert(events.map(&:first) == [:clone, :checkout])
        assert(last_downloader.checkout_options[:commit] == COMMIT)
      end
      check('请求上下文退出后恢复之前状态') do
        previous = Object.new
        Thread.current[ADAPTER::CONTEXT_KEY] = previous
        download
        assert(Thread.current[ADAPTER::CONTEXT_KEY].equal?(previous))
      end
    end

    # 非网络失败、未知源码语义以及未审版本必须继续暴露原错误。
    def rejection_checks
      {
        '其它 Pod' => request(name: 'OtherPod'),
        '未审版本' => request(version: '4.12.1'),
        '未审标签' => request(:git => REPOSITORY, :tag => '4.11.0'),
        '浮动分支' => request(:git => REPOSITORY, :branch => 'master'),
        '缩写 commit' => request(:git => REPOSITORY, :commit => COMMIT[0, 12]),
        '未审完整 commit' => request(:git => REPOSITORY, :commit => 'f' * 40),
        'tag 与 commit 混用' => request(:git => REPOSITORY, :tag => '4.12.0', :commit => COMMIT),
        '子模块' => request(:git => REPOSITORY, :tag => '4.12.0', :submodules => true),
        '准备命令' => request(prepare: 'git describe --tags'),
        '外部 source' => request(released: false),
        '其它主机' => request(:git => 'https://github.example/andreamazz/AMPopTip.git', :tag => '4.12.0'),
        '认证 URL' => request(:git => 'https://secret@github.com/andreamazz/AMPopTip.git', :tag => '4.12.0'),
        'URL query' => request(:git => "#{REPOSITORY}?secret=value", :tag => '4.12.0'),
        'SSH URL' => request(:git => 'git@github.com:andreamazz/AMPopTip.git', :tag => '4.12.0')
      }.each do |name, value|
        check("拒绝回退：#{name}") do
          expect_error { download(value) }
          assert(events.map(&:first) == [:clone])
        end
      end
      [
        'fatal: Authentication failed: connection timed out',
        'fatal: repository not found',
        'fatal: Remote branch 4.12.0 not found in upstream origin',
        'fatal: The requested URL returned error: 403; Failed to connect to host port 443',
        'fatal: SSL certificate problem: certificate has expired',
        'fatal: Verification checksum was incorrect',
        'fatal: index-pack failed: Connection reset by peer'
      ].each_with_index do |message, index|
        check("业务/认证/内容错误不回退 #{index + 1}") do
          self.git_error = Pod::Downloader::DownloaderError.new(message)
          expect_error { download }
          assert(events.map(&:first) == [:clone])
        end
      end
      check('下载过程中关闭开关仍立即生效') do
        ENV['JOBS_POD_GITHUB_ARCHIVE_FALLBACK'] = '0'
        expect_error { download }
        assert(events.map(&:first) == [:clone])
      end
      check('成功 clone 后 checkout 连接类错误不触发回退') do
        self.git_error = nil
        self.checkout_error = Pod::Downloader::DownloaderError.new(NETWORK_MESSAGE)
        expect_error(checkout_error) { download(request(:git => REPOSITORY, :commit => COMMIT)) }
        assert(events.map(&:first) == [:clone, :checkout])
      end
      check('无 spec 上下文的原始 downloader 不获得回退权限') do
        downloader = Pod::Downloader.for_target(Pathname(@root).join('direct'), :git => REPOSITORY, :tag => '4.12.0')
        expect_error { downloader.download }
        assert(events.map(&:first) == [:clone])
      end
    end

    # 失败不能覆盖原错误、遗留半个成功目录或输出代理凭据。
    def failure_checks
      check('官方归档失败保留原 Git 错误与暂存') do
        self.archive_error = Pod::Downloader::DownloaderError.new('proxy=https://user:private-token@proxy.invalid failed')
        expect_error { download }
        target = Pathname(@root).join('download-target')
        assert(target.join('partial-git').file?)
        assert(@diagnostics.string.include?('HTTPS 下载与解包'))
        assert(!@diagnostics.string.include?('private-token'))
        assert(Dir.glob(File.join(@root, 'jobs-pod-archive-*')).empty?)
      end
      {
        '特殊导出属性' => { :attributes => '* export-ignore' },
        'LFS 属性' => { :attributes => '*.swift filter=lfs' },
        'LFS 指针' => { :lfs => true },
        '子模块描述' => { :modules => true },
        '符号链接' => { :symlink => true },
        '缺少许可文件' => { :missing => true }
      }.each do |name, options|
        check("异常归档拒绝成功：#{name}") do
          self.fixture = archive("invalid-#{@passed}", **options)
          expect_error { download }
          assert(Pathname(@root).join('download-target/partial-git').file?)
          assert(!last_downloader.instance_variable_defined?(:@jobs_archive_commit))
          assert(@diagnostics.string.include?('归档内容验证'))
        end
      end
      check('TLS 中断与 DNS 错误属于网络错误') do
        ['SSL_connect: SSL_ERROR_SYSCALL', 'Could not resolve host: github.com', 'Operation timed out', 'Connection reset by peer'].each do |message|
          assert(ADAPTER.network_error?(StandardError.new(message)), message)
        end
      end
    end

    # 编排隔离回归；无真实 git/curl 网络操作，也不执行 pod install。
    def run
      Pod::Config.instance.silent = true
      Dir.mktmpdir('jobs-pod-download-test-') do |directory|
        @root = directory
        @normal_fixture = archive('normal')
        installation_checks
        successful_checks
        rejection_checks
        failure_checks
      end
      puts "#{@passed} checks passed; local tar fixtures only, no pod install or network downloads."
    end
  end

  # Git 替身只截取下载器子进程边界，不替换待测的 clone、checkout 或请求分发。
  module LocalGit
    def git!(*arguments)
      command = arguments.flatten.map(&:to_s)
      DownloadFallbackTest.last_downloader = self
      if command.first == 'clone'
        DownloadFallbackTest.events << [:clone, command]
        FileUtils.mkdir_p(target_path)
        File.write(target_path.join('partial-git'), 'original clone attempt')
        raise DownloadFallbackTest.git_error if DownloadFallbackTest.git_error
      elsif command.include?('checkout')
        DownloadFallbackTest.events << [:checkout, command]
        raise DownloadFallbackTest.checkout_error if DownloadFallbackTest.checkout_error
      elsif command.include?('rev-parse')
        return "#{COMMIT}\n"
      else
        raise "意外 Git 命令：#{command.first}"
      end
      ''
    end
  end

  # curl 替身只复制压缩包，官方 Http 解包仍实际调用系统 tar。
  module LocalCurl
    def curl!(*arguments)
      command = arguments.flatten.map(&:to_s)
      DownloadFallbackTest.events << [:curl, command]
      raise DownloadFallbackTest.archive_error if DownloadFallbackTest.archive_error

      destination = command[command.index('--output') + 1]
      FileUtils.cp(DownloadFallbackTest.fixture, destination)
      ''
    end
  end
end

Pod::Downloader::Git.prepend(DownloadFallbackTest::LocalGit)
Pod::Downloader::Http.prepend(DownloadFallbackTest::LocalCurl)
DownloadFallbackTest.run
