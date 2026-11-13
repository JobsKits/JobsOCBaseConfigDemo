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
require 'rbconfig'
require_relative '../../jobs_cocoapods_network.rb/jobs_cocoapods_network'

# 用途：验证 CocoaPods 进程级网络选路、代理参数、超时、环境恢复及 Git 子进程约束，不修改系统代理。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

class JobsCocoaPodsNetworkTest < Minitest::Test
  Network = JobsCocoaPodsNetwork

  def setup
    @environment = ENV.to_hash
    Network.restore!
    %w[JOBS_POD_PROXY_URL JOBS_POD_NETWORK_ADAPT JOBS_POD_NETWORK_PROBE_TIMEOUT JOB_POD_NETWORK_PROBE_TIMEOUT GIT_CONFIG_COUNT].each do |key|
      ENV.delete(key)
    end
    @project_root = Dir.tmpdir
  end

  def teardown
    Network.restore!
    ENV.replace(@environment)
  end

  def with_stub(name, replacement)
    original = Network.method(name)
    Network.define_singleton_method(name, replacement)
    yield
  ensure
    Network.define_singleton_method(name, original)
  end

  def with_pod_command(arguments)
    previous_program = $PROGRAM_NAME
    previous_arguments = ARGV.dup
    $PROGRAM_NAME = '/test/bin/pod'
    ARGV.replace(arguments)
    yield
  ensure
    $PROGRAM_NAME = previous_program
    ARGV.replace(previous_arguments)
  end

  def run_apply(probe)
    result = nil
    _stdout, stderr = capture_io do
      result = Network.apply!(project_root: @project_root, probe: probe)
    end
    [result, stderr]
  end

  def test_query_commands_do_not_probe_or_read_system_proxy
    with_stub(:git_route_usable?, ->(**_arguments) { flunk('query contacted Git') }) do
      with_stub(:system_proxy_routes, ->(_timeout) { flunk('query read system proxy') }) do
        %w[ipc spec repo env].each do |command|
          with_pod_command([command]) { assert_equal :skipped, Network.apply!(project_root: @project_root) }
        end
      end
    end
  end

  def test_install_and_update_are_the_only_dependency_commands
    %w[install update].each do |command|
      with_pod_command(['--silent', command]) { assert Network.dependency_command? }
    end
    refute Network.dependency_command?
  end

  def test_probe_false_overrides_install_command
    with_pod_command(['install']) do
      assert_equal :skipped, Network.apply!(project_root: @project_root, probe: false)
    end
  end

  def test_explicit_disable_skips_proxy_adaptation_even_for_manual_probe
    ENV['JOBS_POD_NETWORK_ADAPT'] = '0'
    runner = ->(**_arguments) { flunk('disabled adaptation must not probe') }
    assert_equal :skipped, Network.apply!(project_root: @project_root, probe: runner)
  end

  def test_healthy_current_route_is_tested_once_and_not_changed
    original_proxy = ENV['https_proxy']
    calls = []
    runner = ->(**arguments) { calls << arguments; true }
    with_stub(:system_proxy_routes, ->(_timeout) { flunk('healthy route should not inspect alternatives') }) do
      assert_equal :inherited, run_apply(runner).first
      assert_equal :inherited, run_apply(runner).first
    end
    assert_equal 1, calls.length
    assert_empty calls.first[:environment]
    assert original_proxy == ENV['https_proxy']
  end

  def test_explicit_proxy_is_prioritized_without_logging_address_or_password
    proxy = 'http://fixture-user:fixture-secret@proxy.example:8080'
    ENV['JOBS_POD_PROXY_URL'] = proxy
    calls = []
    result, log = run_apply(->(**arguments) { calls << arguments; true })
    assert_equal :proxy, result
    assert_equal proxy, calls.first[:environment]['https_proxy']
    assert_equal 1, calls.length
    assert_includes log, 'JOBS_POD_PROXY_URL'
    refute_includes log, 'proxy.example'
    refute_includes log, 'fixture-secret'
  end

  def test_explicit_failure_falls_back_to_current_route_without_applying_proxy
    ENV['JOBS_POD_PROXY_URL'] = 'http://unavailable.example:8080'
    calls = []
    original = ENV['https_proxy']
    runner = ->(**arguments) { calls << arguments[:environment]; arguments[:environment].empty? }
    result, log = run_apply(runner)
    assert_equal :inherited, result
    assert_equal 2, calls.length
    assert original == ENV['https_proxy']
    assert_includes log, '继续检查当前链路'
  end

  def test_system_proxy_parsing_uses_enabled_manual_values_and_correct_protocols
    output = <<~CONFIG
      <dictionary> {
        HTTPSEnable : 1
        HTTPSProxy : secure.example
        HTTPSPort : 7891
        HTTPEnable : 1
        HTTPProxy : 127.0.0.1
        HTTPPort : 7890
        SOCKSEnable : 1
        SOCKSProxy : ::1
        SOCKSPort : 1080
        ProxyAutoConfigEnable : 1
        ProxyAutoConfigURLString : https://ignored.example/proxy.pac
      }
    CONFIG
    assert_equal [
      [:system_https, 'http://secure.example:7891'],
      [:system_http, 'http://127.0.0.1:7890'],
      [:system_socks, 'socks5h://[::1]:1080']
    ], Network.parse_system_proxies(output)
  end

  def test_disabled_incomplete_or_injected_system_values_are_not_candidates
    output = <<~CONFIG
      HTTPSEnable : 0
      HTTPSProxy : disabled.example
      HTTPSPort : 8080
      HTTPEnable : 1
      HTTPProxy : bad.example/path
      HTTPPort : 8080
      SOCKSEnable : 1
      SOCKSProxy : localhost
      SOCKSPort : 65536
      ProxyAutoConfigEnable : 1
    CONFIG
    assert_empty Network.parse_system_proxies(output)
  end

  def test_duplicate_manual_system_proxies_are_probed_once
    output = "HTTPSEnable : 1\nHTTPSProxy : localhost\nHTTPSPort : 8080\nHTTPEnable : 1\nHTTPProxy : localhost\nHTTPPort : 8080\n"
    assert_equal 1, Network.parse_system_proxies(output).length
  end

  def test_nested_scoped_settings_cannot_replace_effective_top_level_proxy
    output = <<~CONFIG
      <dictionary> {
        HTTPSEnable : 1
        HTTPSProxy : active.example
        HTTPSPort : 8080
        __SCOPED__ : <dictionary> {
          en1 : <dictionary> {
            HTTPSEnable : 1
            HTTPSProxy : inactive.example
            HTTPSPort : 9090
          }
        }
      }
    CONFIG
    assert_equal [[:system_https, 'http://active.example:8080']], Network.parse_system_proxies(output)
  end

  def test_failed_current_route_automatically_tries_configured_system_proxy
    proxy = 'socks5h://localhost:1080'
    routes = [Network.proxy_route(:system_socks, proxy)]
    calls = []
    with_stub(:system_proxy_routes, ->(_timeout) { routes }) do
      result, = run_apply(->(**arguments) { calls << arguments[:environment]; !arguments[:environment].empty? })
      assert_equal :proxy, result
    end
    assert_empty calls.first
    assert_equal proxy, ENV['HTTPS_PROXY']
    assert_equal 2, calls.length
  end

  def test_git_config_count_is_appended_and_original_environment_is_restored
    ENV['GIT_CONFIG_COUNT'] = '2'
    ENV['GIT_CONFIG_KEY_0'] = 'http.proxy'
    ENV['GIT_CONFIG_VALUE_0'] = 'http://old.example:8080'
    ENV['GIT_CONFIG_KEY_1'] = 'http.https://private.example/.proxy'
    ENV['GIT_CONFIG_VALUE_1'] = 'http://private.example:8081'
    ENV['GIT_CONFIG_KEY_2'] = 'original-unused-key'
    ENV['NO_PROXY'] = 'private.example,localhost'
    ENV['https_proxy'] = 'http://inherited.example:8082'
    original = ENV.to_hash
    ENV['JOBS_POD_PROXY_URL'] = 'http://new.example:8083'
    assert_equal :proxy, run_apply(->(**_arguments) { true }).first
    assert_equal '3', ENV['GIT_CONFIG_COUNT']
    assert_equal original['GIT_CONFIG_KEY_1'], ENV['GIT_CONFIG_KEY_1']
    assert_equal original['GIT_CONFIG_VALUE_1'], ENV['GIT_CONFIG_VALUE_1']
    assert_equal Network::GIT_PROXY_KEY, ENV['GIT_CONFIG_KEY_2']
    assert_equal original['NO_PROXY'], ENV['NO_PROXY']
    Network.restore!
    assert_equal original['GIT_CONFIG_COUNT'], ENV['GIT_CONFIG_COUNT']
    assert_equal original['GIT_CONFIG_KEY_2'], ENV['GIT_CONFIG_KEY_2']
    assert_equal original['https_proxy'], ENV['https_proxy']
    refute ENV.key?('GIT_CONFIG_VALUE_2') unless original.key?('GIT_CONFIG_VALUE_2')
  end

  def test_invalid_existing_git_config_count_is_not_overwritten
    ENV['GIT_CONFIG_COUNT'] = 'invalid'
    assert_nil Network.proxy_route(:explicit, 'http://localhost:8080')
    assert_equal 'invalid', ENV['GIT_CONFIG_COUNT']
  end

  def test_git_subprocess_uses_new_github_proxy_and_retains_private_domain_proxy
    ENV['GIT_CONFIG_COUNT'] = '2'
    ENV['GIT_CONFIG_KEY_0'] = 'http.proxy'
    ENV['GIT_CONFIG_VALUE_0'] = 'http://old.example:8080'
    ENV['GIT_CONFIG_KEY_1'] = 'http.https://private.example/.proxy'
    ENV['GIT_CONFIG_VALUE_1'] = 'http://private.example:8081'
    ENV['JOBS_POD_PROXY_URL'] = 'http://new.example:8082'
    assert_equal :proxy, run_apply(->(**_arguments) { true }).first
    environment = { 'GIT_CONFIG_NOSYSTEM' => '1', 'GIT_CONFIG_GLOBAL' => File::NULL }
    { Network::PROBE_URL => 'http://new.example:8082',
      'https://private.example/repository.git' => 'http://private.example:8081' }.each do |url, expected|
      output, successful, = Network.run_bounded(environment, ['git', 'config', '--get-urlmatch', 'http.proxy', url], @project_root, 1)
      assert successful
      assert_equal expected, output.strip
    end
    output, successful, = Network.run_bounded({}, [RbConfig.ruby, '-e', 'print ENV.fetch("https_proxy")'], @project_root, 1)
    assert successful
    assert_equal 'http://new.example:8082', output
  end

  def test_at_exit_restores_environment_before_earlier_exit_handlers_run
    module_path = File.expand_path('../../jobs_cocoapods_network.rb/jobs_cocoapods_network.rb', __dir__)
    code = <<~RUBY
      require ARGV[0]
      ENV['https_proxy'] = 'http://original.example:8080'
      at_exit { abort 'restore failed' unless ENV['https_proxy'] == 'http://original.example:8080' }
      JobsCocoaPodsNetwork.apply!(project_root: Dir.tmpdir, probe: ->(**_arguments) { true })
    RUBY
    environment = { 'JOBS_POD_PROXY_URL' => 'http://selected.example:8080' }
    output, successful, timed_out = Network.run_bounded(
      environment, [RbConfig.ruby, '-rtmpdir', '-e', code, module_path], @project_root, 1
    )
    assert successful
    refute timed_out
    assert_empty output
  end

  def test_no_available_route_preserves_environment_and_suppresses_raw_errors
    secret = 'fixture-password-never-log'
    original = ENV.to_hash
    with_stub(:system_proxy_routes, ->(_timeout) { [] }) do
      result, log = run_apply(->(**_arguments) { raise "failure #{secret}" })
      assert_equal :unavailable, result
      assert_equal original, ENV.to_hash
      refute_includes log, secret
      assert_includes log, '不代表安装成功'
    end
  end

  def test_timeout_values_are_bounded_and_legacy_name_is_supported
    assert_equal 6, Network.probe_timeout
    ENV['JOB_POD_NETWORK_PROBE_TIMEOUT'] = '8'
    assert_equal 8, Network.probe_timeout
    ENV['JOBS_POD_NETWORK_PROBE_TIMEOUT'] = '1'
    assert_equal 1, Network.probe_timeout
    %w[0 31 invalid 1.5].each do |value|
      ENV['JOBS_POD_NETWORK_PROBE_TIMEOUT'] = value
      assert_equal 6, Network.probe_timeout
    end
  end

  def test_proxy_validation_rejects_injection_and_unsupported_schemes
    %w[http://localhost:8080 https://proxy.example socks5h://localhost:1080].each do |value|
      assert Network.valid_proxy_url?(value), value
    end
    ['file:///tmp/proxy', "http://localhost:8080\nsecret", 'http://localhost:65536', 'http://localhost/path'].each do |value|
      refute Network.valid_proxy_url?(value), value
    end
  end

  def test_git_probe_checks_real_ref_instead_of_process_exit_status
    expected = "#{'a' * 40}\t#{Network::PROBE_REF}\n"
    captured = nil
    with_stub(:run_bounded, ->(*arguments) { captured = arguments; [expected, true, false] }) do
      assert Network.git_route_usable?(environment: {}, project_root: @project_root, timeout: 1)
    end
    assert_equal ['git', '-c', 'credential.interactive=false', 'ls-remote', '--exit-code', Network::PROBE_URL, Network::PROBE_REF], captured[1]
    assert_equal '0', captured[0]['GIT_TERMINAL_PROMPT']
    assert_equal '/usr/bin/false', captured[0]['GIT_ASKPASS']
    assert_equal '/usr/bin/false', captured[0]['SSH_ASKPASS']
    ["<html>success</html>", "#{'a' * 40}\trefs/heads/main\n", ''].each do |output|
      with_stub(:run_bounded, ->(*_arguments) { [output, true, false] }) do
        refute Network.git_route_usable?(environment: {}, project_root: @project_root, timeout: 1)
      end
    end
  end

  def test_run_bounded_captures_stdout_discards_stderr_and_limits_output
    command = [RbConfig.ruby, '-e', '$stdout.write("fixture-output"); $stderr.write("fixture-secret")']
    output, successful, timed_out = Network.run_bounded({}, command, @project_root, 1)
    assert_equal 'fixture-output', output
    assert successful
    refute timed_out
    output, successful, = Network.run_bounded({}, [RbConfig.ruby, '-e', 'puts "x" * 10000'], @project_root, 1)
    assert_equal Network::OUTPUT_LIMIT, output.bytesize
    refute successful
  end

  def test_timeout_ends_the_process_group_even_when_parent_exits_before_child
    Dir.mktmpdir('jobs-pod-network-test-') do |directory|
      marker = File.join(directory, 'terminated')
      code = 'fork { trap("TERM") { File.write(ARGV[0], "terminated"); exit! }; sleep 30 }; exit!'
      started = Network.monotonic_time
      _output, successful, timed_out = Network.run_bounded({}, [RbConfig.ruby, '-e', code, marker], directory, 0.3)
      elapsed = Network.monotonic_time - started
      refute successful
      assert timed_out
      assert_operator elapsed, :<, 1.5
      assert File.file?(marker), 'grandchild must receive process-group TERM'
    end
  end

  def test_system_candidates_are_probed_in_parallel_with_bounded_round_time
    routes = [Network.proxy_route(:system_https, 'http://one.example:8080'),
              Network.proxy_route(:system_http, 'http://two.example:8080')]
    runner = lambda do |**arguments|
      next false if arguments[:environment].empty?

      sleep 0.15
      false
    end
    started = Network.monotonic_time
    with_stub(:system_proxy_routes, ->(_timeout) { routes }) { assert_equal :unavailable, run_apply(runner).first }
    assert_operator Network.monotonic_time - started, :<, 0.28
  end
end
