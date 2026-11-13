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

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'json'
require 'rbconfig'

# 用途：验证 Podfile 在 install/update、查询和辅助模块缺失等分支的加载顺序与降级行为。
# 运行：在终端执行 ruby 本文件，由 Minitest 自动运行用例。
# 边界：仅在临时工程与替身模块中评估挂载链路，不执行真实 pod install 或 App 业务。

class JobsCocoaPodsPodfileIntegrationTest < Minitest::Test
  PROJECT_ROOT = File.expand_path('../../../..', __dir__)
  NETWORK_PACKAGE = '【MacOS】🌐CocoaPods网络适配.command'
  SOURCE_PACKAGE = '【MacOS】🌐CocoaPods源自动选择.command'
  GUARD_PACKAGE = '【MacOS】📦Pod Install离线保护.command'

  GUARD_MODULE = <<~'RUBY'
    module JobsPodInstallOfflineGuard
      def self.guard!(project_root)
        $jobs_fixture_events << ['guard', project_root]
      end
    end
  RUBY

  NETWORK_MODULE = <<~'RUBY'
    module JobsCocoaPodsNetwork
      def self.apply!(project_root:)
        dependency_command = File.basename($PROGRAM_NAME) == 'pod' &&
          %w[install update].include?(ARGV.find { |argument| !argument.start_with?('-') })
        unless dependency_command
          $jobs_fixture_events << ['network_skipped', project_root]
          return :skipped
        end
        $jobs_fixture_events << ['network', project_root]
        ENV.fetch('JOBS_FIXTURE_NETWORK_RESULT', 'inherited').to_sym
      end
    end
  RUBY

  ARCHIVE_MODULE = <<~'RUBY'
    module JobsCocoaPodsDownloadFallback
      def self.install!
        $jobs_fixture_events << ['archive']
        :installed
      end
    end
  RUBY

  SOURCE_MODULE = <<~'RUBY'
    module JobsCocoaPodsSource
      def self.apply!(podfile, project_root:)
        $jobs_fixture_events << ['specs', project_root]
        podfile.source('https://cdn.cocoapods.org/')
      end
    end
  RUBY

  RUNNER = <<~'RUBY'
    require 'json'
    prefix_path, events_path, program, *arguments = ARGV
    $PROGRAM_NAME = program
    ARGV.replace(arguments)
    $jobs_fixture_events = []
    podfile = Object.new
    def podfile.source(url)
      $jobs_fixture_events << ['source', url]
    end
    def podfile.platform(*arguments)
    end
    # 只执行真实 Podfile 的安装配置前置段，不能触发安装 hook。
    podfile.instance_eval(File.read(prefix_path), prefix_path, 1)
    File.write(events_path, JSON.generate($jobs_fixture_events))
  RUBY

  def setup
    lines = File.readlines(File.join(PROJECT_ROOT, 'Podfile'))
    boundary = lines.index { |line| line.match?(/^\s*install!\s+['"]cocoapods['"]/) }
    raise '未找到 Podfile install! 边界，拒绝执行完整 Podfile' unless boundary

    @podfile_prefix = lines.take(boundary).join
  end

  def test_install_prepares_network_and_archive_before_specs
    result = run_fixture(arguments: ['install'])
    assert_equal %w[guard network archive specs source], event_names(result)
    assert_project_roots(result)
    assert_empty result[:stderr]
  end

  def test_update_with_a_leading_option_registers_archive_before_specs
    result = run_fixture(arguments: ['--silent', 'update', 'AMPopTip'])
    assert_equal %w[guard network archive specs source], event_names(result)
    assert_project_roots(result)
  end

  def test_query_commands_do_not_probe_or_register_an_archive_downloader
    [%w[ipc spec], %w[spec cat AMPopTip], %w[repo list], %w[env], %w[--version]].each do |arguments|
      result = run_fixture(arguments: arguments)
      assert_equal %w[guard network_skipped specs source], event_names(result), arguments.inspect
      assert_project_roots(result)
      assert_empty result[:stderr]
    end
  end

  def test_non_pod_program_does_not_register_an_archive_downloader
    result = run_fixture(arguments: ['install'], program: '/fixture/bin/ruby')
    assert_equal %w[guard network_skipped specs source], event_names(result)
  end

  def test_network_outcomes_keep_archive_and_specs_in_the_same_order
    %w[skipped inherited proxy unavailable].each do |outcome|
      result = run_fixture(arguments: ['install'], network_result: outcome)
      assert_equal %w[guard network archive specs source], event_names(result), outcome
    end
  end

  def test_missing_network_module_warns_and_continues_to_archive_and_specs
    result = run_fixture(arguments: ['install'], network_mode: :missing)
    assert_equal %w[guard archive specs source], event_names(result)
    assert_includes result[:stderr], '[PodNetwork]'
    assert_includes result[:stderr], '网络适配模块缺失'
  end

  def test_network_load_and_execution_failures_warn_and_continue_to_specs
    [:load_error, :syntax_error, :load_runtime_error, :runtime_error].each do |mode|
      result = run_fixture(arguments: ['install'], network_mode: mode)
      assert_equal %w[guard archive specs source], event_names(result), mode.to_s
      assert_includes result[:stderr], '[PodNetwork]', mode.to_s
      assert_includes result[:stderr], '网络适配不可用', mode.to_s
    end
  end

  def test_missing_archive_module_warns_and_continues_to_specs
    result = run_fixture(arguments: ['install'], archive_mode: :missing)
    assert_equal %w[guard network specs source], event_names(result)
    assert_includes result[:stderr], '[PodNetwork]'
    assert_includes result[:stderr], '官方源码归档回退模块缺失'
  end

  def test_archive_load_and_execution_failures_warn_and_continue_to_specs
    [:load_error, :syntax_error, :load_runtime_error, :runtime_error].each do |mode|
      result = run_fixture(arguments: ['install'], archive_mode: mode)
      assert_equal %w[guard network specs source], event_names(result), mode.to_s
      assert_includes result[:stderr], '[PodNetwork]', mode.to_s
      assert_includes result[:stderr], '官方源码归档回退不可用', mode.to_s
    end
  end

  def test_both_optional_modules_can_fail_without_blocking_specs
    result = run_fixture(arguments: ['install'], network_mode: :runtime_error, archive_mode: :syntax_error)
    assert_equal %w[guard specs source], event_names(result)
    assert_includes result[:stderr], '网络适配不可用'
    assert_includes result[:stderr], '官方源码归档回退不可用'
  end

  private

  def event_names(result)
    result[:events].map(&:first)
  end

  def assert_project_roots(result)
    assert_includes result[:root], 'OC 工程 中文路径'
    result[:events].each do |name, value|
      next unless %w[guard network network_skipped specs].include?(name)

      assert_equal result[:root], value, "#{name} 使用错误的工程根目录"
    end
  end

  def run_fixture(arguments:, program: '/fixture/bin/pod', network_mode: :normal, archive_mode: :normal, network_result: 'inherited')
    Dir.mktmpdir('jobs-podfile-integration-') do |temporary_root|
      project_root = File.join(temporary_root, 'OC 工程 中文路径')
      prefix_path = File.join(project_root, 'Podfile')
      events_path = File.join(temporary_root, 'events.json')
      FileUtils.mkdir_p(project_root)
      File.write(prefix_path, @podfile_prefix)
      write_module(project_root, GUARD_PACKAGE, 'jobs_pod_install_offline_guard.rb', GUARD_MODULE)
      write_module(project_root, NETWORK_PACKAGE, 'jobs_cocoapods_network.rb', NETWORK_MODULE, network_mode, 'JobsCocoaPodsNetwork', 'apply!')
      write_module(project_root, NETWORK_PACKAGE, 'jobs_cocoapods_download_fallback.rb', ARCHIVE_MODULE, archive_mode, 'JobsCocoaPodsDownloadFallback', 'install!')
      write_module(project_root, SOURCE_PACKAGE, 'jobs_cocoapods_source.rb', SOURCE_MODULE)

      environment = { 'JOBS_FIXTURE_NETWORK_RESULT' => network_result }
      stdout, stderr, status = Open3.capture3(
        environment, RbConfig.ruby, '-e', RUNNER, prefix_path, events_path, program, *arguments,
        chdir: temporary_root
      )
      assert status.success?, "隔离 Podfile 前置段失败：#{stderr}\n#{stdout}"
      assert File.file?(events_path), 'Podfile 前置段未正常执行完成'
      { events: JSON.parse(File.read(events_path)), stderr: stderr, root: project_root }
    end
  end

  def write_module(project_root, package, basename, normal_source, mode = :normal, module_name = nil, method_name = nil)
    return if mode == :missing

    source = case mode
             when :normal
               normal_source
             when :load_error
               "raise LoadError, 'fixture module load failed'\n"
             when :syntax_error
               "module FixtureBrokenModule\n  def self.unfinished(\n"
             when :load_runtime_error
               "raise RuntimeError, 'fixture module initialization failed'\n"
             when :runtime_error
               <<~RUBY
                 module #{module_name}
                   def self.#{method_name}(*arguments, **keywords)
                     raise RuntimeError, 'fixture module execution failed'
                   end
                 end
               RUBY
             else
               raise "不支持的模块夹具模式：#{mode}"
             end
    path = File.join(project_root, 'ScriptsByPods', package, basename, basename)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, source)
  end
end
