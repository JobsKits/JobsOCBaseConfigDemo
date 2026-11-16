#!/usr/bin/env ruby
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

require 'fileutils'
require 'json'
require 'open3'
require 'rbconfig'
require 'tmpdir'
require_relative '../../jobs_stability_command.rb/jobs_stability_command'

# 用途：用真实受控进程验证 runner 的超时终止、进程回收和结果记录，不执行 Xcode 或安装依赖。
# 运行：终端用 ruby 执行本文件，或由现有 CI 调用；属于脚本回归，不加入主 App 或 XCTest Target。

FIXTURE_STARTUP_BUDGET = 5.0

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

# 用同一单调时钟核对fixture初始化（含所需trap和首次心跳）在预算内完成。
def fixture_ready_metadata(path, started, folder, log: 'command.log')
  log_path = File.join(folder, log)
  diagnostic = "fixture was not ready within #{FIXTURE_STARTUP_BUDGET}s\n#{File.read(log_path) if File.file?(log_path)}"
  assert(File.file?(path), diagnostic)
  metadata = JSON.parse(File.read(path))
  seconds = metadata.fetch('ready_at') - started
  assert(seconds >= 0 && seconds <= FIXTURE_STARTUP_BUDGET, diagnostic)
  metadata
end

# timeout包含明确的启动预算，结束耗时仍须满足真实deadline和原收尾预算。
def assert_timeout_window(result, cleanup_seconds:)
  timeout = result.fetch(:timeout_seconds)
  assert(result[:seconds] >= timeout && result[:seconds] < timeout + cleanup_seconds,
    "timeout duration escaped its bounded window: #{result.inspect}")
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
def run_ruby(folder, source, timeout: FIXTURE_STARTUP_BUDGET + 2, grace: 0.15, arguments: [])
  File.open(File.join(folder, 'command.log'), 'w') do |output|
    JobsStabilityCommand.run([RbConfig.ruby, '-e', source] + arguments,
      chdir: folder, output: output, timeout_seconds: timeout, grace_seconds: grace)
  end
end

# 同组真实父子都忽略TERM，必须KILL；单独无关组不能被误杀。
def test_nested_timeout(folder, parent_exits:, startup_delay: 0)
  metadata = File.join(folder, 'nested.json')
  heartbeat = File.join(folder, 'heartbeat')
  unrelated_ready = File.join(folder, 'unrelated.pid')
  unrelated_term = File.join(folder, 'unrelated.term')
  unrelated = nil
  nested = nil
  result = nil
  begin
    unrelated = Process.spawn(RbConfig.ruby, '-e', <<~'RUBY', unrelated_ready, unrelated_term, pgroup: true, out: File::NULL, err: File::NULL)
      trap('TERM') { File.write(ARGV[1], 'unexpected TERM'); exit(91) }
      File.write(ARGV[0], Process.pid.to_s)
      loop { sleep(1) }
    RUBY
    assert(wait_until(FIXTURE_STARTUP_BUDGET) { File.file?(unrelated_ready) }, 'unrelated group failed to start')
    source = <<~'RUBY'
      sleep(Float(ARGV[3]))
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
      sleep(0.01) until File.file?(ARGV[1])
      File.write(ARGV[0] + '.tmp', JSON.generate(parent: Process.pid, child: child, group: Process.getpgrp,
        ready_at: Process.clock_gettime(Process::CLOCK_MONOTONIC)))
      File.rename(ARGV[0] + '.tmp', ARGV[0])
      loop { sleep(1) }
    RUBY
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = run_ruby(folder, source, timeout: FIXTURE_STARTUP_BUDGET + 0.8,
      arguments: [metadata, heartbeat, parent_exits ? 'exit' : 'ignore', startup_delay.to_s])
    nested = fixture_ready_metadata(metadata, started, folder)
    ready_after = nested.fetch('ready_at') - started
    assert(ready_after >= startup_delay && ready_after > 0.8, 'slow fixture did not exceed the legacy timeout') if startup_delay.positive?
    assert(nested['group'] == nested['parent'] && nested['parent'] == result[:pid], 'command did not receive its own process group')
    assert(File.file?(heartbeat), 'nested child never executed')
    assert(result[:timed_out] && result[:kill_sent], 'timeout failed to escalate for ignoring child')
    assert_timeout_window(result, cleanup_seconds: 2.2)
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
    cleanup_group(result ? result[:pid] : (nested && nested['parent']))
    cleanup_group(unrelated)
  end
end

# 临时工程用真实fake命令验证runner的124/75及拒领部分结果包，不调用真实xcodebuild。
def test_runner_timeout(folder, source_changes:, permission_failure: false)
  row = nil
  root = File.join(folder, 'fixture-root')
  scripts = File.join(root, 'ScriptsByPods', '自动化测试相关脚本', 'jobs_pods_stability_verify.rb')
  pod_dir = File.join(root, 'JobsByPods', 'Fixture@Pods')
  tools = File.join(root, 'fixture-bin')
  FileUtils.mkdir_p([scripts, pod_dir, tools, File.join(root, 'Pods', 'Pods.xcodeproj')])
  %w[jobs_pods_stability_verify.rb jobs_stability_command.rb jobs_stability_host_entitlements.rb jobs_stability_sources.rb].each do |name|
    FileUtils.cp_r(File.expand_path('../../' + name, __dir__), File.join(scripts, name))
  end
  spec = File.join(pod_dir, 'Fixture.podspec')
  File.write(spec, "spec.test_spec 'Stability' do |test_spec|\nend\n")
  fake = File.join(tools, 'xcodebuild')
  File.write(fake, "#!#{RbConfig.ruby}\n" + <<~'RUBY')
    if ARGV.include?('-version')
      puts "Fixture Xcode\nBuild fixture"
      exit(0)
    end
    trap('TERM') { File.write(ENV.fetch('FIXTURE_TERM'), Process.clock_gettime(Process::CLOCK_MONOTONIC).to_s); exit(0) }
    require 'fileutils'
    require 'json'
    bundle_index = ARGV.index('-resultBundlePath')
    FileUtils.mkdir_p(ARGV[bundle_index + 1]) if bundle_index
    File.open(ENV.fetch('FIXTURE_SPEC'), 'a') { |file| file.puts('# changed during execution') } if ENV['FIXTURE_CHANGE'] == '1'
    File.write(ENV.fetch('FIXTURE_READY'), JSON.generate(pid: Process.pid,
      ready_at: Process.clock_gettime(Process::CLOCK_MONOTONIC)))
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
  ready = File.join(root, 'command-ready.json')
  term = File.join(root, 'command-term')
  env = { 'PATH' => tools + File::PATH_SEPARATOR + ENV.fetch('PATH'), 'FIXTURE_SPEC' => spec,
    'FIXTURE_CHANGE' => source_changes ? '1' : '0', 'FIXTURE_QUERY' => queried,
    'FIXTURE_READY' => ready, 'FIXTURE_TERM' => term }
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
  test_timeout = FIXTURE_STARTUP_BUDGET + 0.3
  # 内层可能耗尽两次默认5秒grace，外层仍保留启动及收尾余量。
  runner_timeout = test_timeout + 2 * 5 + FIXTURE_STARTUP_BUDGET + 2
  command = [env, RbConfig.ruby, File.join(scripts, 'jobs_pods_stability_verify.rb'),
    '--phase', 'tests', '--pod', 'Fixture', '--simulator', 'fixture-udid',
    '--test-timeout', test_timeout.to_s, '--output', output_dir]
  started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
  result = File.open(File.join(folder, 'runner.log'), 'w') do |output|
    JobsStabilityCommand.run(command, chdir: root, output: output,
      timeout_seconds: runner_timeout, grace_seconds: 0.15)
  end
  assert(!result[:timed_out] && !result[:status].success?, "runner accepted timeout or failed to return: #{result.inspect}\n#{File.read(File.join(folder, 'runner.log'))}")
  results_path = File.join(output_dir, 'results.json')
  assert(File.file?(results_path), "runner did not write results: #{File.read(File.join(folder, 'runner.log'))}")
  record = JSON.parse(File.read(results_path))
  row = record.fetch('results').find { |item| item['kind'] == 'test' }
  assert(row && row['timed_out'], 'runner did not record timeout')
  ready_metadata = fixture_ready_metadata(ready, started, folder, log: 'runner.log')
  assert(ready_metadata['pid'] == row['process_pid'], 'ready evidence belongs to another fixture process')
  assert(row['exit_status'] == (source_changes ? 75 : 124), 'verified timeout/source-change exit precedence is wrong')
  if permission_failure
    assert(row['process_exit_status'].nil? && row['process_signal'].nil? && !row['process_status_collected'], 'runner falsified unavailable process status')
    assert(row.fetch('termination_diagnostics').any? { |d| d['error'] == 'Errno::EPERM' }, 'runner discarded permission diagnostics')
    assert(running?(row.fetch('process_pid')), 'runner fixture did not leave a real inaccessible child')
  else
    assert(row['process_exit_status'] == 0 && row['process_signal'].nil?, 'actual graceful process status was lost')
    assert(File.file?(term) && Float(File.read(term)) >= ready_metadata.fetch('ready_at'),
      'ready fixture never handled the real TERM signal')
  end
  assert(row['source_consistent'] == !source_changes, 'source consistency evidence is wrong')
  assert(row['timeout_seconds'] == test_timeout && row['seconds'] >= test_timeout &&
    row['seconds'] < test_timeout + 11, 'timeout/monotonic bounded duration missing')
  assert(row.fetch('command').first == 'xcodebuild' && File.file?(row.fetch('log')), 'real command/log missing')
  assert(!row.key?('result_bundle') && !row.key?('test_summary') && !File.exist?(queried), 'timed-out partial result bundle was accepted or queried')
  log = File.read(row.fetch('log'))
  expected_status = permission_failure ? 'nil' : '0'
  assert(log.include?('TERM process group') && log.include?('Verified process exit status: ' + expected_status), 'termination/process evidence missing from log')
ensure
  fixture_pid = row && row['process_pid']
  fixture_pid ||= JSON.parse(File.read(ready))['pid'] if ready && File.file?(ready)
  cleanup_group(fixture_pid)
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
  result = nil
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
      sleep(0.01) until File.file?(ARGV[1])
      File.write(ARGV[0] + '.tmp', JSON.generate(parent: Process.pid, child: child, group: Process.getpgrp,
        ready_at: Process.clock_gettime(Process::CLOCK_MONOTONIC)))
      File.rename(ARGV[0] + '.tmp', ARGV[0])
      loop { sleep(1) }
    RUBY
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = with_injected_eperm(deny_direct: false) do |recorded|
      calls = recorded
      run_ruby(folder, source, timeout: FIXTURE_STARTUP_BUDGET + 0.8, arguments: [metadata, heartbeat])
    end
    nested = fixture_ready_metadata(metadata, started, folder)
    assert(result[:timed_out] && result[:status_collected] && result[:kill_sent], 'group EPERM prevented direct child fallback')
    assert(result[:status].signaled? && result[:status].termsig == Signal.list.fetch('KILL'), 'actual fallback status was not collected')
    assert_reaped(result[:pid])
    assert_timeout_window(result, cleanup_seconds: 2.2)
    diagnostics = result[:termination_diagnostics]
    assert(diagnostics.any? { |d| d[:operation] == 'probe' && d[:error] == 'Errno::EPERM' }, 'EPERM probe was treated as absent')
    assert(%w[TERM KILL].all? { |signal| diagnostics.any? { |d| d[:signal] == signal && d[:target] == -result[:pid] } }, 'group permission failure not retained')
    assert(calls.all? { |_, pid| [result[:pid], -result[:pid]].include?(pid) }, 'helper signaled an unrelated PID/group')
    assert(running?(nested['child']), 'fixture did not expose uncleared descendant')
    assert(running?(unrelated), 'unrelated group was touched')
  ensure
    nested ||= JSON.parse(File.read(metadata)) if File.file?(metadata)
    cleanup_group(result ? result[:pid] : (nested && nested['parent']))
    cleanup_group(unrelated)
  end
end

# group与child信号都拒绝时返回nil真实状态，不能无界wait或伪造exit0。
def test_all_eperm(folder)
  metadata = File.join(folder, 'child.json')
  result = nil
  begin
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    result = with_injected_eperm(deny_direct: true) do |calls|
      run_ruby(folder, 'require "json"; trap("TERM", "IGNORE"); File.write(ARGV[0], JSON.generate(pid: Process.pid, ready_at: Process.clock_gettime(Process::CLOCK_MONOTONIC))); loop { sleep(1) }',
        timeout: FIXTURE_STARTUP_BUDGET + 0.5, arguments: [metadata])
    end
    fixture_ready_metadata(metadata, started, folder)
    assert(result[:timed_out] && !result[:status_collected] && result[:status].nil? && !result[:kill_sent], 'unavailable status or failed signal was falsified')
    assert_timeout_window(result, cleanup_seconds: 1.5)
    assert(running?(result[:pid]), 'fixture should remain alive until test-owned cleanup')
    assert(result[:termination_diagnostics].any? { |d| d[:target] == result[:pid] && d[:signal] == 'KILL' && d[:error] == 'Errno::EPERM' }, 'direct child permission error missing')
    assert(File.read(File.join(folder, 'command.log')).include?('may still be running'), 'incomplete cleanup warning missing')
  ensure
    cleanup_group(result ? result[:pid] : (JSON.parse(File.read(metadata))['pid'] if File.file?(metadata)))
  end
end

# ensure自身EPERM/有限回收不遮盖最初输出异常；进程状态仍由测试真实回收。
def test_ensure_eperm(folder)
  metadata = File.join(folder, 'child.json')
  sentinel = Class.new(StandardError)
  timed_out_pid = nil
  output = Object.new
  output.define_singleton_method(:puts) do |message|
    timed_out_pid ||= message[/TERM process group (\d+)/, 1]&.to_i
    raise sentinel, 'original output failure'
  end
  output.define_singleton_method(:flush) {}
  output.define_singleton_method(:to_io) { File.open(File::NULL, 'w') }
  begin
    started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    with_injected_eperm(deny_direct: true) do
      begin
        JobsStabilityCommand.run([RbConfig.ruby, '-e', 'require "json"; File.write(ARGV[0], JSON.generate(pid: Process.pid, ready_at: Process.clock_gettime(Process::CLOCK_MONOTONIC))); loop { sleep(1) }', metadata],
          chdir: folder, output: output, timeout_seconds: FIXTURE_STARTUP_BUDGET + 0.5, grace_seconds: 0.15)
        raise 'original exception disappeared'
      rescue sentinel => error
        assert(error.message == 'original output failure', 'ensure replaced the original failure')
      end
    end
    fixture_ready_metadata(metadata, started, folder)
    seconds = Process.clock_gettime(Process::CLOCK_MONOTONIC) - started
    assert(seconds >= FIXTURE_STARTUP_BUDGET + 0.5 && seconds < FIXTURE_STARTUP_BUDGET + 2,
      'ensure EPERM cleanup escaped its bounded timeout window')
  ensure
    cleanup_group(timed_out_pid || (JSON.parse(File.read(metadata))['pid'] if File.file?(metadata)))
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
  'bounded readiness covers fixture startup slower than the legacy timeout' => proc do |folder|
    test_nested_timeout(folder, parent_exits: false, startup_delay: 1)
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
  folder = Dir.mktmpdir('jobs-stability-command-')
  completed = false
  begin
    test.call(folder)
    completed = true
  ensure
    FileUtils.remove_entry(folder) if completed
    warn "Failed fixture retained at #{folder}" unless completed
  end
  puts "PASS #{name}"
end
puts "#{cases.size} scenarios passed (7 original actual-process + 1 delayed-start fixture + 4 explicitly injected EPERM boundaries with actual processes); no Xcode build/install executed."
