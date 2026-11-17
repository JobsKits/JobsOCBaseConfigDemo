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

def verify_validation_artifacts(workflow)
  steps = workflow.fetch('jobs').fetch('build-simulator-app').fetch('steps')
  upload = steps.find { |step| step['name'] == 'Upload Pod validation records' }
  check(upload && upload.fetch('if') == 'always()', 'Validation records must upload after success or failure')
  paths = upload.fetch('with').fetch('path').lines.map(&:strip).reject(&:empty?)
  required = [
    'JobsOCStability/results.json',
    'JobsOCStability/configuration-audit.json',
    'JobsOCStability/*.log',
    'JobsOCStability/*.xcresult',
    'JobsOCStability/ApplicationTests/*.xcresult',
    'JobsOCStability/OwnedPodsBatch',
    'ReactiveObjCDiagnostics',
    'ReactiveObjCDiagnosticsAfterBuild',
    'JobsOCStability/Intermediates/Pods.build/*/ReactiveObjC.build/Objects-normal/arm64/*.resp',
    'JobsOCStability/Intermediates/Pods.build/*/ReactiveObjC.build/*.hmap',
    'JobsOCStability/Intermediates/Pods.build/*/*VFS*/*.yaml',
    'simulator-sdk-version.txt',
    'simulator-runtimes.json',
    'simulator-devices.json',
    'simulator-selection.env'
  ].map { |path| '${{ runner.temp }}/' + path }
  required.each do |path|
    check(paths.count(path) == 1, "Validation artifact path missing or repeated: #{path}")
  end
  application_paths = paths.select { |path| path.include?('/ApplicationTests') }
  check(application_paths == ['${{ runner.temp }}/JobsOCStability/ApplicationTests/*.xcresult'],
        'Collect only ApplicationTests result bundles, not its Products or DerivedData')
end

def verify_artifact_regressions(workflow)
  verify_validation_artifacts(workflow)
  puts 'PASS validation artifacts real workflow positive'
  mutations = {
    'missing ApplicationTests bundle' => lambda { |step| step.fetch('with')['path'].sub!(/^.*\/ApplicationTests\/\*\.xcresult\n?/, '') },
    'missing always condition' => lambda { |step| step['if'] = 'success()' },
    'broad ApplicationTests directory' => lambda { |step| step.fetch('with')['path'].sub!('ApplicationTests/*.xcresult', 'ApplicationTests') },
    'missing root Pod bundles' => lambda { |step| step.fetch('with')['path'].sub!(/^.*\/JobsOCStability\/\*\.xcresult\n?/, '') }
  }
  mutations.each do |name, mutation|
    altered = Marshal.load(Marshal.dump(workflow))
    step = altered.fetch('jobs').fetch('build-simulator-app').fetch('steps').find { |item| item['name'] == 'Upload Pod validation records' }
    mutation.call(step)
    rejected = false
    begin
      verify_validation_artifacts(altered)
    rescue RuntimeError, KeyError
      rejected = true
    end
    check(rejected, "Invalid validation artifact collection accepted: #{name}")
    puts "PASS validation artifact rejection: #{name}"
  end
end

# 对真实步骤分词核验生命周期；不接受把任意rm命令伪装成已审helper。
def verify_disk_lifecycle(workflow)
  steps = workflow.fetch('jobs').fetch('build-simulator-app').fetch('steps')
  helper = JobsStabilityCIDisk::HELPER
  names = [
    'Prepare CI disk ownership', 'Build Rust OCR from source', 'Reclaim exported OCR source cache',
    'Install CocoaPods dependencies', 'Run each Pod regression suite', 'Audit built Keychain test host',
    'Checkpoint completed test records', 'Reclaim completed ApplicationTests intermediates',
    'Build Simulator app', 'Upload Pod validation records', 'Reclaim completed main App intermediates',
    'Package Simulator app', 'Upload Simulator app', 'Upload CI disk records'
  ]
  positions = names.map do |name|
    check(steps.count { |s| s['name'] == name } == 1, "CI lifecycle stage missing/duplicated: #{name}")
    steps.index { |s| s['name'] == name }
  end
  check(positions == positions.sort, 'Disk cleanup/checkpoints must follow completed consumers and precede large producers')
  {
    'Prepare CI disk ownership' => 'prepare', 'Reclaim exported OCR source cache' => 'rust',
    'Reclaim completed ApplicationTests intermediates' => 'tests', 'Reclaim completed main App intermediates' => 'app'
  }.each do |name, phase|
    step = steps.find { |s| s['name'] == name }
    check(Shellwords.split(step.fetch('run')) == ['ruby', helper, '--ci', phase], "Unreviewed disk cleanup command: #{name}")
    check(step['if'].nil? && step.fetch('timeout-minutes') == 5, "Disk cleanup must run only after success within budget: #{name}")
  end
  cache = steps.find { |s| s['name'] == 'Build Rust OCR from source' }.fetch('env').fetch('JOBS_OCR_CACHE_DIR')
  check(cache == '${{ runner.temp }}/JobsOCRSourceCache-${{ github.run_id }}-${{ github.run_attempt }}', 'Rust cache must be private to this run/attempt')
  checkpoint = steps.find { |s| s['name'] == 'Checkpoint completed test records' }
  final = steps.find { |s| s['name'] == 'Upload Pod validation records' }
  check(checkpoint['if'].nil?, 'Test checkpoint must finish successfully before the main App')
  check(checkpoint.fetch('uses') == final.fetch('uses') && checkpoint.fetch('with').fetch('path') == final.fetch('with').fetch('path'), 'Checkpoint must retain the same original evidence inventory')
  check(checkpoint.fetch('with').fetch('name') == 'JobsPods-tests-${{ github.run_id }}-attempt-${{ github.run_attempt }}', 'Checkpoint artifact needs a distinct immutable identity')
  check(final.fetch('with').fetch('name') == 'JobsPods-validation-${{ github.run_id }}', 'Retain the final validation artifact identity')
  disk = steps.find { |s| s['name'] == 'Upload CI disk records' }
  check(disk.fetch('if') == 'always()', 'Disk failure receipts must upload after success/failure')
  check(disk.fetch('with').fetch('path') == '${{ runner.temp }}/JobsCIDisk-${{ github.run_id }}-${{ github.run_attempt }}/*.json', 'Collect only the owned disk receipts')
  uploads = steps.select { |s| s['uses'].to_s.start_with?('actions/upload-artifact@') }
  artifact_names = uploads.map { |s| s.fetch('with').fetch('name') }
  check(artifact_names.uniq.size == artifact_names.size && uploads.none? { |s| s.fetch('with')['overwrite'] }, 'Never overwrite or create the same v7 artifact twice')
end

# 正向运行真实清理器的隔离夹具；负向变异验证时序/范围/上传合同的拒绝路径。
def verify_disk_regressions(root, workflow)
  require File.join(root, 'ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_stability_ci_disk.rb/jobs_stability_ci_disk')
  JobsStabilityCIDisk.verify_trust!(root)
  verify_disk_lifecycle(workflow)
  script = File.join(root, JobsStabilityCIDisk::TEST)
  output, status = Open3.capture2e(RbConfig.ruby, script)
  check(status.success?, "CI disk real filesystem regression failed: #{output}")
  puts output.lines.grep(/^PASS/)
  mutations = {
    'missing ownership' => lambda { |s| s.reject! { |v| v['name'] == 'Prepare CI disk ownership' } },
    'shared Rust cache' => lambda { |s| s.find { |v| v['name'] == 'Build Rust OCR from source' }['env']['JOBS_OCR_CACHE_DIR'] = '/tmp/shared' },
    'cleanup Products' => lambda { |s| s.find { |v| v['name'] == 'Reclaim completed main App intermediates' }['run'] = 'rm -rf "$RUNNER_TEMP/JobsOCStability/Products"' },
    'cleanup on failure' => lambda { |s| s.find { |v| v['name'] == 'Reclaim completed main App intermediates' }['if'] = 'always()' },
    'checkpoint alias' => lambda { |s| s.find { |v| v['name'] == 'Checkpoint completed test records' }['with']['name'] = 'JobsPods-validation-${{ github.run_id }}' },
    'missing disk records' => lambda { |s| s.reject! { |v| v['name'] == 'Upload CI disk records' } }
  }
  [
    ['Reclaim completed ApplicationTests intermediates', 'Audit built Keychain test host'],
    ['Reclaim completed main App intermediates', 'Build Simulator app'],
    ['Checkpoint completed test records', 'Build Simulator app'],
    ['Upload Pod validation records', 'Package Simulator app']
  ].each do |left, right|
    mutations["reordered #{left}"] = lambda do |s|
      a = s.index { |v| v['name'] == left }; b = s.index { |v| v['name'] == right }
      s[a], s[b] = s[b], s[a]
    end
  end
  mutations.each do |name, mutation|
    altered = Marshal.load(Marshal.dump(workflow))
    mutation.call(altered.fetch('jobs').fetch('build-simulator-app').fetch('steps'))
    rejected = false
    begin
      verify_disk_lifecycle(altered)
    rescue RuntimeError, KeyError
      rejected = true
    end
    check(rejected, "Invalid disk lifecycle accepted: #{name}")
    puts "PASS CI disk lifecycle rejection: #{name}"
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
      verify_artifact_regressions(workflow)
      verify_disk_regressions(root, workflow)
    end
  end
  puts "PASS: workflow configuration (#{graph_only ? 'protocol source and trigger paths' : 'protocol paths, Xcode selection, failure propagation, serial budgets and validation artifacts'})"
end

main
