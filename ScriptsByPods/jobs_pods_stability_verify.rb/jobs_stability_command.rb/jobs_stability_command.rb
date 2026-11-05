# Jobs 自建 Pods 验收命令的独立进程组与有界等待。
module JobsStabilityCommand
  module_function

  # 保留真实进程状态；权限失败不等于清理成功，最终wait同样有界。
  def run(command, chdir:, output:, timeout_seconds:, grace_seconds: 5)
    timeout = positive_seconds(timeout_seconds, 'timeout_seconds')
    grace = positive_seconds(grace_seconds, 'grace_seconds')
    started = monotonic_time
    deadline = started + timeout
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
  private_class_method :positive_seconds, :monotonic_time, :signal_process, :group_alive?, :signal_child, :child_status, :wait_for_child, :diagnostic
end
