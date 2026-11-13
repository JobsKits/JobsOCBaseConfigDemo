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

require 'tmpdir'
require 'fileutils'
require_relative '../../update_readme_results.rb/update_readme_results'

# 用途：用临时证据验证测试、构建、签名和源码指纹的结果门禁，拒绝把缺失、跳过或过期结果写成通过。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
Dir.mktmpdir('jobs-readme-evidence-tests-') do |folder|
  log = File.join(folder, 'test.log')
  File.write(log, 'fixture result evidence')
  bundle = File.join(folder, 'suite.xcresult')
  Dir.mkdir(bundle)
  fingerprint = 'a' * 64
  valid = {
    'kind' => 'test', 'name' => 'FixturePod', 'configuration' => 'Debug',
    'source_fingerprint' => fingerprint, 'source_consistent' => true,
    'exit_status' => 0, 'log' => log, 'result_bundle' => bundle,
    'simulator' => 'AAAAAAAA-BBBB-CCCC-DDDD-EEEEEEEEEEEE',
    'test_summary' => { 'result' => 'Passed', 'totalTestCount' => 2, 'passedTests' => 2, 'failedTests' => 0, 'skippedTests' => 0 }
  }
  errors = []
  require_test(errors, { 'results' => [valid] }, fingerprint, folder, 'FixturePod', 'Debug')
  assert.call(errors.empty?, 'valid real-test evidence rejected')
  ['zero tests', 'all skipped', 'failed test', 'bad result', 'missing summary', 'missing bundle', 'missing simulator', 'wrong count', 'source changed', 'exit failure'].each do |scenario|
    row = Marshal.load(Marshal.dump(valid))
    case scenario
    when 'zero tests'
      row['test_summary'].merge!('totalTestCount' => 0, 'passedTests' => 0)
    when 'all skipped'
      row['test_summary'].merge!('passedTests' => 0, 'skippedTests' => 2)
    when 'failed test'
      row['test_summary'].merge!('passedTests' => 1, 'failedTests' => 1)
    when 'bad result'
      row['test_summary']['result'] = 'Failed'
    when 'missing summary'
      row.delete('test_summary')
    when 'missing bundle'
      row['result_bundle'] = File.join(folder, 'missing.xcresult')
    when 'missing simulator'
      row.delete('simulator')
    when 'wrong count'
      row['test_summary']['totalTestCount'] = 3
    when 'source changed'
      row['source_consistent'] = false
    when 'exit failure'
      row['exit_status'] = 76
    end
    errors = []
    require_test(errors, { 'results' => [row] }, fingerprint, folder, 'FixturePod', 'Debug')
    assert.call(!errors.empty?, "#{scenario} was accepted")
  end
  identifier = 'org.cocoapods.AppHost-JobsBaseUI-Unit-Tests'
  permissions = {
    'application-identifier' => identifier,
    'keychain-access-groups' => [identifier],
    'get-task-allow' => true
  }
  keychain = Marshal.load(Marshal.dump(valid))
  keychain.merge!(
    'name' => 'JobsBaseUI', 'signing_policy' => 'simulator-adhoc-keychain-v1',
    'host_signature' => {
      'bundle_identifier' => identifier, 'valid' => true,
      'codesign_exit_status' => 0, 'verification_exit_status' => 0,
      'code_signature_entitlements' => {},
      'permission_source' => 'simulator-binary-__TEXT-__entitlements',
      'compiled_permissions' => {
        'binary' => File.join(folder, 'AppHost-JobsBaseUI-Unit-Tests.app', 'AppHost-JobsBaseUI-Unit-Tests'),
        'valid' => true, 'binary_sha256' => 'c' * 64,
        'architectures' => %w[x86_64 arm64].map do |architecture|
          { 'architecture' => architecture, 'valid' => true,
            'section' => { 'offset' => 10116, 'size' => 438 },
            'entitlements' => Marshal.load(Marshal.dump(permissions)) }
        end
      }
    }
  )
  errors = []
  require_test(errors, { 'results' => [keychain] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(errors.empty?, 'actual-shaped all-architecture Simulator permission receipt rejected')
  signed_keychain = Marshal.load(Marshal.dump(keychain))
  signed_keychain['host_signature'].merge!(
    'permission_source' => 'code-signature', 'code_signature_entitlements' => permissions,
    'compiled_permissions' => nil
  )
  errors = []
  require_test(errors, { 'results' => [signed_keychain] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(errors.empty?, 'matching native code-signature permission receipt rejected')
  ['missing audit', 'false audit', 'partial skip', 'wrong policy', 'codesign failure',
   'verification failure', 'unknown permission source', 'missing compiled proof',
   'invalid sibling architecture', 'wrong compiled identity', 'missing binary hash'].each do |scenario|
    row = Marshal.load(Marshal.dump(keychain))
    case scenario
    when 'missing audit'
      row.delete('host_signature')
    when 'false audit'
      row['host_signature']['valid'] = false
    when 'partial skip'
      row['test_summary'].merge!('passedTests' => 1, 'skippedTests' => 1)
    when 'wrong policy'
      row['signing_policy'] = 'unsigned'
    when 'codesign failure'
      row['host_signature']['codesign_exit_status'] = 1
    when 'verification failure'
      row['host_signature']['verification_exit_status'] = 1
    when 'unknown permission source'
      row['host_signature']['permission_source'] = 'xcent-source'
    when 'missing compiled proof'
      row['host_signature']['compiled_permissions'] = nil
    when 'invalid sibling architecture'
      row['host_signature']['compiled_permissions']['architectures'].last['valid'] = false
    when 'wrong compiled identity'
      row['host_signature']['compiled_permissions']['architectures'].last['entitlements']['application-identifier'] = 'wrong.host'
    when 'missing binary hash'
      row['host_signature']['compiled_permissions'].delete('binary_sha256')
    end
    errors = []
    require_test(errors, { 'results' => [row] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
    assert.call(!errors.empty?, "Keychain #{scenario} was accepted")
  end
  row = Marshal.load(Marshal.dump(signed_keychain))
  row['host_signature']['code_signature_entitlements']['keychain-access-groups'] = ['wrong.host']
  errors = []
  require_test(errors, { 'results' => [row] }, fingerprint, folder, 'JobsBaseUI', 'Debug')
  assert.call(!errors.empty?, 'wrong native code-signature identity was accepted')
  stale = valid.merge('source_fingerprint' => 'b' * 64)
  assert.call(latest_result({ 'results' => [stale] }, fingerprint, 'test', 'FixturePod', 'Debug').nil?, 'old hash accepted')
  failure = valid.merge('exit_status' => 1)
  assert.call(latest_result({ 'results' => [valid, failure] }, fingerprint, 'test', 'FixturePod', 'Debug')['exit_status'] == 1, 'latest failure was hidden by previous success')

  preparation = {
    'kind' => 'test_build', 'name' => 'FixturePod', 'configuration' => 'Debug',
    'source_fingerprint' => fingerprint, 'execution_mode' => 'separate-test-build',
    'signing_policy' => 'unsigned', 'started_at' => '2026-10-29T05:00:00+08:00',
    'log' => log, 'command' => ['xcodebuild', '-scheme', 'FixturePod-Unit-Stability', 'build-for-testing'],
    'exit_status' => 0, 'source_consistent' => true, 'timed_out' => false,
    'process_status_collected' => true, 'process_exit_status' => 0, 'process_signal' => nil,
    'process_pid' => 12345
  }
  split = Marshal.load(Marshal.dump(valid))
  split.merge!('execution_mode' => 'test-without-building', 'signing_policy' => 'unsigned',
    'test_build_record' => Marshal.load(Marshal.dump(preparation)))
  errors = []
  require_test(errors, { 'results' => [preparation, split] }, fingerprint, folder, 'FixturePod', 'Debug')
  assert.call(errors.empty?, "valid split-test receipt rejected: #{errors.inspect}")
  ['missing preparation', 'missing proof', 'mismatched proof', 'later failed preparation',
   'later timed-out preparation', 'source changed in preparation', 'uncollected preparation status',
   'nonzero actual preparation exit', 'signaled preparation', 'wrong preparation mode',
   'wrong preparation signing', 'missing preparation log', 'missing preparation identity',
   'preparation after test', 'wrong preparation fingerprint', 'wrong preparation action',
   'unrecognized shared signing policy'].each do |scenario|
    build = Marshal.load(Marshal.dump(preparation))
    test = Marshal.load(Marshal.dump(split))
    rows = [build, test]
    case scenario
    when 'missing preparation'
      rows = [test]
    when 'missing proof'
      test.delete('test_build_record')
    when 'mismatched proof'
      test['test_build_record']['process_pid'] += 1
    when 'later failed preparation'
      rows << build.merge('exit_status' => 65, 'process_exit_status' => 65, 'process_pid' => 22345)
    when 'later timed-out preparation'
      rows << build.merge('exit_status' => 124, 'timed_out' => true, 'process_pid' => 22345)
    when 'source changed in preparation'
      build['source_consistent'] = false
    when 'uncollected preparation status'
      build['process_status_collected'] = false
    when 'nonzero actual preparation exit'
      build['process_exit_status'] = 65
    when 'signaled preparation'
      build['process_signal'] = 9
    when 'wrong preparation mode'
      build['execution_mode'] = 'individual'
    when 'wrong preparation signing'
      build['signing_policy'] = 'different-policy'
    when 'missing preparation log'
      build['log'] = File.join(folder, 'missing-build.log')
    when 'missing preparation identity'
      build.delete('process_pid')
    when 'preparation after test'
      rows = [test, build]
    when 'wrong preparation fingerprint'
      build['source_fingerprint'] = 'b' * 64
    when 'wrong preparation action'
      build['command'][-1] = 'test'
    when 'unrecognized shared signing policy'
      build['signing_policy'] = 'different-policy'
      test['signing_policy'] = 'different-policy'
    end
    # 对状态与日志类负例保留完全匹配的内嵌证据，确保不是仅靠内容不等拒领。
    matching_proof_cases = ['source changed in preparation', 'uncollected preparation status',
      'nonzero actual preparation exit', 'signaled preparation', 'wrong preparation mode',
      'wrong preparation signing', 'missing preparation log', 'missing preparation identity',
      'wrong preparation action', 'unrecognized shared signing policy']
    if matching_proof_cases.include?(scenario)
      test['test_build_record'] = Marshal.load(Marshal.dump(build))
    end
    errors = []
    require_test(errors, { 'results' => rows }, fingerprint, folder, 'FixturePod', 'Debug')
    assert.call(!errors.empty?, "split #{scenario} was accepted")
  end

  baseline_folder = File.join(folder, 'ScriptsByPods', 'jobs_pods_stability_audit.rb')
  FileUtils.mkdir_p(baseline_folder)
  baseline_path = File.join(baseline_folder, 'baseline.json')
  inventory = (1..109).map { |index| "FixturePod#{index}" } + ['JobsOCDeviceGuard']
  File.write(baseline_path, JSON.generate('expected_pods' => inventory.take(109)))
  accepted = validate_pod_inventory(folder, { 'self_pod_count' => 109 }, inventory.take(109))
  assert.call(accepted.size == 109, 'existing reviewed inventory was rejected')
  rejected = false
  begin
    validate_pod_inventory(folder, { 'self_pod_count' => 110 }, inventory)
  rescue StandardError
    rejected = true
  end
  assert.call(rejected, 'unreviewed 110th Pod was absorbed by the old inventory')
  File.write(baseline_path, JSON.generate('expected_pods' => inventory))
  actual = inventory.reverse
  accepted = validate_pod_inventory(folder, { 'self_pod_count' => 110 }, actual)
  assert.call(accepted == inventory, 'reviewed 110-Pod inventory was rejected or mutated')
  ['missing baseline', 'empty baseline', 'duplicate baseline', 'blank baseline name',
   'missing baseline field', 'wrong baseline field type', 'missing actual Pod', 'new actual Pod',
   'wrong recorded count', 'noninteger recorded count'].each do |scenario|
    expected = inventory.dup
    names = inventory.dup
    count = inventory.size
    baseline = { 'expected_pods' => expected }
    case scenario
    when 'empty baseline'
      baseline['expected_pods'] = []
    when 'duplicate baseline'
      expected << expected.first
    when 'blank baseline name'
      expected[-1] = ' '
    when 'missing baseline field'
      baseline = {}
    when 'wrong baseline field type'
      baseline['expected_pods'] = '110'
    when 'missing actual Pod'
      names.pop
    when 'new actual Pod'
      names[-1] = 'UnreviewedPod'
    when 'wrong recorded count'
      count -= 1
    when 'noninteger recorded count'
      count = count.to_f
    end
    File.write(baseline_path, JSON.generate(baseline))
    File.delete(baseline_path) if scenario == 'missing baseline'
    rejected = false
    begin
      validate_pod_inventory(folder, { 'self_pod_count' => count }, names)
    rescue StandardError
      rejected = true
    end
    assert.call(rejected, "inventory #{scenario} was accepted")
  end
  readme = File.join(folder, 'README.md')
  original = "# Fixture\n\n## 一、合同\n\n合同保持。\n\n## 二、本轮单元验证\n\n#{PENDING_PREFIX}原指纹门禁保持。\n\n## 三、边界\n\n仍待真机。\n"
  File.write(readme, original)
  replacement = "当前结果：**已完成；记录见根 #{RESULT_LINK}**。"
  before, updated = prepare_update(readme, replacement)
  assert.call(before == original && File.read(readme) == original, 'prepare mutated README')
  assert.call(updated == original.sub(PENDING_PREFIX, replacement), 'module contract changed')
  File.write(readme, original.sub(PENDING_PREFIX, replacement))
  rejected = false
  begin
    prepare_update(readme, replacement)
  rescue StandardError
    rejected = true
  end
  assert.call(rejected, 'already-filled README was overwritten')
  File.write(readme, original + "\n## 四、本轮单元验证\n#{PENDING_PREFIX}\n")
  rejected = false
  begin
    prepare_update(readme, replacement)
  rescue StandardError
    rejected = true
  end
  assert.call(rejected, 'duplicate chapter accepted')
end
puts "PASS #{checks} fixture checks; no project README changed and no build/install invoked"
