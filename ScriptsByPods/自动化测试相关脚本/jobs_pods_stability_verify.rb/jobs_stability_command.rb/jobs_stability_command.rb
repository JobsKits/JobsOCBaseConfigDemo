# Jobs 自建 Pods 验收命令的独立进程组与有界等待。
require 'json'
require 'tempfile'
require 'time'

module JobsStabilityCommand
  module_function

  # 保留真实进程状态；权限失败不等于清理成功，最终wait同样有界。
  def run(command, chdir:, output:, timeout_seconds:, grace_seconds: 5, progress_interval: nil)
    timeout = positive_seconds(timeout_seconds, 'timeout_seconds')
    grace = positive_seconds(grace_seconds, 'grace_seconds')
    started = monotonic_time
    deadline = started + timeout
    interval = positive_seconds(progress_interval, 'progress_interval') unless progress_interval.nil?
    next_progress = started + interval if interval
    pid = nil
    status = nil
    completed = false
    timed_out = false
    kill_sent = false
    diagnostics = []
    begin
      pid = Process.spawn(*command, chdir: chdir, out: output, err: output, pgroup: true)
      until status
        status = child_status(pid, diagnostics)
        break if status
        sample_time = monotonic_time
        if interval && sample_time < deadline && sample_time >= next_progress
          write_progress(pid, started, chdir, output)
          next_progress = monotonic_time + interval
          status = child_status(pid, diagnostics)
          break if status
        end
        remaining = deadline - monotonic_time
        if remaining <= 0
          timed_out = true
          output.puts("Command timed out after #{timeout}s; TERM process group #{pid}.")
          output.flush
          term = signal_process('TERM', -pid, diagnostics)
          # 未领取的直接child PID不会被复用；不得向已reap的PID补发信号。
          status = child_status(pid, diagnostics)
          status, = signal_child('TERM', pid, diagnostics) if term != :sent && !status
          grace_deadline = monotonic_time + grace
          loop do
            status ||= child_status(pid, diagnostics)
            break unless group_alive?(pid, diagnostics)
            remaining_grace = grace_deadline - monotonic_time
            break if remaining_grace <= 0
            sleep([0.05, remaining_grace].min)
          end
          # 组长可能先退出；仍仅向原组发KILL，不能宣称不可访问的后代已清理。
          if group_alive?(pid, diagnostics)
            kill_sent = signal_process('KILL', -pid, diagnostics) == :sent
            output.puts(kill_sent ? "TERM grace expired; KILL process group #{pid}." : "Could not KILL process group #{pid}; see termination diagnostics.")
          end
          status ||= child_status(pid, diagnostics)
          if !kill_sent && !status
            status, child_signal = signal_child('KILL', pid, diagnostics)
            kill_sent = child_signal == :sent
          end
          status ||= wait_for_child(pid, grace, diagnostics)
          break
        end
        sleep([0.05, remaining].min)
      end
      diagnostics.each { |item| output.puts("Termination diagnostic: #{item.inspect}") }
      output.puts('Direct child status was not collected; it may still be running.') unless status
      output.flush
      result = {
        pid: pid,
        status: status,
        status_collected: !status.nil?,
        termination_diagnostics: diagnostics,
        timed_out: timed_out,
        timeout_seconds: timeout,
        grace_seconds: grace,
        kill_sent: kill_sent,
        seconds: monotonic_time - started
      }
      completed = true
      result
    ensure
      if pid && !completed
        # 回收失败不能遮盖原异常；仅清理本次spawn组或尚未reap的child。
        begin
          sent = signal_process('KILL', -pid, diagnostics)
          status ||= child_status(pid, diagnostics)
          status, = signal_child('KILL', pid, diagnostics) if sent != :sent && !status
          status ||= wait_for_child(pid, grace, diagnostics)
          diagnostics.each { |item| output.puts("Cleanup diagnostic: #{item.inspect}") }
          output.flush
        rescue StandardError
          # 原命令/输出异常保持原样，ensure绝不覆盖它。
        end
      end
    end
  end

  # 只记录本次同UID子树/独立组；采样自身复用无心跳的短命令预算。
  def progress_processes(pid, chdir)
    Tempfile.create('jobs-stability-progress-') do |file|
      command = ['/bin/ps', '-axo', 'pid=,ppid=,pgid=,uid=,stat=,%cpu=,time=,rss=,comm=']
      result = run(command, chdir: chdir, output: file, timeout_seconds: 2, grace_seconds: 0.1)
      raise 'ps sample failed or timed out' unless result[:status]&.success? && !result[:timed_out]
      raise 'ps sample exceeds 1 MiB' if file.size > 1_048_576
      file.rewind
      text = file.read(1_048_577)
      raise 'ps sample exceeds 1 MiB' if text.bytesize > 1_048_576
      rows = text.force_encoding(Encoding::UTF_8).scrub.each_line.map do |line|
        fields = line.strip.split(/\s+/, 9)
        next unless fields.size == 9 && fields.first(4).all? { |value| value.match?(/\A\d+\z/) }
        row = { pid: fields[0].to_i, ppid: fields[1].to_i, pgid: fields[2].to_i, uid: fields[3].to_i,
                state: fields[4], cpu_percent: fields[5], cpu_time: fields[6], rss_kib: fields[7], comm: fields[8][0, 256] }
        row if row[:uid] == Process.uid
      end.compact
      owned = [pid]
      loop do
        children = rows.select { |row| owned.include?(row[:ppid]) }.map { |row| row[:pid] }
        expanded = (owned + children).uniq
        break if expanded == owned
        owned = expanded
      end
      selected = rows.select { |row| owned.include?(row[:pid]) || row[:pgid] == pid }.sort_by { |row| row[:pid] }
      { processes: selected.first(64), omitted_processes: [selected.size - 64, 0].max }
    end
  end

  def write_progress(pid, started, chdir, output)
    snapshot = progress_processes(pid, chdir)
    payload = { timestamp: Time.now.utc.iso8601(6), root_pid: pid, elapsed_seconds: (monotonic_time - started).round(3) }.merge(snapshot)
    output.puts("Progress snapshot: #{JSON.generate(payload)}")
    output.flush
  rescue StandardError => error
    begin
      output.puts("Progress diagnostic: #{error.class}: #{error.message.to_s[0, 512]}")
      output.flush
    rescue StandardError
      # 诊断输出失败不能替换主命令的真实结果。
    end
  end

  # 拒绝无界或非法等待，不在参数失效时启动真实命令。
  def positive_seconds(value, name)
    seconds = Float(value)
    raise ArgumentError, "#{name} must be finite and positive" unless seconds.finite? && seconds.positive?
    seconds
  end

  def monotonic_time
    Process.clock_gettime(Process::CLOCK_MONOTONIC)
  end

  # 负PID只指向spawn创建的独立组；EPERM诚实记录，不作为已消失。
  def signal_process(signal, target, diagnostics)
    Process.kill(signal, target)
    :sent
  rescue Errno::ESRCH
    :gone
  rescue Errno::EPERM => error
    diagnostic(diagnostics, 'signal', signal, target, error)
    :denied
  end

  def group_alive?(pid, diagnostics)
    Process.kill(0, -pid)
    true
  rescue Errno::ESRCH
    false
  rescue Errno::EPERM => error
    diagnostic(diagnostics, 'probe', 0, -pid, error)
    true
  end

  # 每次直接child fallback前重新WNOHANG确认未reap；ECHILD时不向可能复用的PID发信号。
  def signal_child(signal, pid, diagnostics)
    waited = Process.wait2(pid, Process::WNOHANG)
    return [waited.last, :finished] if waited
    [nil, signal_process(signal, pid, diagnostics)]
  rescue Errno::ECHILD => error
    diagnostic(diagnostics, 'wait', nil, pid, error)
    [nil, :not_child]
  end

  # 所有状态都通过实际wait2取得，永不伪造exit0或signal。
  def child_status(pid, diagnostics)
    waited = Process.wait2(pid, Process::WNOHANG)
    waited && waited.last
  rescue Errno::ECHILD => error
    diagnostic(diagnostics, 'wait', nil, pid, error)
    nil
  end

  def wait_for_child(pid, seconds, diagnostics)
    deadline = monotonic_time + seconds
    loop do
      status = child_status(pid, diagnostics)
      return status if status
      remaining = deadline - monotonic_time
      return nil if remaining <= 0
      sleep([0.05, remaining].min)
    end
  end

  def diagnostic(items, operation, signal, target, error)
    item = { operation: operation, signal: signal, target: target, error: error.class.name, message: error.message }
    items << item unless items.include?(item)
  end
  private_class_method :positive_seconds, :monotonic_time, :signal_process, :group_alive?, :signal_child, :child_status, :wait_for_child, :diagnostic, :progress_processes, :write_progress
end
