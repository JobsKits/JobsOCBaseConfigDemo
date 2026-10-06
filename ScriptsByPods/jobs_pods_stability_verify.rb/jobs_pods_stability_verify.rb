#!/usr/bin/env ruby
# Jobs 自建 Pod 构建门禁：逐 Pod → 回归 → 主工程，日志与结果保留在独立工作目录。
require 'digest'
require 'fileutils'
require 'json'
require 'open3'
require 'optparse'
require 'time'
require_relative 'jobs_stability_command'
require_relative 'jobs_stability_host_entitlements'

$stdout.sync = true

root = File.expand_path('../..', __dir__)
options = { phase: 'all', configurations: %w[Debug Release], output: File.join(root, 'work', 'JobsPodsStability', Time.now.strftime('%Y%m%d-%H%M%S')), pods: [], simulator: ENV['JOBS_STABILITY_SIMULATOR'], build_timeout: 1800, test_timeout: 600 }
OptionParser.new do |parser|
  parser.banner = 'ruby ScriptsByPods/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb [options]'
  parser.on('--phase PHASE', %w[all pods tests app], 'all / pods / tests / app') { |value| options[:phase] = value }
  parser.on('--configuration NAME', %w[Debug Release], '单独验证一个配置，默认两个') { |value| options[:configurations] = [value] }
  parser.on('--pod NAME', '定向重跑，可重复指定') { |value| options[:pods] << value }
  parser.on('--simulator UDID', '测试模拟器 UUID') { |value| options[:simulator] = value }
  parser.on('--output PATH', '日志与结果目录；成功且源码指纹一致的记录可复用') { |value| options[:output] = File.expand_path(value) }
  parser.on('--build-timeout SECONDS', Float, '每次Pod/App构建超时，默认1800秒') { |value| options[:build_timeout] = value }
  parser.on('--test-timeout SECONDS', Float, '每次XCTest命令超时，默认600秒') { |value| options[:test_timeout] = value }
end.parse!
%i[build_timeout test_timeout].each do |key|
  value = options.fetch(key)
  raise OptionParser::InvalidArgument, "#{key}必须是有限正数" unless value.finite? && value.positive?
end
raise 'Pods/Pods.xcodeproj 不存在，请先 pod install' unless File.directory?(File.join(root, 'Pods', 'Pods.xcodeproj'))
raise '输出目录不能位于 build/（主工程打包阶段会清理 build）' if options[:output].start_with?(File.join(root, 'build') + '/')

all_pods = Dir.glob(File.join(root, 'JobsByPods', '*@Pods', '*.podspec')).reject { |path| path.include?('/ManualBy') }.sort.to_h { |path| [File.basename(path, '.podspec'), path] }
raise '未找到自建 Pods' if all_pods.empty?
unknown = options[:pods] - all_pods.keys
raise "未知 Pod: #{unknown.join(', ')}" unless unknown.empty?
pods = options[:pods].empty? ? all_pods : all_pods.select { |name, _| options[:pods].include?(name) }
# README 不影响编译；每次重新枚举文件，新增源码同样会使成功记录失效。
xcode_version = Open3.capture2('xcodebuild', '-version').first
source_paths = lambda do
  folders = Dir.glob(File.join(root, 'JobsByPods', '*@Pods')).reject { |path| File.basename(path).start_with?('ManualBy') }
  folders += %w[JobsOCBaseConfigDemo Tests].map { |path| File.join(root, path) }
  source_files = folders.flat_map { |folder| Dir.glob(File.join(folder, '**', '*.{h,m,mm,c,cc,cpp,hpp,swift,podspec,xcconfig,xcprivacy,xib,storyboard,rb,sh,json,plist,entitlements,png,jpg,jpeg,gif,webp,svg,pdf,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}')) }
  source_files += %w[Podfile Podfile.deps Podfile.lock JobsOCBaseConfigDemo.xcodeproj/project.pbxproj Pods/Pods.xcodeproj/project.pbxproj ScriptsByPods/jobs_pods_stability_audit.rb/baseline.json].map { |path| File.join(root, path) }
  source_files += Dir.glob(File.join(root, 'ScriptsByPods', 'jobs_pods_stability_{verify,audit}.rb', '**', '*.rb'))
  source_files += Dir.glob(File.join(root, 'Pods', 'Target Support Files', '**', '*.{xcconfig,pch,plist,sh,xcfilelist,modulemap,h,m}'))
  source_files.uniq.sort.select { |path| File.file?(path) }
end
source_snapshot = lambda do
  source_paths.call.map do |path|
    stat = File.stat(path)
    [path, stat.ino, stat.size, stat.mtime.to_r, stat.ctime.to_r]
  end
end
source_fingerprint = lambda do
  fingerprint = Digest::SHA256.new
  source_paths.call.each do |path|
    fingerprint << path.delete_prefix(root) << "\0" << File.binread(path)
  end
  fingerprint << xcode_version
  fingerprint.hexdigest
end
source_metadata = source_snapshot.call
revision = source_fingerprint.call
raise '计算初始源码指纹期间文件发生变化，请冻结修改后重跑。' unless source_snapshot.call == source_metadata
assert_current_source = lambda do
  current_metadata = source_snapshot.call
  next true if current_metadata == source_metadata
  if source_fingerprint.call == revision
    source_metadata = current_metadata
    next true
  end
  previous = source_metadata.to_h { |row| [row.first, row.drop(1)] }
  current = current_metadata.to_h { |row| [row.first, row.drop(1)] }
  changed = (previous.keys | current.keys).select { |path| previous[path] != current[path] }
  warn "验证期间变更文件：\n#{changed.map { |path| path.delete_prefix(root + '/') }.join("\n")}"
  raise '源码或工程配置在验证期间发生变化，请冻结修改后重跑；保留已有日志。'
end
FileUtils.mkdir_p(options[:output])
record_path = File.join(options[:output], 'results.json')
record = File.file?(record_path) ? JSON.parse(File.read(record_path)) : { 'results' => [] }
record['source_fingerprint'] = revision
record['root'] = root
record['self_pod_count'] = all_pods.size
record['xcode'] = xcode_version.strip
record['updated_at'] = Time.now.iso8601
save = lambda do
  temporary = record_path + '.tmp'
  File.write(temporary, JSON.pretty_generate(record) + "\n")
  File.rename(temporary, record_path)
end

execute = lambda do |kind, name, configuration, args|
  assert_current_source.call
  signing_policy = kind == 'test' && name == 'JobsBaseUI' ? 'simulator-adhoc-keychain-v1' : 'unsigned'
  previous = record['results'].reverse.find { |row| row.values_at('kind', 'name', 'configuration', 'source_fingerprint') == [kind, name, configuration, revision] }
  if previous && previous['exit_status'] == 0 && !previous['timed_out'] && previous['signing_policy'] == signing_policy && (kind != 'test' || previous['simulator'] == options[:simulator])
    puts "PASS (cached) #{kind} #{name} #{configuration}"
    next true
  end
  timestamp = Time.now.strftime('%H%M%S')
  log = File.join(options[:output], "#{kind}-#{name}-#{configuration}-#{timestamp}.log")
  command = ['xcodebuild', '-quiet'] + args
  puts "RUN #{kind} #{name} #{configuration}"
  started = Time.now
  status = nil
  command_result = nil
  timeout_seconds = kind == 'test' ? options[:test_timeout] : options[:build_timeout]
  File.open(log, 'w') do |output|
    output.puts(JSON.generate({ command: command, source_fingerprint: revision, started_at: started.iso8601, timeout_seconds: timeout_seconds }))
    output.flush
    command_result = JobsStabilityCommand.run(command, chdir: root, output: output, timeout_seconds: timeout_seconds)
    status = command_result.fetch(:status)
    output.puts("\nVerified process exit status: #{status&.exitstatus.inspect}; signal: #{status&.termsig.inspect}")
    output.puts("Timed out: #{command_result.fetch(:timed_out)}; verified timeout exit: #{command_result[:timed_out] ? 124 : 'not applicable'}")
  end
  consistent = begin
    assert_current_source.call
    true
  rescue RuntimeError
    false
  end
  process_exit_status = status && (status.exitstatus || 128 + status.termsig.to_i)
  verified_exit_status = command_result[:timed_out] ? 124 : process_exit_status
  row = { 'kind' => kind, 'name' => name, 'configuration' => configuration, 'source_fingerprint' => revision, 'source_consistent' => consistent, 'started_at' => started.iso8601, 'seconds' => command_result.fetch(:seconds).round(2), 'exit_status' => consistent ? verified_exit_status : 75, 'process_exit_status' => process_exit_status, 'process_signal' => status&.termsig, 'process_pid' => command_result.fetch(:pid), 'process_status_collected' => command_result.fetch(:status_collected), 'termination_diagnostics' => command_result.fetch(:termination_diagnostics), 'timed_out' => command_result.fetch(:timed_out), 'timeout_seconds' => timeout_seconds, 'termination_grace_seconds' => command_result.fetch(:grace_seconds), 'log' => log, 'command' => command, 'simulator' => options[:simulator] }
  row['signing_policy'] = signing_policy
  if kind == 'test' && !command_result[:timed_out]
    row['result_bundle'] = args.fetch(args.index('-resultBundlePath') + 1)
    summary_text, summary_status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', row['result_bundle'], '--compact')
    begin
      summary = JSON.parse(summary_text)
      row['test_summary'] = summary
      actual_tests = summary.fetch('totalTestCount', 0).to_i
      passed_tests = summary.fetch('passedTests', 0).to_i
      failed_tests = summary.fetch('failedTests', 0).to_i
      valid_tests = summary_status.success? && actual_tests.positive? && passed_tests.positive? && failed_tests.zero? && summary['result'] == 'Passed'
      if name == 'JobsBaseUI'
        valid_tests &&= passed_tests == actual_tests && summary.fetch('skippedTests', -1).zero?
      end
    rescue JSON::ParserError
      valid_tests = false
    end
    File.open(log, 'a') { |output| output.puts("\nXCTest result summary (exit #{summary_status.exitstatus}):\n#{summary_text}") }
    unless valid_tests
      row['exit_status'] = 76 if consistent && process_exit_status.zero?
      row['validation_error'] = 'XCTest 结果无法核验、没有实际执行用例或存在失败，不能计为通过。'
      warn row['validation_error']
    end
    if name == 'JobsBaseUI'
      app = File.join(options[:output], 'Products', "#{configuration}-iphonesimulator", 'AppHost-JobsBaseUI-Unit-Tests.app')
      identifier, identifier_status = Open3.capture2e('/usr/bin/plutil', '-extract', 'CFBundleIdentifier', 'raw', '-o', '-', File.join(app, 'Info.plist'))
      xml, signature_message, signature_status = Open3.capture3('/usr/bin/codesign', '-d', '--entitlements', ':-', app)
      json, conversion_message, conversion_status = Open3.capture3('/usr/bin/plutil', '-convert', 'json', '-o', '-', '--', '-', stdin_data: xml)
      verification, verification_status = Open3.capture2e('/usr/bin/codesign', '--verify', '--strict', '--verbose=2', app)
      entitlements = begin
        JSON.parse(json)
      rescue JSON::ParserError
        {}
      end
      identifier = identifier.strip
      matches_identifier = lambda do |values|
        values['application-identifier'] == identifier && values['keychain-access-groups'] == [identifier] && values['get-task-allow'] == true
      end
      effective_permissions_valid = matches_identifier.call(entitlements)
      permission_source = 'code-signature'
      compiled_permissions = nil
      unless effective_permissions_valid
        executable, executable_status = Open3.capture2e('/usr/bin/plutil', '-extract', 'CFBundleExecutable', 'raw', '-o', '-', File.join(app, 'Info.plist'))
        if executable_status.success?
          compiled_permissions = JobsStabilityHostEntitlements.audit(File.join(app, executable.strip), bundle_identifier: identifier)
          effective_permissions_valid = compiled_permissions['valid']
          permission_source = 'simulator-binary-__TEXT-__entitlements'
        end
      end
      signed_host_valid = identifier_status.success? && signature_status.success? && conversion_status.success? && verification_status.success? && !identifier.empty? && effective_permissions_valid
      row['host_signature'] = { 'app' => app, 'bundle_identifier' => identifier, 'code_signature_entitlements' => entitlements, 'permission_source' => permission_source, 'compiled_permissions' => compiled_permissions, 'valid' => signed_host_valid, 'codesign_exit_status' => signature_status.exitstatus, 'verification_exit_status' => verification_status.exitstatus }
      File.open(log, 'a') do |output|
        output.puts("\nKeychain host signature audit:\n#{JSON.pretty_generate(row['host_signature'])}\n#{signature_message}\n#{conversion_message}\n#{verification}")
      end
      unless signed_host_valid
        row['exit_status'] = 77 if consistent && process_exit_status.zero?
        row['validation_error'] = 'Keychain 测试宿主实际签名或 entitlement 不匹配，不能计为通过。'
        warn row['validation_error']
      end
    end
  end
  record['results'] << row
  record['updated_at'] = Time.now.iso8601
  save.call
  assert_current_source.call
  puts "#{row['exit_status'].zero? ? 'PASS' : 'FAIL'} #{kind} #{name} #{configuration} (#{row['seconds']}s) #{log}"
  unless row['exit_status'].zero?
    File.readlines(log).select { |line| line.match?(/error:|failed|fatal error|BUILD FAILED|TEST FAILED/) }.last(12).each { |line| puts line.strip }
  end
  row['exit_status'].zero?
end

build_base = lambda do |configuration, signed_host = false|
  signing = signed_host ? ['CODE_SIGNING_ALLOWED=YES', 'CODE_SIGNING_REQUIRED=YES', 'CODE_SIGN_IDENTITY=-'] : ['CODE_SIGNING_ALLOWED=NO', 'CODE_SIGNING_REQUIRED=NO', 'CODE_SIGN_IDENTITY=']
  [ '-configuration', configuration, '-sdk', 'iphonesimulator', '-derivedDataPath', File.join(options[:output], 'DerivedData'), "SYMROOT=#{File.join(options[:output], 'Products')}", "OBJROOT=#{File.join(options[:output], 'Intermediates')}", "BUILD_DIR=#{File.join(options[:output], 'Products')}", 'ONLY_ACTIVE_ARCH=NO' ] + signing
end
# 在构建前核验实际 podspec/资源/selector 所有权，失败不会进入主工程验收。
audit_script = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_audit.rb', 'jobs_pods_stability_audit.rb')
if File.file?(audit_script)
  audit_output = File.join(options[:output], 'configuration-audit.json')
  audit_text, audit_status = Open3.capture2e('ruby', audit_script, '--output', audit_output, chdir: root)
  audit_log = File.join(options[:output], 'configuration-audit.log')
  File.write(audit_log, audit_text)
  record['results'] << { 'kind' => 'static', 'name' => 'JobsPodsConfiguration', 'configuration' => 'all', 'source_fingerprint' => revision, 'exit_status' => audit_status.exitstatus, 'log' => audit_log }
  save.call
  unless audit_status.success?
    puts audit_text
    abort "配置门禁失败: #{audit_output}"
  end
  puts "PASS configuration audit: #{audit_output}"
end

passed = true
if %w[all pods].include?(options[:phase])
  options[:configurations].each do |configuration|
    pods.each_key do |name|
      ok = execute.call('pod', name, configuration, ['-project', 'Pods/Pods.xcodeproj', '-scheme', name, '-destination', 'generic/platform=iOS Simulator'] + build_base.call(configuration) + ['build'])
      passed = false unless ok
    end
  end
end

if %w[all tests].include?(options[:phase]) && passed
  raise '--simulator UDID 或 JOBS_STABILITY_SIMULATOR 必须给出测试目标' unless options[:simulator]
  pods.each do |name, spec|
    next unless File.read(spec).match?(/\.test_spec\s+['"]Stability['"]/) 
    configurations = name == 'JobsOCSnowflake' ? options[:configurations] : [options[:configurations].first]
    configurations.each do |configuration|
      result_bundle = File.join(options[:output], "#{name}-#{configuration}-#{Time.now.strftime('%H%M%S%L')}.xcresult")
      # 头文件 Pod 的 aggregate scheme 没有 test action；显式执行 Stability 测试目标。
      test_scheme = "#{name}-Unit-Stability"
      args = ['-project', 'Pods/Pods.xcodeproj', '-scheme', test_scheme, '-destination', "platform=iOS Simulator,id=#{options[:simulator]}", '-parallel-testing-enabled', 'NO', '-resultBundlePath', result_bundle] + build_base.call(configuration, name == 'JobsBaseUI') + ['test']
      ok = execute.call('test', name, configuration, args)
      passed = false unless ok
    end
  end
  # macOS harness 编译真实生产实现，补充 fatal signal、SQLite 和构建期脚本等场景。
  pods.each do |name, spec|
    harness = File.join(File.dirname(spec), 'Tests', 'run_regression.rb')
    next unless File.file?(harness)
    assert_current_source.call
    log = File.join(options[:output], "harness-#{name}.log")
    output, status = Open3.capture2e('ruby', harness, chdir: root)
    File.write(log, output)
    record['results'] << { 'kind' => 'harness', 'name' => name, 'configuration' => 'macOS', 'source_fingerprint' => revision, 'exit_status' => status.exitstatus, 'log' => log }
    save.call
    assert_current_source.call
    puts "#{status.success? ? 'PASS' : 'FAIL'} harness #{name}: #{log}"
    passed = false unless status.success?
  end
end

if %w[all app].include?(options[:phase]) && passed
  options[:configurations].each do |configuration|
    ok = execute.call('app', 'JobsOCBaseConfigDemo', configuration, ['-workspace', 'JobsOCBaseConfigDemo.xcworkspace', '-scheme', 'JobsOCBaseConfigDemo', '-destination', 'generic/platform=iOS Simulator'] + build_base.call(configuration) + ['build'])
    passed = false unless ok
  end
end
assert_current_source.call
raise '验证结束时源码内容指纹不一致，请冻结修改后重跑。' unless source_fingerprint.call == revision
save.call
puts "#{passed ? 'ALL REQUESTED CHECKS PASSED' : 'CHECKS FAILED'}: #{record_path}"
exit(passed ? 0 : 1)
