# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'rbconfig'
require_relative '../jobs_cocoapods_network'

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
    module_path = File.expand_path('../jobs_cocoapods_network.rb', __dir__)
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
