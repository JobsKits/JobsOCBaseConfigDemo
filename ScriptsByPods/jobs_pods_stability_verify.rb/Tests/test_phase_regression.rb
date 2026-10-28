#!/usr/bin/env ruby
# 隔离执行真实 runner，验证测试首错停止、链接根因可见与成功路径完整覆盖。
require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'tmpdir'

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
Dir.mktmpdir('jobs-test-phase-') do |root|
  scripts = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_verify.rb')
  tools = File.join(root, 'tools')
  FileUtils.mkdir_p([scripts, tools, File.join(root, 'Pods', 'Pods.xcodeproj')])
  %w[jobs_pods_stability_verify.rb jobs_stability_command.rb jobs_stability_host_entitlements.rb jobs_stability_sources.rb].each do |name|
    FileUtils.cp(File.expand_path('../' + name, __dir__), File.join(scripts, name))
  end
  %w[FixtureA FixtureB].each do |name|
    folder = File.join(root, 'JobsByPods', "#{name}@Pods")
    FileUtils.mkdir_p(File.join(folder, 'Tests'))
    File.write(File.join(folder, "#{name}.podspec"), "spec.test_spec 'Stability'\n")
    File.write(File.join(folder, 'Tests', 'run_regression.rb'), "File.write(ENV.fetch('JOBS_FIXTURE_HARNESS'), 'executed')\n")
  end
  File.write(File.join(tools, 'xcodebuild'), <<~RUBY)
    #!#{RbConfig.ruby}
    if ARGV == ['-version']
      puts 'Xcode 26 fixture'
    elsif ENV['JOBS_FIXTURE_FAIL'] == '1'
      warn "ld: building for 'iOS-simulator', but linking object built for 'iOS'"
      warn 'clang: error: linker command failed with exit code 1'
      exit 65
    end
  RUBY
  File.write(File.join(tools, 'xcrun'), <<~'SHELL')
    #!/bin/sh
    if [ "$1" = "xcresulttool" ]; then
      printf '%s\n' '{"result":"Passed","totalTestCount":2,"passedTests":2,"failedTests":0,"skippedTests":0}'
    else
      exec /usr/bin/xcrun "$@"
    fi
  SHELL
  %w[xcodebuild xcrun].each { |name| File.chmod(0o755, File.join(tools, name)) }
  [true, false].each do |failure|
    output = File.join(root, failure ? 'failed' : 'successful')
    marker = File.join(output, 'harness-called')
    env = { 'PATH' => tools + File::PATH_SEPARATOR + ENV.fetch('PATH'),
            'JOBS_FIXTURE_FAIL' => failure ? '1' : '0', 'JOBS_FIXTURE_HARNESS' => marker }
    message, status = Open3.capture2e(env, RbConfig.ruby, File.join(scripts, 'jobs_pods_stability_verify.rb'),
      '--phase', 'tests', '--architecture', 'arm64', '--simulator', 'fixture-udid', '--output', output)
    rows = JSON.parse(File.read(File.join(output, 'results.json'))).fetch('results')
    tests = rows.select { |row| row['kind'] == 'test' }
    if failure
      assert.call(!status.success?, 'failed test phase returned success')
      assert.call(tests.map { |row| row['name'] } == ['FixtureA'], 'runner continued to unrelated tests after first failure')
      assert.call(message.include?("ld: building for 'iOS-simulator'"), 'linker root cause was removed from console diagnostics')
      assert.call(!File.exist?(marker) && rows.none? { |row| row['kind'] == 'harness' }, 'runner continued to harness after test failure')
    else
      assert.call(status.success?, "successful phase failed: #{message}")
      assert.call(tests.map { |row| row['name'] } == %w[FixtureA FixtureB], 'successful phase lost test coverage')
      assert.call(rows.count { |row| row['kind'] == 'harness' && row['exit_status'] == 0 } == 2, 'successful phase lost harness coverage')
    end
    assert.call(tests.all? { |row| row['command'].include?('platform=iOS Simulator,id=fixture-udid,arch=arm64') }, 'test destination architecture is ambiguous')
  end
end

# 平台签名工具显式造桩；runner、独立命令进程和结果合同仍按真实入口执行。
Dir.mktmpdir('jobs-split-test-phase-') do |root|
  scripts = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_verify.rb')
  tools = File.join(root, 'tools')
  FileUtils.mkdir_p([scripts, tools, File.join(root, 'Pods', 'Pods.xcodeproj')])
  %w[jobs_pods_stability_verify.rb jobs_stability_command.rb jobs_stability_host_entitlements.rb jobs_stability_sources.rb].each do |name|
    FileUtils.cp(File.expand_path('../' + name, __dir__), File.join(scripts, name))
  end
  fixture_pods = %w[FixtureA FixtureB JobsBaseUI JobsOCSnowflake]
  expected_suites = fixture_pods.flat_map do |name|
    (name == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']).map { |configuration| [name, configuration] }
  end
  fixture_pods.each do |name|
    folder = File.join(root, 'JobsByPods', "#{name}@Pods")
    FileUtils.mkdir_p(File.join(folder, 'Tests'))
    File.write(File.join(folder, "#{name}.podspec"), "spec.test_spec 'Stability'\n")
    File.write(File.join(folder, 'Tests', 'run_regression.rb'),
      "File.open(ENV.fetch('JOBS_FIXTURE_HARNESS'), 'a') { |file| file.puts(#{name.inspect}) }\n")
  end
  File.write(File.join(tools, 'xcodebuild'), "#!#{RbConfig.ruby}\n" + <<~'RUBY')
    require 'json'
    if ARGV == ['-version']
      puts 'Xcode 26 fixture'
      exit(0)
    end
    action = %w[build-for-testing test-without-building test].find { |value| ARGV.include?(value) }
    scheme = ARGV.fetch(ARGV.index('-scheme') + 1)
    configuration = ARGV.fetch(ARGV.index('-configuration') + 1)
    File.open(ENV.fetch('JOBS_FIXTURE_EVENTS'), 'a') do |file|
      file.puts(JSON.generate(action: action, scheme: scheme, configuration: configuration, command: ARGV))
    end
    if action == ENV['JOBS_FIXTURE_FAIL_ACTION'] && scheme == 'FixtureA-Unit-Stability'
      warn 'ld: fixture test-host or test-bundle link failure'
      exit(65)
    end
  RUBY
  # 系统Ruby启动也调用xcrun，入口必须是Shell，避免解释器递归自启。
  File.write(File.join(tools, 'xcrun'), <<~'SHELL')
    #!/bin/sh
    if [ "$1" != "xcresulttool" ]; then
      exec /usr/bin/xcrun "$@"
    fi
    printf '%s\n' "$*" >> "$JOBS_FIXTURE_QUERIES"
    case "$JOBS_FIXTURE_SUMMARY" in
      invalid) printf '%s\n' 'not a valid XCTest summary' ;;
      zero) printf '%s\n' '{"result":"Passed","totalTestCount":0,"passedTests":0,"failedTests":0,"skippedTests":0}' ;;
      *) printf '%s\n' '{"result":"Passed","totalTestCount":2,"passedTests":2,"failedTests":0,"skippedTests":0}' ;;
    esac
  SHELL
  signature_fixture = File.join(tools, 'signature_fixture.rb')
  File.write(signature_fixture, <<~'RUBY')
    require 'json'
    require 'open3'
    fixture_status = Struct.new(:exitstatus) do
      def success?
        exitstatus.zero?
      end
    end.new(0)
    original_capture2e = Open3.method(:capture2e)
    original_capture3 = Open3.method(:capture3)
    Open3.define_singleton_method(:capture2e) do |*args, **options|
      if args.first == '/usr/bin/plutil' && args.include?('CFBundleIdentifier')
        ["fixture.JobsBaseUI\n", fixture_status]
      elsif args.first == '/usr/bin/codesign'
        ['', fixture_status]
      else
        original_capture2e.call(*args, **options)
      end
    end
    Open3.define_singleton_method(:capture3) do |*args, **options|
      if args.first == '/usr/bin/codesign'
        ['', '<plist/>', fixture_status]
      elsif args.first == '/usr/bin/plutil' && args.include?('-convert')
        permissions = { 'application-identifier' => 'fixture.JobsBaseUI',
          'keychain-access-groups' => ['fixture.JobsBaseUI'], 'get-task-allow' => true }
        [JSON.generate(permissions), '', fixture_status]
      else
        original_capture3.call(*args, **options)
      end
    end
  RUBY
  %w[xcodebuild xcrun].each { |name| File.chmod(0o755, File.join(tools, name)) }
  run_fixture = lambda do |label, separate: true, output: nil, failure_action: '', summary: 'passed'|
    output ||= File.join(root, label)
    FileUtils.mkdir_p(output)
    events = File.join(output, 'command-events.jsonl')
    queries = File.join(output, 'summary-queries.jsonl')
    marker = File.join(output, 'harness-called')
    [events, queries, marker].each { |path| File.write(path, '') }
    record_path = File.join(output, 'results.json')
    previous_count = File.file?(record_path) ? JSON.parse(File.read(record_path)).fetch('results').size : 0
    env = { 'PATH' => tools + File::PATH_SEPARATOR + ENV.fetch('PATH'),
      'RUBYOPT' => '-r' + signature_fixture, 'JOBS_FIXTURE_EVENTS' => events,
      'JOBS_FIXTURE_QUERIES' => queries, 'JOBS_FIXTURE_HARNESS' => marker,
      'JOBS_FIXTURE_FAIL_ACTION' => failure_action, 'JOBS_FIXTURE_SUMMARY' => summary }
    command = [RbConfig.ruby, File.join(scripts, 'jobs_pods_stability_verify.rb'),
      '--phase', 'tests', '--architecture', 'arm64', '--simulator', 'fixture-udid',
      '--build-timeout', '1800', '--test-timeout', '600', '--output', output]
    command << '--separate-test-builds' if separate
    message, status = Open3.capture2e(env, *command)
    rows = JSON.parse(File.read(record_path)).fetch('results')
    { output: output, record_path: record_path, message: message, status: status, rows: rows,
      new_rows: rows.drop(previous_count), events: File.readlines(events).map { |line| JSON.parse(line) },
      queries: File.readlines(queries), harness: File.readlines(marker, chomp: true) }
  end

  success = run_fixture.call('split-success')
  tests = success[:rows].select { |row| row['kind'] == 'test' }
  builds = success[:rows].select { |row| row['kind'] == 'test_build' }
  assert.call(success[:status].success?, "split phase failed: #{success[:message]}")
  assert.call(tests.map { |row| row.values_at('name', 'configuration') } == expected_suites,
    'split phase lost a suite or Snowflake configuration')
  assert.call(builds.map { |row| row.values_at('name', 'configuration') } == expected_suites,
    'split phase did not prepare every exact suite/configuration')
  assert.call(success[:events].map { |event| event.values_at('action', 'scheme', 'configuration') } ==
    expected_suites.flat_map { |name, configuration| %w[build-for-testing test-without-building].map { |action| [action, name + '-Unit-Stability', configuration] } },
    'split phase did not prepare each bundle before executing it exactly once')
  assert.call(success[:harness] == fixture_pods && success[:rows].count { |row| row['kind'] == 'harness' && row['exit_status'] == 0 } == 4,
    'split success lost harness coverage')
  assert.call(builds.all? { |row| row['timeout_seconds'] == 1800 && row['execution_mode'] == 'separate-test-build' } &&
    tests.all? { |row| row['timeout_seconds'] == 600 && row['execution_mode'] == 'test-without-building' },
    'split build and execution budgets or modes were mixed')
  assert.call(builds.all? { |row| !row['command'].include?('-quiet') && row['command'].include?('-showBuildTimingSummary') } &&
    builds.none? { |row| row.key?('test_summary') || row.key?('result_bundle') },
    'preparation hid build progress or claimed XCTest execution evidence')
  evidence_keys = %w[kind name configuration source_fingerprint execution_mode signing_policy started_at log command exit_status source_consistent timed_out process_status_collected process_exit_status process_signal process_pid]
  assert.call(tests.each_with_index.all? { |row, index| row['test_build_record'] == builds[index].select { |key, _| evidence_keys.include?(key) } },
    'test success was not bound to the exact successful preparation record')
  assert.call(tests.each_with_index.all? do |row, index|
    build_command = builds[index]['command']
    %w[-project -scheme -configuration -destination -derivedDataPath].all? do |option|
      row['command'][row['command'].index(option) + 1] == build_command[build_command.index(option) + 1]
    end
  end, 'preparation and execution used different project, target, configuration or destination')
  base_rows = success[:rows].select { |row| %w[test_build test].include?(row['kind']) && row['name'] == 'JobsBaseUI' }
  assert.call(base_rows.size == 2 && base_rows.all? { |row| row['signing_policy'] == 'simulator-adhoc-keychain-v1' &&
    %w[CODE_SIGNING_ALLOWED=YES CODE_SIGNING_REQUIRED=YES CODE_SIGN_IDENTITY=-].all? { |flag| row['command'].include?(flag) } },
    'split preparation lost the BaseUI host signing policy')
  assert.call(base_rows.last.fetch('host_signature').fetch('valid'), 'explicit BaseUI platform-signature fixture no longer reaches the host audit')

  cached = run_fixture.call('split-cached', output: success[:output])
  assert.call(cached[:status].success? && cached[:events].empty?, 'unchanged split success was not reused from its bound evidence')
  altered = JSON.parse(File.read(success[:record_path]))
  altered.fetch('results').find { |row| row['kind'] == 'test' }.fetch('test_build_record')['process_pid'] = -1
  File.write(success[:record_path], JSON.pretty_generate(altered))
  rebound = run_fixture.call('split-rebound', output: success[:output])
  assert.call(rebound[:status].success? && rebound[:events].map { |event| event.values_at('action', 'scheme') } == [['test-without-building', 'FixtureA-Unit-Stability']],
    'changed preparation identity incorrectly reused a cached test result')
  File.unlink(builds.first.fetch('log'))
  rebuilt = run_fixture.call('split-missing-prep-log', output: success[:output])
  assert.call(rebuilt[:status].success? && rebuilt[:events].map { |event| event.values_at('action', 'scheme') } ==
    [['build-for-testing', 'FixtureA-Unit-Stability'], ['test-without-building', 'FixtureA-Unit-Stability']],
    'missing preparation log was accepted as reusable evidence')

  legacy_first = run_fixture.call('legacy-to-split', separate: false)
  split_after = run_fixture.call('legacy-to-split', output: legacy_first[:output])
  assert.call(legacy_first[:status].success? && split_after[:status].success? && split_after[:events].size == expected_suites.size * 2,
    'legacy test evidence was accepted as split preparation or execution')
  split_first = run_fixture.call('split-to-legacy')
  legacy_after = run_fixture.call('split-to-legacy', separate: false, output: split_first[:output])
  assert.call(split_first[:status].success? && legacy_after[:status].success? &&
    legacy_after[:events].map { |event| event['action'] } == Array.new(expected_suites.size, 'test'),
    'split execution evidence was accepted by the legacy test path')

  failed_build = run_fixture.call('split-build-failed', failure_action: 'build-for-testing')
  assert.call(!failed_build[:status].success? && failed_build[:events].size == 1 &&
    failed_build[:rows].map { |row| row['kind'] } == ['test_build'] && failed_build[:rows].first['exit_status'] == 65,
    'failed preparation continued to test execution or unrelated suites')
  assert.call(failed_build[:queries].empty? && failed_build[:harness].empty? &&
    failed_build[:message].include?('ld: fixture test-host or test-bundle link failure'),
    'failed preparation queried a partial result, ran harnesses or hid its link error')
  failed_test = run_fixture.call('split-test-failed', failure_action: 'test-without-building')
  assert.call(!failed_test[:status].success? && failed_test[:events].map { |event| event['action'] } == %w[build-for-testing test-without-building] &&
    failed_test[:rows].select { |row| row['kind'] == 'test' }.map { |row| row['name'] } == ['FixtureA'] && failed_test[:harness].empty?,
    'split execution failure did not stop at the first failing suite')
  %w[zero invalid].each do |summary|
    rejected = run_fixture.call('split-summary-' + summary, summary: summary)
    rejected_tests = rejected[:rows].select { |row| row['kind'] == 'test' }
    assert.call(!rejected[:status].success? && rejected_tests.size == 1 && rejected_tests.first['exit_status'] == 76 &&
      rejected_tests.first.key?('validation_error') && rejected[:harness].empty?,
      "split mode accepted #{summary} XCTest evidence or continued to harnesses")
  end
end
puts "PASS: #{checks} test phase checks"
