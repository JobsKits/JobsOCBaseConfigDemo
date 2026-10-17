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
puts "PASS: #{checks} test phase checks"
