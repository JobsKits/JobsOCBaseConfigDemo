# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'timeout'

# 用途：验证 Homebrew 的短探测选路、显式配置保护、失败传播及进程内代理边界。
# 运行：在本目录执行 ruby ./network_regression.rb；可用 JOBS_BREW_TEST_SCRIPT 指向待测脚本。
# 边界：只 source 真实函数；系统代理、联网探测与业务命令均为夹具，不运行真实安装或更新。
class JobsBrewNetworkRegressionTest < Minitest::Test
  PACKAGE = File.expand_path('../..', __dir__)
  SCRIPT = ENV.fetch('JOBS_BREW_TEST_SCRIPT') { File.join(PACKAGE, File.basename(PACKAGE)) }
  PROXY_KEYS = %w[http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY].freeze
  ALL_KEYS = (PROXY_KEYS + %w[no_proxy NO_PROXY]).freeze
  SYSTEM_PROXY = 'http://127.0.0.1:7990'
  SNAPSHOT = <<~TEXT
    <dictionary> {
      HTTPEnable : 1
      HTTPProxy : 127.0.0.1
      HTTPPort : 7990
      HTTPSEnable : 1
      HTTPSProxy : 127.0.0.1
      HTTPSPort : 7990
      ExceptionsList : <array> {
        0 : *.local
        1 : 127.0.0.0/8
      }
    }
  TEXT

  def setup
    @temporary = Dir.mktmpdir('jobs-brew-network-')
    @trace = File.join(@temporary, 'trace')
    @snapshot = File.join(@temporary, 'proxy-snapshot')
    @library = File.join(@temporary, 'functions.zsh')
    source = File.read(SCRIPT)
    raise "缺少网络函数：#{SCRIPT}" unless source.include?('jobs_brew_prepare_network()')

    File.write(@library, source.sub(/\nmain "\$@"\s*\z/, "\n"))
    File.write(@snapshot, SNAPSHOT)
    @environment = {
      'HOME' => @temporary, 'TMPDIR' => @temporary, 'PATH' => '/usr/bin:/bin:/usr/sbin:/sbin',
      'FIXTURE_LIBRARY' => @library, 'FIXTURE_TRACE' => @trace,
      'FIXTURE_SNAPSHOT' => @snapshot, 'NO_COLOR' => '1', 'TERM' => 'dumb'
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary)
  end

  def test_healthy_system_proxy_is_preferred_and_parent_environment_is_untouched
    output, result = shell(<<~'ZSH', 'no_proxy' => 'keep.example', 'NO_PROXY' => 'UPPER.example')
      jobs_brew_prepare_network || exit $?
      jobs_brew_run_network fixture_command || exit $?
      fixture_record_state parent
    ZSH
    assert result.success?, output
    assert_equal 1, commands.length, output
    assert probes.all? { |line| line.include?(SYSTEM_PROXY) }, probes.inspect
    assert_equal SYSTEM_PROXY, state('command', 'https_proxy')
    assert_equal '<unset>', state('parent', 'https_proxy')
    assert_equal 'keep.example', state('parent', 'no_proxy')
    assert_equal 'UPPER.example', state('parent', 'NO_PROXY')
    assert_includes state('command', 'no_proxy'), 'keep.example'
    assert_includes state('command', 'NO_PROXY'), 'UPPER.example'
  end

  def test_failed_system_proxy_falls_back_to_current_route_before_running_business_once
    output, result = shell('jobs_brew_run_network fixture_command', 'FIXTURE_ROUTE_FAILURE' => 'proxy')
    assert result.success?, output
    assert probes.any? { |entry| entry.include?(SYSTEM_PROXY) }
    assert probes.any? { |entry| entry.start_with?('probe:<current>|') }
    assert_equal 1, commands.length
    assert_equal '<unset>', state('command', 'https_proxy')
  end

  def test_unavailable_routes_skip_business_and_return_failure
    output, result = shell('jobs_brew_run_network fixture_command', 'FIXTURE_ROUTE_FAILURE' => 'all')
    refute result.success?, output
    assert_empty commands
    assert probes.any? { |entry| entry.start_with?('probe:<current>|') }
  end

  def test_route_failure_is_cached_without_retrying_or_running_commands
    output, result = shell(<<~'ZSH', 'FIXTURE_ROUTE_FAILURE' => 'all')
      jobs_brew_prepare_network
      first_result=$?
      jobs_brew_prepare_network
      second_result=$?
      [[ "$first_result" != 0 && "$second_result" != 0 ]] || exit 67
      jobs_brew_run_network fixture_command
    ZSH
    refute result.success?, output
    assert_empty commands
    assert_equal 1, probes.count { |entry| entry.start_with?('probe:<current>|') }
  end

  def test_explicit_proxy_values_and_empty_proxy_variables_are_preserved
    PROXY_KEYS.each do |key|
      ['', 'http://fixture-user:fixture-password@explicit.invalid:8123'].each do |value|
        clear_trace
        output, result = shell(<<~'ZSH', key => value, 'no_proxy' => 'local.example', 'NO_PROXY' => 'UPPER.local')
          jobs_brew_run_network fixture_command || exit $?
          fixture_record_state parent
        ZSH
        assert result.success?, "#{key}=#{value.empty? ? '<empty>' : '<configured>'}\n#{output}"
        assert_equal value, state('command', key)
        assert_equal value, state('parent', key)
        assert_equal 'local.example', state('command', 'no_proxy')
        assert_equal 'UPPER.local', state('command', 'NO_PROXY')
        assert probes.all? { |entry| entry.start_with?('probe:<current>|') }, probes.inspect
        refute_includes output, 'fixture-user'
        refute_includes output, 'fixture-password'
      end
    end
  end

  def test_explicit_git_proxy_keeps_current_route_and_no_proxy_values
    output, result = shell('jobs_brew_run_network fixture_command',
                           'FIXTURE_GIT_EXPLICIT' => '1', 'NO_PROXY' => 'keep.example')
    assert result.success?, output
    assert_equal 1, commands.length
    assert_equal '<unset>', state('command', 'http_proxy')
    assert_equal 'keep.example', state('command', 'NO_PROXY')
    assert probes.all? { |entry| entry.start_with?('probe:<current>|') }, probes.inspect
  end

  def test_failed_explicit_proxy_never_switches_routes_or_runs_business
    output, result = shell('jobs_brew_run_network fixture_command',
                           'https_proxy' => 'http://explicit.invalid:8123', 'FIXTURE_ROUTE_FAILURE' => 'all')
    refute result.success?, output
    assert_empty commands
    assert_equal 1, probes.length
    assert probes.first.start_with?('probe:<current>|'), probes.inspect
  end

  def test_business_failure_is_propagated_without_replay
    output, result = shell('jobs_brew_run_network fixture_command', 'FIXTURE_COMMAND_EXIT' => '23')
    assert_equal 23, result.exitstatus, output
    assert_equal 1, commands.length
  end

  def test_network_selection_is_cached_across_successive_commands
    output, result = shell(<<~'ZSH')
      jobs_brew_prepare_network || exit $?
      jobs_brew_run_network fixture_command || exit $?
      jobs_brew_run_network fixture_command
    ZSH
    assert result.success?, output
    assert_equal 2, commands.length
    assert_equal 2, probes.length
  end

  def test_no_system_proxy_uses_current_route
    File.write(@snapshot, '<dictionary> {}')
    output, result = shell('jobs_brew_run_network fixture_command')
    assert result.success?, output
    assert_equal 1, commands.length
    assert probes.all? { |entry| entry.start_with?('probe:<current>|') }
    assert_equal '<unset>', state('command', 'http_proxy')
  end

  def test_non_http_source_runs_once_without_http_probe
    output, result = shell(<<~'ZSH')
      JOBS_BREW_NETWORK_SOURCE_URLS=(/local/brew.git git@github.com:Homebrew/brew.git)
      jobs_brew_run_network fixture_command
    ZSH
    assert result.success?, output
    assert_empty probes
    assert_equal 1, commands.length
  end

  def test_system_bypass_matching_current_source_keeps_current_route
    File.write(@snapshot, SNAPSHOT.sub('127.0.0.0/8', '*github*'))
    output, result = shell('jobs_brew_run_network fixture_command')
    assert result.success?, output
    assert probes.all? { |entry| entry.start_with?('probe:<current>|') }, probes.inspect
    assert_equal '<unset>', state('command', 'http_proxy')
  end

  def test_source_credentials_and_query_are_not_printed_or_probed
    output, result = shell(<<~'ZSH')
      JOBS_BREW_NETWORK_SOURCE_URLS=('https://fixture-user:fixture-password@github.com/Homebrew/brew?token=fixture-token')
      jobs_brew_run_network fixture_command
    ZSH
    assert result.success?, output
    refute_includes output, 'fixture-user'
    refute_includes output, 'fixture-password'
    refute_includes output, 'fixture-token'
    assert probes.all? { |entry| entry.end_with?('|https://github.com/') }, probes.inspect
  end

  def test_native_probe_bounds_connect_and_total_time_without_disabling_tls
    output, result = shell(real_probe_fixture + <<~'ZSH', 'JOBS_BREW_NETWORK_CONNECT_TIMEOUT' => 'invalid', 'JOBS_BREW_NETWORK_PROBE_TIMEOUT' => '0')
      fixture_real_probe_route '' https://github.com/
    ZSH
    assert result.success?, output
    arguments = events.grep(/^curl:/)
    assert_equal 1, arguments.length
    assert_includes arguments.first, '--connect-timeout 2 --max-time 4'
    assert_includes arguments.first, '--proto =http,https'
    assert_includes arguments.first, '--head'
    refute_match(/(?:^|\s)(?:-k|--insecure)(?:\s|$)/, arguments.first)
  end

  def test_native_probe_rejects_proxy_authentication_failure_and_network_timeout
    [ ['407', '0'], ['000', '0'], ['200', '28'] ].each do |code, exit_code|
      clear_trace
      output, result = shell(real_probe_fixture + "fixture_real_probe_route '' https://github.com/",
                             'FIXTURE_CURL_CODE' => code, 'FIXTURE_CURL_EXIT' => exit_code)
      refute result.success?, "code=#{code} exit=#{exit_code} #{output}"
      assert_equal 1, events.grep(/^curl:/).length
    end
  end

  def test_native_probe_respects_explicit_empty_git_proxy
    output, result = shell(real_probe_fixture + <<~'ZSH', 'FIXTURE_GIT_PROXY_FOUND' => '1', 'FIXTURE_GIT_PROXY_VALUE' => '')
      jobs_brew_collect_probe_urls
      fixture_real_git_proxy_is_explicit || exit $?
      fixture_real_probe_route '' https://github.com/ https://github.com/Homebrew/brew
    ZSH
    assert result.success?, output
    assert events.any? { |entry| entry.include?('config --get-urlmatch http.proxy ') }
    assert_includes events.grep(/^curl:/).first, '--proxy  https://github.com/'
  end

  def test_ipv4_wildcard_bypasses_are_preserved_as_equivalent_cidrs
    File.write(@snapshot, SNAPSHOT.sub('127.0.0.0/8', '127.*,10.*,172.16.*,192.168.*'))
    output, result = shell('jobs_brew_run_network fixture_command')
    assert result.success?, output
    assert_equal SYSTEM_PROXY, state('command', 'https_proxy')
    %w[127.0.0.0/8 10.0.0.0/8 172.16.0.0/16 192.168.0.0/16].each do |rule|
      assert_includes state('command', 'NO_PROXY'), rule
    end
  end

  def test_unrelated_complex_system_bypasses_do_not_disable_proxy_for_selected_sources
    File.write(@snapshot, SNAPSHOT.sub('127.0.0.0/8', '*zhihu.com,*zhimg.com'))
    output, result = shell('jobs_brew_run_network fixture_command')
    assert result.success?, output
    assert_equal SYSTEM_PROXY, state('command', 'https_proxy')
    assert probes.all? { |entry| entry.include?(SYSTEM_PROXY) }
  end

  def test_existing_git_runtime_configuration_is_appended_only_in_child
    output, result = shell(<<~'ZSH', 'GIT_CONFIG_COUNT' => '1', 'GIT_CONFIG_KEY_0' => 'http.extraHeader', 'GIT_CONFIG_VALUE_0' => 'fixture-header')
      jobs_brew_run_network fixture_command || exit $?
      fixture_record_state parent
    ZSH
    assert result.success?, output
    assert_equal '2', state('command', 'GIT_CONFIG_COUNT')
    assert_equal 'http.extraHeader', state('command', 'GIT_CONFIG_KEY_0')
    assert_equal 'fixture-header', state('command', 'GIT_CONFIG_VALUE_0')
    assert_equal 'http.proxy', state('command', 'GIT_CONFIG_KEY_1')
    assert_equal SYSTEM_PROXY, state('command', 'GIT_CONFIG_VALUE_1')
    assert_equal '1', state('parent', 'GIT_CONFIG_COUNT')
    assert_equal '<unset>', state('parent', 'GIT_CONFIG_KEY_1')
  end

  def test_leading_zero_git_configuration_count_uses_canonical_numeric_key
    output, result = shell('jobs_brew_run_network fixture_command', 'GIT_CONFIG_COUNT' => '00')
    assert result.success?, output
    assert_equal '1', state('command', 'GIT_CONFIG_COUNT')
    assert_equal 'http.proxy', state('command', 'GIT_CONFIG_KEY_0')
    assert_equal SYSTEM_PROXY, state('command', 'GIT_CONFIG_VALUE_0')
  end

  def test_invalid_git_runtime_configuration_stops_without_running_command
    output, result = shell('jobs_brew_run_network fixture_command', 'GIT_CONFIG_COUNT' => 'invalid')
    refute result.success?, output
    assert_empty commands
  end

  def test_custom_http_sources_use_their_actual_hosts
    output, result = shell(<<~'ZSH')
      JOBS_BREW_NETWORK_SOURCE_URLS=(https://mirror.example/brew.git https://api.example/custom-api)
      jobs_brew_run_network fixture_command
    ZSH
    assert result.success?, output
    assert_equal 2, probes.length
    assert probes.any? { |entry| entry.end_with?('|https://mirror.example/') }
    assert probes.any? { |entry| entry.end_with?('|https://api.example/') }
    refute probes.any? { |entry| entry.include?('github.com') }
  end

  def test_host_wrapper_preflight_failure_never_enters_logger_or_command
    host_wrapper = File.basename(SCRIPT).include?('codegraph_init') ? 'codegraph_brew_run_network' : 'report_brew_run_network'
    return unless File.read(SCRIPT).include?("#{host_wrapper}()")

    output, result = shell(<<~ZSH, 'FIXTURE_ROUTE_FAILURE' => 'all')
      report_run_logged() { print -r -- logger:executed >> "$FIXTURE_TRACE"; "$@"; }
      codegraph_run_logged() { print -r -- logger:executed >> "$FIXTURE_TRACE"; "$@"; }
      #{host_wrapper} fixture_command
    ZSH
    refute result.success?, output
    assert_empty commands
    refute_includes events, 'logger:executed'
  end

  def test_both_homebrew_installer_paths_use_preflight_before_downloading
    return unless File.read(SCRIPT).include?('jobs_brew_install_system()')

    %w[jobs_brew_install_system jobs_brew_install_user].each do |installer|
      clear_trace
      fixture = <<~'ZSH'
        curl() { print -r -- download:executed >> "$FIXTURE_TRACE"; return 99; }
        git() { [[ "$1" == --version ]] && print -r -- 'git fixture'; }
      ZSH
      output, result = shell(fixture + installer, 'FIXTURE_ROUTE_FAILURE' => 'all')
      refute result.success?, "#{installer}: #{output}"
      refute_includes events, 'download:executed'
      refute_empty probes, "#{installer} did not use network preflight"
    end
  end

  def test_path_specific_git_proxy_and_empty_proxy_are_respected_by_real_git_lookup
    ['http://path-proxy.invalid:8123', ''].each do |proxy|
      clear_trace
      environment = { 'GIT_CONFIG_COUNT' => '1', 'GIT_CONFIG_KEY_0' => 'http.https://github.com/Homebrew/.proxy',
                      'GIT_CONFIG_VALUE_0' => proxy }
      output, result = shell(<<~'ZSH', environment)
        jobs_brew_git_proxy_is_explicit() { fixture_real_git_proxy_is_explicit; }
        jobs_brew_run_network fixture_command || exit $?
        fixture_record_state parent
      ZSH
      assert result.success?, output
      assert probes.all? { |entry| entry.start_with?('probe:<current>|') }, probes.inspect
      assert_equal '<unset>', state('command', 'https_proxy')
      assert_equal '1', state('command', 'GIT_CONFIG_COUNT')
      assert_equal proxy, state('command', 'GIT_CONFIG_VALUE_0')
      assert_equal proxy, state('parent', 'GIT_CONFIG_VALUE_0')
    end
  end

  def test_native_head_uses_path_git_proxy_only_for_git_source_and_never_for_api
    ['http://path-proxy.invalid:8123', ''].each do |proxy|
      clear_trace
      environment = { 'GIT_CONFIG_COUNT' => '1', 'GIT_CONFIG_KEY_0' => 'http.https://github.com/Homebrew/.proxy',
                      'GIT_CONFIG_VALUE_0' => proxy }
      fixture = <<~'ZSH'
        function /usr/bin/curl() {
          print -r -- "curl:$*" >> "$FIXTURE_TRACE"
          print -nr -- 200
        }
        jobs_brew_collect_probe_urls
        fixture_real_git_proxy_is_explicit || exit $?
        fixture_real_probe_route '' https://github.com/ https://github.com/Homebrew/brew || exit $?
        fixture_real_probe_route '' https://formulae.brew.sh/ ''
      ZSH
      output, result = shell(fixture, environment)
      assert result.success?, output
      arguments = events.grep(/^curl:/)
      assert_equal 2, arguments.length
      assert_includes arguments.first, "--proxy #{proxy} https://github.com/"
      refute_includes arguments.last, '--proxy'
    end
  end

  def test_installers_preflight_their_actual_sources_and_do_not_reuse_maintenance_cache
    return unless File.read(SCRIPT).include?('jobs_brew_install_system()')

    {
      'jobs_brew_install_system' => %w[https://raw.githubusercontent.com/ https://mirror.example/ https://api.example/],
      'jobs_brew_install_user' => %w[https://api.github.com/ https://github.com/]
    }.each do |installer, expected|
      clear_trace
      fixture = <<~'ZSH'
        JOBS_BREW_NETWORK_READY=1
        JOBS_BREW_NETWORK_STATUS=0
        JOBS_BREW_NETWORK_SOURCE_URLS=(https://unrelated.example/maintenance)
        curl() { print -r -- download:executed >> "$FIXTURE_TRACE"; return 99; }
        git() { [[ "$1" == --version ]] && print -r -- 'git fixture'; }
      ZSH
      output, result = shell(fixture + installer, 'HOMEBREW_BREW_GIT_REMOTE' => 'https://mirror.example/brew.git',
                                                 'HOMEBREW_API_DOMAIN' => 'https://api.example/homebrew')
      refute result.success?, "#{installer}: #{output}"
      assert_equal expected, probes.map { |entry| entry.split('|', 2).last }, "#{installer}: #{probes.inspect}"
      assert_equal 1, events.count('download:executed')
    end
  end

  private

  def clear_trace
    FileUtils.rm_f(@trace)
  end

  def events
    File.exist?(@trace) ? File.readlines(@trace, chomp: true) : []
  end

  def probes
    events.grep(/^probe:/)
  end

  def commands
    events.grep(/^command:executed$/)
  end

  def state(context, key)
    line = events.reverse.find { |entry| entry.start_with?("#{context}:#{key}=") }
    line&.split('=', 2)&.last
  end

  def real_probe_fixture
    <<~'ZSH'
      function /usr/bin/git() {
        print -r -- "git:$*" >> "$FIXTURE_TRACE"
        [[ "${FIXTURE_GIT_PROXY_FOUND:-0}" == 1 ]] || return 1
        print -r -- "${FIXTURE_GIT_PROXY_VALUE:-}"
      }
      function /usr/bin/curl() {
        print -r -- "curl:$*" >> "$FIXTURE_TRACE"
        print -nr -- "${FIXTURE_CURL_CODE:-200}"
        return "${FIXTURE_CURL_EXIT:-0}"
      }
    ZSH
  end

  def shell(body, environment = {})
    setup = <<~'ZSH'
      source "$FIXTURE_LIBRARY"
      JOBS_BREW_NETWORK_READY=0
      JOBS_BREW_NETWORK_STATUS=1
      JOBS_BREW_NETWORK_PROXY=""
      JOBS_BREW_NETWORK_SOURCE_URLS=(https://github.com/Homebrew/brew https://formulae.brew.sh/api)
      functions[fixture_real_probe_route]="$functions[jobs_brew_probe_route]"
      functions[fixture_real_git_proxy_is_explicit]="$functions[jobs_brew_git_proxy_is_explicit]"
      jobs_brew_note() { print -r -- "NOTE:$*"; }
      jobs_brew_system_proxy_snapshot() { /bin/cat "$FIXTURE_SNAPSHOT"; }
      jobs_brew_git_proxy_is_explicit() { [[ "${FIXTURE_GIT_EXPLICIT:-0}" == 1 ]]; }
      jobs_brew_probe_route() {
        print -r -- "probe:${1:-<current>}|$2" >> "$FIXTURE_TRACE"
        [[ "${FIXTURE_ROUTE_FAILURE:-}" != all ]] || return 28
        [[ "${FIXTURE_ROUTE_FAILURE:-}" != proxy || -z "$1" ]] || return 28
        return 0
      }
      fixture_record_state() {
        local context="$1" key=""
        for key in http_proxy https_proxy all_proxy HTTP_PROXY HTTPS_PROXY ALL_PROXY no_proxy NO_PROXY GIT_CONFIG_COUNT GIT_CONFIG_KEY_0 GIT_CONFIG_VALUE_0 GIT_CONFIG_KEY_1 GIT_CONFIG_VALUE_1; do
          if (( ${+parameters[$key]} )); then
            print -r -- "$context:$key=${(P)key}" >> "$FIXTURE_TRACE"
          else
            print -r -- "$context:$key=<unset>" >> "$FIXTURE_TRACE"
          fi
        done
      }
      fixture_command() {
        print -r -- command:executed >> "$FIXTURE_TRACE"
        fixture_record_state command
        return "${FIXTURE_COMMAND_EXIT:-0}"
      }
    ZSH
    output = error = result = nil
    Timeout.timeout(8) do
      output, error, result = Open3.capture3(@environment.merge(environment), '/bin/zsh', '-f', '-c', setup + body,
                                             unsetenv_others: true, chdir: @temporary)
    end
    [output + error, result]
  end
end
