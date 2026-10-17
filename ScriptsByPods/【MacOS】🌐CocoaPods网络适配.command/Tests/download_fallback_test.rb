# frozen_string_literal: true

# 真实 CocoaPods 请求与 Http 解包流程；只把网络传输替换为本地受控夹具。
require 'cocoapods'
require 'cocoapods/downloader'
require 'fileutils'
require 'open3'
require 'stringio'
require 'tmpdir'
require_relative '../jobs_cocoapods_download_fallback'

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
