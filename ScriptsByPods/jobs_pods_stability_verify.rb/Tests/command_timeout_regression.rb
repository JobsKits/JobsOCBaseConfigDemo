#!/usr/bin/env ruby
# 用真实进程验证命令回收和runner结果合同，不执行Xcode或安装依赖。
require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'tmpdir'
require_relative '../jobs_stability_command'

# 在失败处中止，避免把部分成功汇总为完整回归。
def assert(condition, message)
  raise message unless condition
end

# 有界等待fixture就绪或停止，不依赖单个固定启动延迟。
def wait_until(seconds = 3)
  deadline = Process.clock_gettime(Process::CLOCK_MONOTONIC) + seconds
  loop do
    return true if yield
    return false if Process.clock_gettime(Process::CLOCK_MONOTONIC) >= deadline
    sleep(0.02)
  end
end

# 已退出的孤儿可能短暂为zombie；只把实际仍执行的进程计为存活。
def running?(pid)
  Process.kill(0, pid)
  state, status = Open3.capture2('ps', '-o', 'stat=', '-p', pid.to_s)
  status.success? && !state.strip.empty? && !state.strip.start_with?('Z')
rescue Errno::ESRCH
  false
end

# 只清理本测试创建并记录的独立进程组。
def cleanup_group(pid)
  return unless pid
  begin
    Process.kill('KILL', -pid)
  rescue Errno::ESRCH
  end
  begin
    Process.wait2(pid)
  rescue Errno::ECHILD
  end
end

# 确认helper确实wait2领取了直接子进程状态。
def assert_reaped(pid)
  begin
    Process.wait2(pid, Process::WNOHANG)
    raise 'direct child was not reaped'
  rescue Errno::ECHILD
  end
end

# 将真实Ruby进程输出写入fixture日志，便于失败诊断。
def run_ruby(folder, source, timeout: 2, grace: 0.15, arguments: [])
  File.open(File.join(folder, 'command.log'), 'w') do |output|
    JobsStabilityCommand.run([RbConfig.ruby, '-e', source] + arguments,
      chdir: folder, output: output, timeout_seconds: timeout, grace_seconds: grace)
  end
end

# 同组真实父子都忽略TERM，必须KILL；单独无关组不能被误杀。
def test_nested_timeout(folder, parent_exits:)
  metadata = File.join(folder, 'nested.json')
  heartbeat = File.join(folder, 'heartbeat')
  unrelated_ready = File.join(folder, 'unrelated.pid')
  unrelated_term = File.join(folder, 'unrelated.term')
  unrelated = nil
  nested = nil
  begin
    unrelated = Process.spawn(RbConfig.ruby, '-e', <<~'RUBY', unrelated_ready, unrelated_term, pgroup: true, out: File::NULL, err: File::NULL)
      trap('TERM') { File.write(ARGV[1], 'unexpected TERM'); exit(91) }
      File.write(ARGV[0], Process.pid.to_s)
      loop { sleep(1) }
    RUBY
    assert(wait_until { File.file?(unrelated_ready) }, 'unrelated group failed to start')
    source = <<~'RUBY'
      require 'json'
      trap('TERM', ARGV[2] == 'exit' ? proc { exit(0) } : 'IGNORE')
      child = fork do
        trap('TERM', 'IGNORE')
        count = 0
        loop do
          File.write(ARGV[1], (count += 1).to_s)
          sleep(0.02)
        end
      end
      File.write(ARGV[0], JSON.generate(parent: Process.pid, child: child, group: Process.getpgrp))
      loop { sleep(1) }
    RUBY
    result = run_ruby(folder, source, timeout: 0.8, arguments: [metadata, heartbeat, parent_exits ? 'exit' : 'ignore'])
    nested = JSON.parse(File.read(metadata))
    assert(nested['group'] == nested['parent'] && nested['parent'] == result[:pid], 'command did not receive its own process group')
    assert(File.file?(heartbeat), 'nested child never executed')
    assert(result[:timed_out] && result[:kill_sent], 'timeout failed to escalate for ignoring child')
    assert(result[:seconds] < 3, 'timeout failed to return promptly')
    if parent_exits
      assert(result[:status].exitstatus == 0, 'actual graceful parent exit was lost')
    else
      assert(result[:status].signaled? && result[:status].termsig == Signal.list.fetch('KILL'), 'ignoring parent was not killed')
    end
    assert_reaped(result[:pid])
    assert(wait_until { !running?(nested['child']) }, 'nested child remains running')
    ticks = File.read(heartbeat)
    sleep(0.1)
    assert(File.read(heartbeat) == ticks, 'nested child is still writing after timeout')
    assert(running?(unrelated) && Process.getpgid(unrelated) == unrelated, 'unrelated process group was killed')
    assert(!File.exist?(unrelated_term), 'unrelated process group received TERM')
  ensure
    cleanup_group(nested && nested['parent'])
    cleanup_group(unrelated)
  end
end

# 临时工程用真实fake命令验证runner的124/75及拒领部分结果包，不调用真实xcodebuild。
def test_runner_timeout(folder, source_changes:, permission_failure: false)
  row = nil
  root = File.join(folder, 'fixture-root')
  scripts = File.join(root, 'ScriptsByPods', 'jobs_pods_stability_verify.rb')
  pod_dir = File.join(root, 'JobsByPods', 'Fixture@Pods')
  tools = File.join(root, 'fixture-bin')
  FileUtils.mkdir_p([scripts, pod_dir, tools, File.join(root, 'Pods', 'Pods.xcodeproj')])
  %w[jobs_pods_stability_verify.rb jobs_stability_command.rb jobs_stability_host_entitlements.rb].each do |name|
    FileUtils.cp(File.expand_path('../' + name, __dir__), File.join(scripts, name))
  end
  spec = File.join(pod_dir, 'Fixture.podspec')
  File.write(spec, "spec.test_spec 'Stability' do |test_spec|\nend\n")
  fake = File.join(tools, 'xcodebuild')
  File.write(fake, "#!#{RbConfig.ruby}\n" + <<~'RUBY')
    require 'fileutils'
    if ARGV.include?('-version')
      puts "Fixture Xcode\nBuild fixture"
      exit(0)
    end
    bundle_index = ARGV.index('-resultBundlePath')
    FileUtils.mkdir_p(ARGV[bundle_index + 1]) if bundle_index
    File.open(ENV.fetch('FIXTURE_SPEC'), 'a') { |file| file.puts('# changed during execution') } if ENV['FIXTURE_CHANGE'] == '1'
    trap('TERM') { exit(0) }
    loop { sleep(1) }
  RUBY
  File.chmod(0755, fake)
  xcrun = File.join(tools, 'xcrun')
  queried = File.join(root, 'unexpected-xcresult-query')
  # Apple系统Ruby启动也查询xcrun；只拦截本测试的xcresulttool，工具定位仍走系统入口。
  File.write(xcrun, <<~'SHELL')
    #!/bin/sh
    if [ "$1" = "xcresulttool" ]; then
      printf 'unexpected' > "$FIXTURE_QUERY"
      exit 0
    fi
    exec /usr/bin/xcrun "$@"
  SHELL
  File.chmod(0755, xcrun)
  output_dir = File.join(root, 'work', 'results')
  env = { 'PATH' => tools + File::PATH_SEPARATOR + ENV.fetch('PATH'), 'FIXTURE_SPEC' => spec,
    'FIXTURE_CHANGE' => source_changes ? '1' : '0', 'FIXTURE_QUERY' => queried }
  if permission_failure
    injection = File.join(root, 'synthetic_eperm.rb')
    File.write(injection, <<~'RUBY')
      original = Process.method(:kill)
      Process.define_singleton_method(:kill) do |signal, target|
        if [0, 'TERM', 'KILL'].include?(signal)
          raise Errno::EPERM, 'synthetic runner permission boundary'
        end
        original.call(signal, target)
      end
    RUBY
    env['RUBYOPT'] = '-r' + injection
  end
  command = [env, RbConfig.ruby, File.join(scripts, 'jobs_pods_stability_verify.rb'),
    '--phase', 'tests', '--pod', 'Fixture', '--simulator', 'fixture-udid',
    '--test-timeout', '0.3', '--output', output_dir]
  result = File.open(File.join(folder, 'runner.log'), 'w') do |output|
    JobsStabilityCommand.run(command, chdir: root, output: output, timeout_seconds: 20, grace_seconds: 0.15)
  end
  assert(!result[:timed_out] && !result[:status].success?, "runner accepted timeout or failed to return: #{result.inspect}\n#{File.read(File.join(folder, 'runner.log'))}")
  record = JSON.parse(File.read(File.join(output_dir, 'results.json')))
  row = record.fetch('results').find { |item| item['kind'] == 'test' }
  assert(row && row['timed_out'], 'runner did not record timeout')
  assert(row['exit_status'] == (source_changes ? 75 : 124), 'verified timeout/source-change exit precedence is wrong')
  if permission_failure
    assert(row['process_exit_status'].nil? && row['process_signal'].nil? && !row['process_status_collected'], 'runner falsified unavailable process status')
    assert(row.fetch('termination_diagnostics').any? { |d| d['error'] == 'Errno::EPERM' }, 'runner discarded permission diagnostics')
    assert(running?(row.fetch('process_pid')), 'runner fixture did not leave a real inaccessible child')
  else
    assert(row['process_exit_status'] == 0 && row['process_signal'].nil?, 'actual graceful process status was lost')
  end
  assert(row['source_consistent'] == !source_changes, 'source consistency evidence is wrong')
  assert(row['timeout_seconds'] == 0.3 && row['seconds'] >= 0.3, 'timeout/monotonic duration missing')
  assert(row.fetch('command').first == 'xcodebuild' && File.file?(row.fetch('log')), 'real command/log missing')
  assert(!row.key?('result_bundle') && !row.key?('test_summary') && !File.exist?(queried), 'timed-out partial result bundle was accepted or queried')
  log = File.read(row.fetch('log'))
  expected_status = permission_failure ? 'nil' : '0'
  assert(log.include?('TERM process group') && log.include?('Verified process exit status: ' + expected_status), 'termination/process evidence missing from log')
ensure
  cleanup_group(row['process_pid']) if permission_failure && row && row['process_pid']
end

# 权限边界显式注入EPERM；spawn/等待/存活/独立组均为真实进程。
def with_injected_eperm(deny_direct:)
  original = Process.method(:kill)
  calls = []
  Process.define_singleton_method(:kill) do |signal, target|
    calls << [signal, target]
    if target.negative? || deny_direct
      raise Errno::EPERM, 'synthetic permission boundary'
    end
    original.call(signal, target)
  end
  yield calls
ensure
  Process.define_singleton_method(:kill, original) if original
end

# group权限失败时只能fallback本次child；不可把残留真实后代算已清理。
def test_group_eperm(folder)
  metadata = File.join(folder, 'nested.json')
  heartbeat = File.join(folder, 'heartbeat')
  unrelated = Process.spawn(RbConfig.ruby, '-e', 'loop { sleep(1) }', pgroup: true, out: File::NULL, err: File::NULL)
  nested = nil
  calls = nil
  begin
    source = <<~'RUBY'
      require 'json'
      trap('TERM', 'IGNORE')
      child = fork do
        trap('TERM', 'IGNORE')
        count = 0
        loop { File.write(ARGV[1], (count += 1).to_s); sleep(0.02) }
      end
      File.write(ARGV[0], JSON.generate(parent: Process.pid, child: child, group: Process.getpgrp))
      loop { sleep(1) }
    RUBY
    result = with_injected_eperm(deny_direct: false) do |recorded|
      calls = recorded
      run_ruby(folder, source, timeout: 0.8, arguments: [metadata, heartbeat])
    end
    nested = JSON.parse(File.read(metadata))
    assert(result[:timed_out] && result[:status_collected] && result[:kill_sent], 'group EPERM prevented direct child fallback')
    assert(result[:status].signaled? && result[:status].termsig == Signal.list.fetch('KILL'), 'actual fallback status was not collected')
    assert_reaped(result[:pid])
    assert(result[:seconds] < 3, 'group EPERM wait was not bounded')
    diagnostics = result[:termination_diagnostics]
    assert(diagnostics.any? { |d| d[:operation] == 'probe' && d[:error] == 'Errno::EPERM' }, 'EPERM probe was treated as absent')
    assert(%w[TERM KILL].all? { |signal| diagnostics.any? { |d| d[:signal] == signal && d[:target] == -result[:pid] } }, 'group permission failure not retained')
    assert(calls.all? { |_, pid| [result[:pid], -result[:pid]].include?(pid) }, 'helper signaled an unrelated PID/group')
    assert(running?(nested['child']), 'fixture did not expose uncleared descendant')
    assert(running?(unrelated), 'unrelated group was touched')
  ensure
    nested ||= JSON.parse(File.read(metadata)) if File.file?(metadata)
    cleanup_group(nested && nested['parent'])
    cleanup_group(unrelated)
  end
end

# group与child信号都拒绝时返回nil真实状态，不能无界wait或伪造exit0。
def test_all_eperm(folder)
  metadata = File.join(folder, 'child.pid')
  result = nil
  begin
    result = with_injected_eperm(deny_direct: true) do |calls|
      run_ruby(folder, 'trap("TERM", "IGNORE"); File.write(ARGV[0], Process.pid.to_s); loop { sleep(1) }', timeout: 0.5, arguments: [metadata])
    end
    assert(result[:timed_out] && !result[:status_collected] && result[:status].nil? && !result[:kill_sent], 'unavailable status or failed signal was falsified')
    assert(result[:seconds] < 2, 'all EPERM caused unbounded wait')
    assert(running?(result[:pid]), 'fixture should remain alive until test-owned cleanup')
    assert(result[:termination_diagnostics].any? { |d| d[:target] == result[:pid] && d[:signal] == 'KILL' && d[:error] == 'Errno::EPERM' }, 'direct child permission error missing')
    assert(File.read(File.join(folder, 'command.log')).include?('may still be running'), 'incomplete cleanup warning missing')
  ensure
    cleanup_group(result ? result[:pid] : (File.read(metadata).to_i if File.file?(metadata)))
  end
end

# ensure自身EPERM/有限回收不遮盖最初输出异常；进程状态仍由测试真实回收。
def test_ensure_eperm(folder)
  metadata = File.join(folder, 'child.pid')
  sentinel = Class.new(StandardError)
  output = Object.new
  output.define_singleton_method(:puts) { |*| raise sentinel, 'original output failure' }
  output.define_singleton_method(:flush) {}
  output.define_singleton_method(:to_io) { File.open(File::NULL, 'w') }
  begin
    with_injected_eperm(deny_direct: true) do
      begin
        JobsStabilityCommand.run([RbConfig.ruby, '-e', 'File.write(ARGV[0], Process.pid.to_s); loop { sleep(1) }', metadata],
          chdir: folder, output: output, timeout_seconds: 0.5, grace_seconds: 0.15)
        raise 'original exception disappeared'
      rescue sentinel => error
        assert(error.message == 'original output failure', 'ensure replaced the original failure')
      end
    end
  ensure
    cleanup_group(File.read(metadata).to_i) if File.file?(metadata)
  end
end

cases = {
  'normal success preserves actual status and reaps child' => proc do |folder|
    result = run_ruby(folder, 'puts "normal success"')
    assert(result[:status].success? && !result[:timed_out] && !result[:kill_sent], 'normal success was changed')
    assert(File.read(File.join(folder, 'command.log')).include?('normal success'), 'stdout lost')
    assert_reaped(result[:pid])
  end,
  'nonzero exit is preserved' => proc do |folder|
    result = run_ruby(folder, 'warn "actual failure"; exit(37)')
    assert(result[:status].exitstatus == 37 && !result[:timed_out], 'nonzero exit was changed')
    assert(File.read(File.join(folder, 'command.log')).include?('actual failure'), 'stderr lost')
    assert_reaped(result[:pid])
  end,
  'TERM-ignoring parent and child are killed without touching unrelated group' => proc do |folder|
    test_nested_timeout(folder, parent_exits: false)
  end,
  'TERM-exited parent does not leave ignoring child alive' => proc do |folder|
    test_nested_timeout(folder, parent_exits: true)
  end,
  'runner timeout records 124 even when TERM handler exits zero; partial bundle rejected' => proc do |folder|
    test_runner_timeout(folder, source_changes: false)
  end,
  'source-change 75 takes precedence over timeout 124' => proc do |folder|
    test_runner_timeout(folder, source_changes: true)
  end,
  'synthetic group EPERM preserves diagnostics and reaps only actual direct child' => proc do |folder|
    test_group_eperm(folder)
  end,
  'synthetic group and direct-child EPERM returns bounded honest unavailable status' => proc do |folder|
    test_all_eperm(folder)
  end,
  'synthetic ensure EPERM never masks original exception' => proc do |folder|
    test_ensure_eperm(folder)
  end,
  'synthetic runner EPERM records honest 124 or source-change 75 and rejects partial bundle' => proc do |folder|
    [false, true].each do |changes|
      case_folder = File.join(folder, changes ? 'changed' : 'same')
      FileUtils.mkdir_p(case_folder)
      test_runner_timeout(case_folder, source_changes: changes, permission_failure: true)
    end
  end,
  'invalid timeout never starts command' => proc do |folder|
    marker = File.join(folder, 'should-not-exist')
    [0, -1, Float::NAN, Float::INFINITY].each do |timeout|
      begin
        run_ruby(folder, 'File.write(ARGV[0], "started")', timeout: timeout, arguments: [marker])
        raise 'invalid timeout accepted'
      rescue ArgumentError
        assert(!File.exist?(marker), 'invalid timeout started command')
      end
    end
  end
}
cases.each do |name, test|
  Dir.mktmpdir('jobs-stability-command-') { |folder| test.call(folder) }
  puts "PASS #{name}"
end
puts "#{cases.size} scenarios passed (7 original actual-process + 4 explicitly injected EPERM boundaries with actual processes); no Xcode build/install executed."
