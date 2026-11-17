# Created by Jobs on 2026年11月16日，星期一.
# 验证 CI 实际使用的路径、Xcode 选择与失败传递，不构建或发布 App。
require 'fileutils'
require 'open3'
require 'rbconfig'
require 'shellwords'
require 'tmpdir'
require 'yaml'

def check(condition, message)
  raise message unless condition
end

def load_workflow(root, filename)
  YAML.load_file(File.join(root, '.github/workflows', filename))
end

def verify_graph(root, workflow, directory)
  job = workflow.fetch('jobs').fetch('generate-protocol-graph')
  graph_env = job.fetch('env')
  source = graph_env.fetch('PROTOCOL_SOURCE_DIR')
  headers = Dir.glob(File.join(root, source, '**/*.h'))
  check(!headers.empty?, "Protocol headers missing: #{source}")
  check(File.dirname(graph_env.fetch('GRAPH_PNG_PATH')) == source, 'Graph image must remain with its protocol source')
  events = workflow['on'] || workflow.fetch(true)
  %w[push pull_request].each do |event|
    globs = events.fetch(event).fetch('paths')
    headers.each do |header|
      relative = header.delete_prefix(root + '/')
      check(globs.any? { |glob| File.fnmatch?(glob, relative, File::FNM_PATHNAME) }, "#{event} does not cover #{relative}")
    end
  end
  script = File.join(root, '.github/scripts/generate_objc_protocol_graph.rb')
  output = File.join(directory, '协议图 空格.mmd')
  stdout, stderr, result = Open3.capture3(RbConfig.ruby, script, File.join(root, source), output)
  check(result.success?, "Graph generation failed: #{stdout}#{stderr}")
  graph = File.read(output)
  check(graph.include?('classDiagram') && graph.include?('<<protocol>>'), 'Generated graph contains no protocols')
  missing_output = File.join(directory, 'missing.mmd')
  _, _, result = Open3.capture3(RbConfig.ruby, script, File.join(directory, 'missing'), missing_output)
  check(result.exitstatus == 64 && !File.exist?(missing_output), 'Missing protocol source must fail without producing a graph')
  empty_source = File.join(directory, 'empty')
  FileUtils.mkdir_p(empty_source)
  _, _, result = Open3.capture3(RbConfig.ruby, script, empty_source, missing_output)
  check(result.exitstatus == 1 && !File.exist?(missing_output), 'An empty protocol directory must fail')
end

def verify_xcode(root, workflow, directory)
  job = workflow.fetch('jobs').fetch('build-simulator-app')
  check(job.fetch('runs-on') == 'xcode-27', 'Xcode 27 selection requires the xcode-27 runner image')
  steps = job.fetch('steps')
  selection = steps.find { |step| step['name'] == 'Select Xcode 27 SDK' }
  check(selection, 'Xcode 27 selection step missing')
  build = steps.index { |step| step['name'] == 'Build Rust OCR from source' }
  pods = steps.index { |step| step['name'] == 'Install CocoaPods dependencies' }
  rust = steps.index { |step| step['name'] == 'Prepare Rust toolchain' }
  check(build && pods && build < pods, 'Rust OCR source build must run before CocoaPods dependencies')
  check(rust && rust < build, 'The Rust toolchain must be prepared before building OCR')
  check(steps.fetch(rust).fetch('run').include?('rustup toolchain install 1.95.0 --profile minimal'), 'Prepare the pinned toolchain without changing the user default')
  check(steps.fetch(build).fetch('env').fetch('RUSTUP_TOOLCHAIN') == '1.95.0', 'The OCR process must use the prepared toolchain')
  check(steps.fetch(build).fetch('run').include?('--non-interactive'), 'CI must use the explicit unattended OCR mode')
  command = Shellwords.split(steps.fetch(build).fetch('run'))
  script = File.expand_path(command.fetch(1), root)
  sdk = File.dirname(File.dirname(script))
  check(File.file?(script), "OCR build script missing: #{script}")
  %w[Cargo.toml Cargo.lock src/lib.rs].each do |path|
    check(File.file?(File.join(sdk, 'Source/JobsOCR', path)), "OCR source package missing: #{path}")
  end
  fake_bin = File.join(directory, 'bin')
  developer = File.join(directory, 'Xcode 中文 空格.app/Contents/Developer')
  FileUtils.mkdir_p([fake_bin, developer])
  fake_xcodebuild = File.join(fake_bin, 'xcodebuild')
  File.write(fake_xcodebuild, "#!/bin/sh\n[ \"$1\" = '-version' ] || exit 90\n[ \"${JOBS_TEST_XCODE_EXIT:-0}\" = 0 ] || exit \"$JOBS_TEST_XCODE_EXIT\"\nprintf 'Xcode %s\\nBuild version fixture\\n' \"$JOBS_TEST_XCODE_VERSION\"\n")
  FileUtils.chmod(0o700, fake_xcodebuild)
  env = {
    'PATH' => fake_bin + File::PATH_SEPARATOR + ENV.fetch('PATH'),
    'XCODE_27_DEVELOPER_DIR' => developer,
    'DEVELOPER_DIR' => nil,
    'GITHUB_ENV' => File.join(directory, 'github.env'),
    'JOBS_TEST_XCODE_VERSION' => '27.2',
    'JOBS_TEST_XCODE_EXIT' => '0'
  }
  stdout, stderr, result = Open3.capture3(env, '/bin/bash', '-e', '-c', selection.fetch('run'), chdir: root)
  check(result.success?, "Xcode 27 fixture failed: #{stdout}#{stderr}")
  check(File.read(env.fetch('GITHUB_ENV')).include?("DEVELOPER_DIR=#{developer}\n"), 'Selected developer directory was not exported intact')
  stdout, stderr, result = Open3.capture3(env.merge('JOBS_TEST_XCODE_VERSION' => '26.4'), '/bin/bash', '-e', '-c', selection.fetch('run'), chdir: root)
  check(!result.success? && (stdout + stderr).include?('does not provide Xcode 27'), 'Xcode from another major must be rejected')
  _, _, result = Open3.capture3(env.merge('JOBS_TEST_XCODE_EXIT' => '73'), '/bin/bash', '-e', '-c', selection.fetch('run'), chdir: root)
  check(result.exitstatus == 73, 'xcodebuild failure must propagate unchanged')
end

# 已观测 Pod suites 约99分钟，后续AppTests仍有30+10分钟内限；外层须容纳串行阶段。
def verify_execution_budgets(workflow)
  job = workflow.fetch('jobs').fetch('build-simulator-app')
  check(job.fetch('timeout-minutes') == 360, 'Full simulator job must retain the 360-minute budget')
  steps = job.fetch('steps')
  required = {
    'Build every Jobs Pod in Debug and Release' => [120, { '--phase' => 'pods', '--build-timeout' => '3300' }, ['--batch-pods']],
    'Run each Pod regression suite' => [180, { '--phase' => 'tests', '--build-timeout' => '1800', '--test-timeout' => '600' }, ['--separate-test-builds']],
    'Build Simulator app' => [125, { '--phase' => 'app', '--build-timeout' => '3600' }, []]
  }
  positions = required.map do |name, (minutes, values, switches)|
    step_index = steps.index { |step| step['name'] == name }
    check(step_index, "Required serial stage missing: #{name}")
    step = steps.fetch(step_index)
    check(step.fetch('timeout-minutes') == minutes, "Serial stage budget changed: #{name}")
    arguments = Shellwords.split(step.fetch('run').gsub(/\\\r?\n/, ' '))
    values.each do |flag, value|
      argument_index = arguments.index(flag)
      check(arguments.count(flag) == 1 && arguments[argument_index + 1] == value, "Coverage or internal deadline changed: #{name}/#{flag}")
    end
    check(switches.all? { |flag| arguments.count(flag) == 1 }, "Coverage switch missing or repeated: #{name}")
    step_index
  end
  check(positions == positions.sort, 'Keep Pods, complete suites/ApplicationTests and main App in order')
  check(180 >= 99 + 1800 / 60 + 600 / 60, 'Suite budget cannot contain observed Pods plus declared ApplicationTests deadlines')
end

def verify_budget_regressions(workflow)
  verify_execution_budgets(workflow)
  puts 'PASS budget real workflow positive'
  mutations = {
    'short job' => lambda { |job| job['timeout-minutes'] = 320 },
    'short suites' => lambda { |job| job.fetch('steps').find { |step| step['name'] == 'Run each Pod regression suite' }['timeout-minutes'] = 120 },
    'missing main App' => lambda { |job| job.fetch('steps').reject! { |step| step['name'] == 'Build Simulator app' } },
    'short main App' => lambda { |job| job.fetch('steps').find { |step| step['name'] == 'Build Simulator app' }['timeout-minutes'] = 120 },
    'weakened test deadline' => lambda { |job| job.fetch('steps').find { |step| step['name'] == 'Run each Pod regression suite' }['run'].sub!('--test-timeout 600', '--test-timeout 60') },
    'lost separate preparation' => lambda { |job| job.fetch('steps').find { |step| step['name'] == 'Run each Pod regression suite' }['run'].sub!('--separate-test-builds', '') }
  }
  # 数值前缀相同或重复参数不能通过精确CLI合同。
  {
    'Build every Jobs Pod in Debug and Release' => { '--build-timeout' => '3300' },
    'Run each Pod regression suite' => { '--build-timeout' => '1800', '--test-timeout' => '600' },
    'Build Simulator app' => { '--build-timeout' => '3600' }
  }.each do |stage, deadlines|
    deadlines.each do |flag, value|
      mutations["oversized #{stage}/#{flag}"] = lambda do |job|
        job.fetch('steps').find { |step| step['name'] == stage }['run'].sub!("#{flag} #{value}", "#{flag} #{value}0")
      end
      mutations["duplicate #{stage}/#{flag}"] = lambda do |job|
        job.fetch('steps').find { |step| step['name'] == stage }['run'] << " #{flag} #{value}"
      end
    end
  end
  mutations['duplicate phase'] = lambda do |job|
    job.fetch('steps').find { |step| step['name'] == 'Run each Pod regression suite' }['run'] << ' --phase tests'
  end
  mutations['duplicate preparation switch'] = lambda do |job|
    job.fetch('steps').find { |step| step['name'] == 'Run each Pod regression suite' }['run'] << ' --separate-test-builds'
  end
  mutations['reversed serial stages'] = lambda do |job|
    steps = job.fetch('steps')
    pods_index = steps.index { |step| step['name'] == 'Build every Jobs Pod in Debug and Release' }
    tests_index = steps.index { |step| step['name'] == 'Run each Pod regression suite' }
    steps[pods_index], steps[tests_index] = steps[tests_index], steps[pods_index]
  end
  mutations.each do |name, mutation|
    altered = Marshal.load(Marshal.dump(workflow))
    mutation.call(altered.fetch('jobs').fetch('build-simulator-app'))
    rejected = false
    begin
      verify_execution_budgets(altered)
    rescue RuntimeError
      rejected = true
    end
    check(rejected, "Invalid serial budget/coverage accepted: #{name}")
    puts "PASS budget rejection: #{name}"
  end
end

def main
  graph_only = ARGV.delete('--graph-only')
  check(ARGV.empty?, 'Usage: ruby .github/tests/WorkflowConfiguration/regression.rb [--graph-only]')
  root = File.expand_path('../../..', __dir__)
  Dir.mktmpdir('jobs-workflow-configuration-') do |directory|
    verify_graph(root, load_workflow(root, 'generate_oc_protocol_graph.yml'), directory)
    unless graph_only
      workflow = load_workflow(root, 'build_simulator_app.yml')
      verify_xcode(root, workflow, directory)
      verify_budget_regressions(workflow)
    end
  end
  puts "PASS: workflow configuration (#{graph_only ? 'protocol source and trigger paths' : 'protocol paths, Xcode selection, failure propagation and serial budgets'})"
end

main
