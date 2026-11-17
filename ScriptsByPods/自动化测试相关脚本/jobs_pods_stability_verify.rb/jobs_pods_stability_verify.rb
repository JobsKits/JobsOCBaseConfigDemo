#!/usr/bin/env ruby
# Jobs 自建 Pod 构建门禁：逐 Pod（CI 可选单图批量）→ 回归 → 主工程，保留真实执行证据。
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

require 'digest'
require 'fileutils'
require 'json'
require 'open3'
require 'optparse'
require 'time'
require_relative 'jobs_stability_command.rb/jobs_stability_command'
require_relative 'jobs_stability_host_entitlements.rb/jobs_stability_host_entitlements'
require_relative 'jobs_stability_sources.rb/jobs_stability_sources'

$stdout.sync = true

root = File.expand_path('../../..', __dir__)
if File.file?(File.join(root, 'Tests', 'ComponentStability', 'manifest.json'))
  require_relative 'jobs_stability_integrated.rb/jobs_stability_integrated'
  exit JobsStabilityIntegrated.run(ARGV, root)
end
options = { phase: 'all', configurations: %w[Debug Release], output: File.join(root, 'work', 'JobsPodsStability', Time.now.strftime('%Y%m%d-%H%M%S')), pods: [], simulator: ENV['JOBS_STABILITY_SIMULATOR'], build_timeout: 1800, test_timeout: 600 }
OptionParser.new do |parser|
  parser.banner = 'ruby ScriptsByPods/自动化测试相关脚本/jobs_pods_stability_verify.rb/jobs_pods_stability_verify.rb [options]'
  parser.on('--phase PHASE', %w[all pods tests app], 'all / pods / tests / app') { |value| options[:phase] = value }
  parser.on('--configuration NAME', %w[Debug Release], '单独验证一个配置，默认两个') { |value| options[:configurations] = [value] }
  parser.on('--architecture ARCH', %w[arm64 x86_64], '定向模拟器架构；省略时保留双架构') { |value| options[:architecture] = value }
  parser.on('--batch-pods', '所选自建 Pod 每配置共用一次构建；默认仍逐 Pod') { options[:batch_pods] = true }
  parser.on('--audit-only', '只执行配置门禁，不构建或运行测试') { options[:audit_only] = true }
  parser.on('--separate-test-builds', '逐套先构建测试包，再独立执行 XCTest；构建与运行分别限时') { options[:separate_test_builds] = true }
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

all_pods = JobsStabilitySources.podspec_paths(root).to_h { |path| [File.basename(path, '.podspec'), path] }
raise '未找到自建 Pods' if all_pods.empty?
unknown = options[:pods] - all_pods.keys
raise "未知 Pod: #{unknown.join(', ')}" unless unknown.empty?
pods = options[:pods].empty? ? all_pods : all_pods.select { |name, _| options[:pods].include?(name) }
# README 不影响编译；每次重新枚举文件，新增源码同样会使成功记录失效。
xcode_version = Open3.capture2('xcodebuild', '-version').first
source_paths = -> { JobsStabilitySources.paths(root) }
source_snapshot = lambda do
  source_paths.call.map do |path|
    stat = File.stat(path)
    [path, stat.ino, stat.size, stat.mtime.to_r, stat.ctime.to_r]
  end
end
source_fingerprint = -> { JobsStabilitySources.fingerprint(root, xcode_version, architecture: options[:architecture]) }
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
record['architecture'] = options[:architecture]
record['installation_mode'] = JobsStabilitySources.installation_mode
record['updated_at'] = Time.now.iso8601
save = lambda do
  temporary = record_path + '.tmp'
  File.write(temporary, JSON.pretty_generate(record) + "\n")
  File.rename(temporary, record_path)
end

execute = lambda do |kind, name, configuration, args, evidence = {}|
  assert_current_source.call
  command = ['xcodebuild'] + (kind == 'test_build' ? [] : ['-quiet']) + args
  signing_policy = if %w[test test_build].include?(kind) && name == 'ApplicationTests'
    'simulator-adhoc-application-tests-v1'
  elsif %w[test test_build].include?(kind) && name == 'JobsBaseUI'
    'simulator-adhoc-keychain-v1'
  elsif kind == 'test' && name == 'JobsOCSearcher'
    evidence.fetch('searcher_signing_policy')
  else
    'unsigned'
  end
  previous = record['results'].reverse.find { |row| row.values_at('kind', 'name', 'configuration', 'source_fingerprint') == [kind, name, configuration, revision] }
  mode_matches = previous && previous.fetch('execution_mode', 'individual') == evidence.fetch('execution_mode', 'individual')
  batch_cache_valid = kind != 'pod_batch' || (previous &&
    evidence.all? { |key, value| previous[key] == value } &&
    JobsStabilityPodBatch.evidence_errors(previous, root).empty?)
  preparation_cache_valid = kind != 'test_build' || (previous && previous['source_consistent'] == true &&
    previous['process_status_collected'] == true && previous['process_exit_status'] == 0 && previous['process_signal'].nil? &&
    previous['command'] == command && previous['log'].is_a?(String) && File.file?(previous['log']))
  test_cache_valid = evidence['execution_mode'] != 'test-without-building' || (previous &&
    evidence.all? { |key, value| previous[key] == value })
  strict_test_cache_valid = kind != 'test' || (name != 'JobsOCSearcher' && previous && previous['test_summary'].is_a?(Hash) &&
    previous['test_summary']['totalTestCount'].is_a?(Integer) && previous['test_summary']['totalTestCount'].positive? &&
    previous['test_summary']['passedTests'] == previous['test_summary']['totalTestCount'] &&
    previous['test_summary'].values_at('result', 'failedTests', 'skippedTests') == ['Passed', 0, 0])
  expected_application_tests = evidence['expected_test_count']
  application_cache_valid = name != 'ApplicationTests' || (previous &&
    previous['expected_test_count'] == expected_application_tests && previous['test_classes'] == evidence['test_classes'] &&
    previous['test_inventory'] == evidence['test_inventory'] &&
    (kind != 'test' || (previous['test_summary'].is_a?(Hash) &&
      previous['test_summary'].values_at('result', 'totalTestCount', 'passedTests', 'failedTests', 'skippedTests') == ['Passed', expected_application_tests, expected_application_tests, 0, 0] &&
      File.directory?(previous['result_bundle'].to_s) && File.directory?(previous['host_app'].to_s) &&
      previous['host_signature'].is_a?(Hash) && previous['host_signature']['valid'] == true)))
  if name == 'ApplicationTests' && kind == 'test' && application_cache_valid
    current_signature = JobsStabilityIntegrated.host_audit(previous.fetch('host_app'))
    cached_text, cached_status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary',
      '--path', previous.fetch('result_bundle'), '--compact')
    cached_summary = begin
      JSON.parse(cached_text)
    rescue JSON::ParserError
      {}
    end
    application_cache_valid = current_signature['valid'] == true &&
      current_signature.dig('compiled_permissions', 'binary_sha256') == previous.dig('host_signature', 'compiled_permissions', 'binary_sha256') &&
      cached_status.success? && cached_summary.values_at('result', 'totalTestCount', 'passedTests', 'failedTests', 'skippedTests') == ['Passed', expected_application_tests, expected_application_tests, 0, 0]
  end
  if previous && mode_matches && batch_cache_valid && preparation_cache_valid && test_cache_valid && strict_test_cache_valid && application_cache_valid && previous['exit_status'] == 0 && !previous['timed_out'] && previous['signing_policy'] == signing_policy && (!%w[test test_build].include?(kind) || previous['simulator'] == options[:simulator])
    puts "PASS (cached) #{kind} #{name} #{configuration}"
    next true
  end
  timestamp = Time.now.strftime('%H%M%S')
  log = File.join(options[:output], "#{kind}-#{name}-#{configuration}-#{timestamp}.log")
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
  row.merge!(evidence)
  if kind == 'pod_batch'
    proof_errors = JobsStabilityPodBatch.evidence_errors(row, root)
    unless proof_errors.empty?
      row['exit_status'] = 78 if consistent && verified_exit_status == 0
      row['validation_error'] = proof_errors.join('；')
      warn row['validation_error']
    end
  end
  if kind == 'test' && !command_result[:timed_out]
    row['result_bundle'] = args.fetch(args.index('-resultBundlePath') + 1)
    summary_text, summary_status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', row['result_bundle'], '--compact')
    begin
      summary = JSON.parse(summary_text)
      row['test_summary'] = summary
      actual_tests = summary.fetch('totalTestCount', 0).to_i
      passed_tests = summary.fetch('passedTests', 0).to_i
      failed_tests = summary.fetch('failedTests', 0).to_i
      valid_tests = summary_status.success? && actual_tests.positive? && passed_tests == actual_tests &&
        failed_tests.zero? && summary['skippedTests'] == 0 && summary['result'] == 'Passed' &&
        %w[totalTestCount passedTests failedTests skippedTests].all? { |key| summary[key].is_a?(Integer) }
      if name == 'JobsBaseUI'
        valid_tests &&= passed_tests == actual_tests && summary.fetch('skippedTests', -1).zero?
      end
      if name == 'ApplicationTests'
        valid_tests &&= row['expected_test_count'] == expected_application_tests &&
          row['test_inventory'] == evidence['test_inventory'] &&
          summary.values_at('totalTestCount', 'passedTests', 'failedTests', 'skippedTests') == [expected_application_tests, expected_application_tests, 0, 0]
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
    if name == 'ApplicationTests'
      row['host_signature'] = JobsStabilityIntegrated.host_audit(row.fetch('host_app'))
      File.open(log, 'a') { |output| output.puts("\nApplication test host signature audit:\n#{JSON.pretty_generate(row['host_signature'])}") }
      unless row['host_signature']['valid'] == true
        row['exit_status'] = 77 if consistent && process_exit_status.zero?
        row['validation_error'] = '主工程测试宿主实际签名或权限回执不匹配，不能计为通过。'
        warn row['validation_error']
      end
    end
  end
  record['results'] << row
  record['updated_at'] = Time.now.iso8601
  save.call
  puts "#{row['exit_status'].zero? ? 'PASS' : 'FAIL'} #{kind} #{name} #{configuration} (#{row['seconds']}s) #{log}"
  unless row['exit_status'].zero?
    File.readlines(log).select { |line| line.match?(/ld:|Undefined symbols|symbol\(s\) not found|error:|failed|fatal error|BUILD FAILED|TEST FAILED/) }.last(16).each { |line| puts line.strip }
  end
  assert_current_source.call
  row['exit_status'].zero?
end

build_base = lambda do |configuration, signed_host = false|
  signing = signed_host ? ['CODE_SIGNING_ALLOWED=YES', 'CODE_SIGNING_REQUIRED=YES', 'CODE_SIGN_IDENTITY=-'] : ['CODE_SIGNING_ALLOWED=NO', 'CODE_SIGNING_REQUIRED=NO', 'CODE_SIGN_IDENTITY=']
  architecture = options[:architecture] ? ["ARCHS=#{options[:architecture]}", 'ONLY_ACTIVE_ARCH=YES'] : ['ONLY_ACTIVE_ARCH=NO']
  [ '-configuration', configuration, '-sdk', 'iphonesimulator', '-derivedDataPath', File.join(options[:output], 'DerivedData'), "SYMROOT=#{File.join(options[:output], 'Products')}", "OBJROOT=#{File.join(options[:output], 'Intermediates')}", "BUILD_DIR=#{File.join(options[:output], 'Products')}" ] + architecture + signing
end
# 库存错误须在逐 Pod 构建前失败；后续真实 XCTest 与报告复用同一份精确清单。
application = nil
save.call
if File.directory?(File.join(root, 'JobsOCBaseConfigDemoTests')) || File.directory?(File.join(root, 'JobsOCBaseConfigDemo.xcodeproj'))
  require_relative 'jobs_stability_integrated.rb/jobs_stability_integrated'
  application = JobsStabilityIntegrated.pod_application_tests(root)
  record['application_tests'] = application
  record['application_test_configuration'] = JobsStabilityIntegrated.installed_pod_application_configuration(
    root, options[:configurations], require_installed: !options[:audit_only])
  save.call
  puts "PASS ApplicationTests inventory: #{application.fetch('expected_test_count')} cases"
end

# 在构建前核验实际 podspec/资源/selector 所有权，失败不会进入主工程验收。
audit_script = File.join(root, 'ScriptsByPods', '自动化测试相关脚本', 'jobs_pods_stability_audit.rb', 'jobs_pods_stability_audit.rb')
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

exit 0 if options[:audit_only]

passed = true
if %w[all pods].include?(options[:phase])
  if options[:batch_pods]
    require_relative 'jobs_stability_pod_batch.rb/jobs_stability_pod_batch'
    plan = JobsStabilityPodBatch.prepare(root, pods.keys, options[:output])
    assert_current_source.call
    options[:configurations].each do |configuration|
      batch_id = Digest::SHA256.hexdigest([revision, plan.fetch('membership_fingerprint'), configuration].join("\0"))
      evidence = {
        'execution_mode' => 'batch', 'batch_id' => batch_id,
        'members' => plan.fetch('targets'), 'membership_fingerprint' => plan.fetch('membership_fingerprint'),
        'batch_manifest' => plan.fetch('manifest'), 'batch_manifest_sha256' => plan.fetch('manifest_sha256')
      }
      args = ['-workspace', plan.fetch('workspace'), '-scheme', JobsStabilityPodBatch::NAME,
              '-destination', 'generic/platform=iOS Simulator', '-jobs', '2'] + build_base.call(configuration) + ['build']
      ok = execute.call('pod_batch', JobsStabilityPodBatch::NAME, configuration, args, evidence)
      batch = record['results'].reverse.find { |row| row['kind'] == 'pod_batch' && row['batch_id'] == batch_id }
      # 成员只领取同一批次的覆盖证据，不伪造独立进程、耗时或日志。
      plan.fetch('targets').each do |target|
        record['results'] << {
          'kind' => 'pod', 'name' => target.fetch('name'), 'configuration' => configuration,
          'source_fingerprint' => revision, 'source_consistent' => batch.fetch('source_consistent'),
          'exit_status' => batch.fetch('exit_status'), 'log' => batch.fetch('log'), 'seconds' => nil,
          'execution_mode' => 'batch-member', 'batch_id' => batch_id, 'target_uuid' => target.fetch('uuid'),
          'membership_fingerprint' => plan.fetch('membership_fingerprint'), 'batch_manifest' => plan.fetch('manifest'),
          'signing_policy' => 'unsigned'
        }
      end
      save.call
      assert_current_source.call
      unless ok
        passed = false
        break
      end
    end
  else
    options[:configurations].each do |configuration|
      pods.each_key do |name|
        ok = execute.call('pod', name, configuration, ['-project', 'Pods/Pods.xcodeproj', '-scheme', name, '-destination', 'generic/platform=iOS Simulator'] + build_base.call(configuration) + ['build'])
        passed = false unless ok
      end
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
      destination = "platform=iOS Simulator,id=#{options[:simulator]}"
      destination += ",arch=#{options[:architecture]}" if options[:architecture]
      common_args = ['-project', 'Pods/Pods.xcodeproj', '-scheme', test_scheme, '-destination', destination,
                     '-parallel-testing-enabled', 'NO'] + build_base.call(configuration, name == 'JobsBaseUI')
      evidence = {}
      action = 'test'
      if options[:separate_test_builds] || name == 'JobsOCSearcher'
        preparation_mode = { 'execution_mode' => 'separate-test-build' }
        ok = execute.call('test_build', name, configuration,
          common_args + ['-showBuildTimingSummary', 'build-for-testing'], preparation_mode)
        unless ok
          passed = false
          break
        end
        preparation = record['results'].reverse.find do |row|
          row.values_at('kind', 'name', 'configuration', 'source_fingerprint', 'execution_mode') ==
            ['test_build', name, configuration, revision, preparation_mode.fetch('execution_mode')]
        end
        unless preparation && preparation['exit_status'] == 0 && !preparation['timed_out'] &&
            preparation['source_consistent'] == true && preparation['process_status_collected'] == true &&
            preparation['process_exit_status'] == 0 && preparation['process_signal'].nil? && File.file?(preparation.fetch('log'))
          raise "#{name} #{configuration} 没有同一源码指纹的成功测试构建证据，不能执行已编译测试包。"
        end
        artifact_evidence = {}
        if name == 'JobsOCSearcher'
          require_relative 'update_readme_results.rb/update_readme_results'
          host = File.join(options[:output], 'Products', "#{configuration}-iphonesimulator", 'AppHost-JobsOCSearcher-Unit-Tests.app')
          receipt_path = File.join(options[:output], "JobsOCSearcher-#{configuration}-languages.json")
          begin
            assert_current_source.call
            receipt = JobsSearcherLanguageArtifact.prepare(root, host, configuration, receipt_path)
            artifact_evidence = { 'language_artifact' => receipt, 'language_artifact_path' => receipt_path,
                                  'searcher_signing_policy' => receipt.fetch('signing_policy'),
                                  'language_artifact_sha256' => Digest::SHA256.file(receipt_path).hexdigest }
            record['results'] << artifact_evidence.merge('kind' => 'language_artifact', 'name' => name,
              'configuration' => configuration, 'source_fingerprint' => revision, 'source_consistent' => true,
              'exit_status' => 0, 'log' => receipt_path)
            save.call
            assert_current_source.call
          rescue StandardError => error
            log = File.join(options[:output], "JobsOCSearcher-#{configuration}-languages-failed.log")
            File.write(log, "#{error.class}: #{error.message}\n")
            record['results'] << { 'kind' => 'language_artifact', 'name' => name, 'configuration' => configuration,
              'source_fingerprint' => revision, 'exit_status' => 79, 'log' => log, 'validation_error' => error.message }
            save.call
            puts "FAIL JobsOCSearcher language artifact: #{error.message}"
            passed = false
            break
          end
        end
        identity_keys = %w[kind name configuration source_fingerprint execution_mode signing_policy started_at log command
                           exit_status source_consistent timed_out process_status_collected process_exit_status process_signal process_pid]
        evidence = artifact_evidence.merge(
          'execution_mode' => 'test-without-building',
          'test_build_record' => preparation.select { |key, _value| identity_keys.include?(key) }
        )
        action = 'test-without-building'
      end
      args = common_args + ['-resultBundlePath', result_bundle, action]
      ok = execute.call('test', name, configuration, args, evidence)
      passed = false unless ok
      break unless ok
    end
    break unless passed
  end
  # macOS harness 编译真实生产实现，补充 fatal signal、SQLite 和构建期脚本等场景。
  pods.each do |name, spec|
    break unless passed
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
  # 主工程测试与 Pod 测试共用失败、超时和证据门禁，测试宿主仅在临时工程替换入口。
  if passed && application
    application_output = File.join(options[:output], 'ApplicationTests')
    plan = JobsStabilityIntegrated.prepare_plan(root, application_output)
    assert_current_source.call
    configuration = options[:configurations].first
    destination = "platform=iOS Simulator,id=#{options[:simulator]}"
    destination += ",arch=#{options[:architecture]}" if options[:architecture]
    architecture = options[:architecture] ? ["ARCHS=#{options[:architecture]}", 'ONLY_ACTIVE_ARCH=YES'] : ['ONLY_ACTIVE_ARCH=NO']
    products = File.join(application_output, 'Products')
    common_args = ['-workspace', plan.fetch('workspace'), '-scheme', plan.fetch('scheme'),
                   '-configuration', configuration, '-sdk', 'iphonesimulator', '-destination', destination,
                   '-parallel-testing-enabled', 'NO', '-derivedDataPath', File.join(application_output, 'DerivedData'),
                   "SYMROOT=#{products}", "OBJROOT=#{File.join(application_output, 'Intermediates')}", "BUILD_DIR=#{products}"] +
                  architecture + ['CODE_SIGNING_ALLOWED=YES', 'CODE_SIGNING_REQUIRED=YES', 'CODE_SIGN_IDENTITY=-']
    common_args += application.fetch('test_classes').map { |name| "-only-testing:#{JobsStabilityIntegrated::TESTS}/#{name}" }
    application_evidence = {
      'expected_test_count' => application.fetch('expected_test_count'), 'test_classes' => application.fetch('test_classes'),
      'test_inventory' => application.fetch('test_inventory'),
      'workspace' => plan.fetch('workspace'),
      'host_app' => File.join(products, "#{configuration}-iphonesimulator", JobsStabilityIntegrated::APP + '.app')
    }
    preparation_mode = application_evidence.merge('execution_mode' => 'separate-test-build')
    passed = execute.call('test_build', 'ApplicationTests', configuration,
      common_args + ['-showBuildTimingSummary', 'build-for-testing'], preparation_mode)
    if passed
      preparation = record['results'].reverse.find do |row|
        row.values_at('kind', 'name', 'configuration', 'source_fingerprint', 'execution_mode') ==
          ['test_build', 'ApplicationTests', configuration, revision, 'separate-test-build']
      end
      unless preparation && preparation['exit_status'] == 0 && preparation['timed_out'] == false &&
          preparation['source_consistent'] == true && preparation['process_status_collected'] == true &&
          preparation['process_exit_status'] == 0 && preparation['process_signal'].nil? && File.file?(preparation.fetch('log'))
        raise 'ApplicationTests 缺少同一指纹的成功测试构建证据。'
      end
      identity_keys = %w[kind name configuration source_fingerprint execution_mode signing_policy started_at log command
                         exit_status source_consistent timed_out process_status_collected process_exit_status process_signal process_pid]
      evidence = application_evidence.merge('execution_mode' => 'test-without-building',
        'test_build_record' => preparation.select { |key, _value| identity_keys.include?(key) })
      bundle = File.join(application_output, "ApplicationTests-#{configuration}-#{Time.now.strftime('%H%M%S%L')}.xcresult")
      passed = execute.call('test', 'ApplicationTests', configuration,
        common_args + ['-resultBundlePath', bundle, 'test-without-building'], evidence)
    end
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
