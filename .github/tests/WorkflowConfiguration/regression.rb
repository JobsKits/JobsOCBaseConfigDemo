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
  dependency_env = job.fetch('env', {}).merge(steps.fetch(pods).fetch('env', {}))
  check(dependency_env['JOBS_SPECS_SOURCE'] == 'cdn', 'CI must pin the public Specs CDN instead of timing a full Git repository by a small-file probe')
  verify_integrated_budget(workflow)
  verify_installed_receipt_collection(workflow)
  verify_installed_configuration_copy(workflow, directory)
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

def verify_integrated_budget(workflow)
  job = workflow.fetch('jobs').fetch('build-simulator-app')
  steps = job.fetch('steps')
  stability = steps.find { |step| step['name'] == 'Run integrated component XCTest and production harnesses' }
  check(stability, 'Integrated cold build step missing')
  arguments = Shellwords.split(stability.fetch('run'))
  positions = arguments.each_index.select { |index| arguments[index] == '--build-timeout' }
  app = steps.find { |step| step['name'] == 'Build Simulator app' }
  check(positions.size == 1 && arguments[positions.first + 1] == '4800' && stability['timeout-minutes'] == 200 && job['timeout-minutes'] == 360 && app && app['timeout-minutes'] == 120, 'Integrated cold builds require the explicit finite CI budget')
end

def verify_budget_rejections(workflow, directory)
  %w[missing oversized integrated-step job app].each do |kind|
    candidate = Marshal.load(Marshal.dump(workflow))
    job = candidate.fetch('jobs').fetch('build-simulator-app')
    step = job.fetch('steps').find { |item| item['name'] == 'Run integrated component XCTest and production harnesses' }
    case kind
    when 'missing', 'oversized'
      step['run'] = step.fetch('run').sub('--build-timeout 4800', kind == 'missing' ? '' : '--build-timeout 48000')
    when 'integrated-step'
      step['timeout-minutes'] = 199
    when 'job'
      job['timeout-minutes'] = 359
    when 'app'
      job.fetch('steps').find { |item| item['name'] == 'Build Simulator app' }['timeout-minutes'] = 119
    end
    path = File.join(directory, "budget-#{kind}.yml")
    File.write(path, YAML.dump(candidate))
    rejected = false
    begin
      verify_integrated_budget(YAML.load_file(path))
    rescue RuntimeError => error
      rejected = error.message == 'Integrated cold builds require the explicit finite CI budget'
    end
    check(rejected, "Invalid #{kind} budget fixture was accepted")
  end
end

def verify_installed_receipt_collection(workflow)
  steps = workflow.fetch('jobs').fetch('build-simulator-app').fetch('steps')
  upload = steps.find { |step| step['name'] == 'Upload build diagnostics' }
  paths = upload&.fetch('with')&.fetch('path')&.lines&.map(&:strip) || []
  check(upload && upload['if'] == 'always()' && integrated_diagnostic_paths.all? { |path| paths.include?(path) }, 'Integrated Test compiler inputs must be retained in diagnostics')
  check(paths.all? { |path| path.start_with?('${{ runner.temp }}/') }, 'Diagnostics artifact paths must preserve temporary-root layout')
  collected = paths.select { |path| path.include?('/Intermediates') || path.include?('/DerivedData') || path.include?('/Pods') }
  expected = integrated_diagnostic_paths.select { |path| path.include?('/Intermediates/') || path.include?('/Pods/') }
  check(collected.sort == expected.sort, 'Compiler diagnostics must stay within the two native targets and their installed Pods configurations')
  environment = steps.find { |step| step['name'] == 'Show build environment' }
  commands = environment&.fetch('run')&.lines&.map(&:strip) || []
  check(commands.include?('command -v ruby') && commands.include?('ruby --version'), 'Record the actual Ruby executable and version')
end

def integrated_diagnostic_paths
  base = '${{ runner.temp }}/JobsComponentsStability'
  build = base + '/Intermediates/JobsOCBaseConfigDemo.build/*-iphonesimulator/'
  targets = %w[JobsOCBaseConfigDemo JobsOCBaseConfigDemoTests]
  ['${{ runner.temp }}/BuildDiagnostics', base + '/installed-test-configuration.json'] + targets.flat_map do |target|
    [build + target + '.build/Objects-normal/*/*-common-args.resp', build + target + '.build/*.hmap']
  end + [build + 'JobsOCBaseConfigDemo-*-VFS-iphonesimulator/*.yaml']
end

def verify_installed_configuration_copy(workflow, directory)
  step = workflow.fetch('jobs').fetch('build-simulator-app').fetch('steps').find { |item| item['name'] == 'Record ReactiveObjC build configuration' }
  Dir.mktmpdir('installed-pods-configurations-', directory) do |fixture|
    workspace = File.join(fixture, 'workspace with spaces')
    temporary = File.join(fixture, 'runner temp')
    bin = File.join(fixture, 'bin')
    FileUtils.mkdir_p([workspace, bin, File.join(temporary, 'BuildDiagnostics/ReactiveObjC')])
    %w[ruby xcodebuild].each do |name|
      path = File.join(bin, name)
      File.write(path, "#!/bin/sh\nexit 0\n")
      FileUtils.chmod(0o700, path)
    end
    files = %w[JobsOCBaseConfigDemo JobsOCBaseConfigDemoTests].flat_map do |target|
      %w[debug release].map do |configuration|
        name = "Pods-#{target}.#{configuration}.xcconfig"
        source = File.join(workspace, 'Pods/Target Support Files', 'Pods-' + target, name)
        FileUtils.mkdir_p(File.dirname(source))
        File.write(source, "HEADER_SEARCH_PATHS = fixture-#{name}\n")
        [source, File.join(temporary, 'BuildDiagnostics/InstalledPodsConfigurations', name)]
      end
    end
    env = { 'PATH' => bin + File::PATH_SEPARATOR + ENV.fetch('PATH'), 'GITHUB_WORKSPACE' => workspace, 'RUNNER_TEMP' => temporary }
    stdout, stderr, status = Open3.capture3(env, '/bin/bash', '-e', '-o', 'pipefail', '-c', step.fetch('run'), chdir: workspace)
    check(status.success?, "Installed Pods configuration copy failed: #{stdout}#{stderr}")
    files.each { |source, destination| check(File.file?(destination) && File.binread(destination) == File.binread(source), 'Installed Pods configuration was not copied byte-for-byte') }
    missing, destination = files.last
    File.delete(missing)
    File.delete(destination)
    stdout, stderr, status = Open3.capture3(env, '/bin/bash', '-e', '-o', 'pipefail', '-c', step.fetch('run'), chdir: workspace)
    check(status.success? && !File.exist?(destination) && (stdout + stderr).include?('Missing installed Pods configuration: ' + missing), 'Missing configuration must remain a diagnostic for the later production gate')
  end
end

def verify_installed_receipt_rejection(workflow, directory)
  omissions = integrated_diagnostic_paths + ['command -v ruby', 'ruby --version']
  omissions.each_with_index do |omission, index|
    candidate = Marshal.load(Marshal.dump(workflow))
    steps = candidate.fetch('jobs').fetch('build-simulator-app').fetch('steps')
    step = steps.find { |item| item['name'] == (omission.include?('ruby') ? 'Show build environment' : 'Upload build diagnostics') }
    container = omission.include?('ruby') ? step : step.fetch('with')
    key = omission.include?('ruby') ? 'run' : 'path'
    container[key] = container.fetch(key).lines.reject { |line| line.strip == omission }.join
    path = File.join(directory, "missing-compiler-diagnostic-#{index}.yml")
    File.write(path, YAML.dump(candidate))
    rejected = false
    begin
      verify_installed_receipt_collection(YAML.load_file(path))
    rescue RuntimeError => error
      rejected = ['Integrated Test compiler inputs must be retained in diagnostics', 'Record the actual Ruby executable and version'].include?(error.message)
    end
    check(rejected, "Missing compiler diagnostic fixture was accepted: #{omission}")
  end
  [
    ['${{ runner.temp }}/JobsComponentsStability/Intermediates/**', 'Compiler diagnostics must stay within the two native targets and their installed Pods configurations'],
    ['${{ github.workspace }}/Pods/Target Support Files/Pods-App/Pods-App.debug.xcconfig', 'Diagnostics artifact paths must preserve temporary-root layout']
  ].each do |extra, message|
    candidate = Marshal.load(Marshal.dump(workflow))
    upload = candidate.fetch('jobs').fetch('build-simulator-app').fetch('steps').find { |step| step['name'] == 'Upload build diagnostics' }
    upload['with']['path'] += extra + "\n"
    rejected = false
    begin
      verify_installed_receipt_collection(candidate)
    rescue RuntimeError => error
      rejected = error.message == message
    end
    check(rejected, "Invalid compiler diagnostic collection fixture was accepted: #{extra}")
  end
end

def main
  graph_only = ARGV.delete('--graph-only')
  check(ARGV.empty?, 'Usage: ruby .github/tests/WorkflowConfiguration/regression.rb [--graph-only]')
  root = File.expand_path('../../..', __dir__)
  Dir.mktmpdir('jobs-workflow-configuration-') do |directory|
    verify_graph(root, load_workflow(root, 'generate_oc_protocol_graph.yml'), directory)
    unless graph_only
      build = load_workflow(root, 'build_simulator_app.yml')
      verify_xcode(root, build, directory)
      verify_budget_rejections(build, directory)
      verify_installed_receipt_rejection(build, directory)
    end
  end
  puts "PASS: workflow configuration (#{graph_only ? 'protocol source and trigger paths' : 'protocol paths, Xcode selection and failure propagation'})"
end

main
