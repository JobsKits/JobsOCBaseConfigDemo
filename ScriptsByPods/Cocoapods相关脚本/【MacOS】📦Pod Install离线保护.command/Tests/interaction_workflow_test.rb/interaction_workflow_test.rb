# frozen_string_literal: true

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
require 'minitest/autorun'
require 'open3'
require 'pty'
require 'timeout'
require 'tmpdir'

# 用途：验证 Pod Install 离线保护的子任务顺序、确认与跳过分支，以及 Ruby 挂载器等待和输入传递。
# 运行：在终端执行 ruby 本文件，由 Minitest 自动运行用例。
# 边界：伪终端和假子脚本仅操作临时工程，不调用真实安装器或工程工具，不加入 App Target。
class PodInstallInteractionWorkflowTest < Minitest::Test
  SCRIPT_NAME = '【MacOS】📦Pod Install离线保护.command'
  SCRIPT = File.expand_path("../../#{SCRIPT_NAME}", __dir__)
  CHILDREN = {
    'dependency' => '【MacOS】🔍查询Xcode工程依赖关系.command',
    'pif' => '【MacOS】🧹恢复Xcode PIF构建会话.command',
    'codegraph' => '【MacOS】codegraph_init.command'
  }.freeze

  def setup
    @temporary = Dir.mktmpdir('jobs-pod-interaction-')
    @project = File.join(@temporary, '工程 空格 (交互)')
    @trace = File.join(@temporary, 'children.log')
    FileUtils.mkdir_p(@project)
    File.write(File.join(@project, 'Podfile'), "# 隔离测试工程\n")
    CHILDREN.each do |label, script_name|
      category = label == 'dependency' ? 'Cocoapods相关脚本' : '自动化测试相关脚本'
      path = File.join(@project, 'ScriptsByPods', category, script_name, script_name)
      FileUtils.mkdir_p(File.dirname(path))
      File.write(path, child_source(label))
    end
    @environment = {
      'FIXTURE_TRACE' => @trace,
      'FIXTURE_FAIL' => '',
      'TMPDIR' => @temporary,
      'NO_COLOR' => '1',
      'JOBS_POD_INSTALL_INTERACTION' => 'interactive',
      'JOBS_POD_INSTALL_HOOK' => '1',
      'JOBS_SKIP_README' => '1',
      'CODEGRAPH_AUTO_INIT' => '1',
      'JOBS_POD_INSTALL_OFFLINE' => '0',
      'JOBS_SKIP_CODEGRAPH' => '0',
      'JOBS_POD_INSTALL_PURE' => '0',
      'JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS' => '0',
      'JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY' => '0'
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary) if @temporary && File.directory?(@temporary)
  end

  def test_terminal_preserves_child_input_and_task_order
    result = terminal
    assert result[:status].success?, result[:output]
    assert_equal %w[dependency pif codegraph], written_events.map { |event| event.split(':').first }
    CHILDREN.each_key do |label|
      assert_includes written_events, "#{label}:#{label}-answer:interactive:0", result[:output]
    end
  end

  def test_hook_and_auto_flags_do_not_bypass_terminal_confirmation
    result = terminal(cancel: true)
    assert_empty written_events, result[:output]
  end

  def test_piped_input_cannot_authorize_interactive_tasks
    output, error, status = capture({}, "\nYES\nanything\n")
    assert status.success?, output + error
    assert_empty written_events, output + error
    assert_match(/TTY|终端|交互/, output + error)
  end

  def test_explicit_skip_runs_no_child
    output, error, status = capture('JOBS_POD_INSTALL_INTERACTION' => 'skip')
    assert status.success?, output + error
    assert_empty events, output + error
    assert_match(/skip|跳过/, output + error)
  end

  def test_check_only_has_no_child_writes_without_a_terminal
    output, error, status = capture('JOBS_POD_INSTALL_INTERACTION' => 'check-only')
    assert status.success?, output + error
    assert_empty written_events, output + error
    assert_match(/check.only|只读|检查/, output + error)
  end

  def test_command_line_check_only_overrides_interactive_mode
    output, error, status = capture({}, '', '--check-only')
    assert status.success?, output + error
    assert_empty written_events, output + error
  end

  def test_pure_mode_skips_both_phases_even_when_check_only_was_requested
    %w[JOBS_POD_INSTALL_PURE JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS].each do |key|
      output, error, status = capture(key => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'check-only')
      assert status.success?, output + error
      assert_empty events, output + error
    end
  end

  def test_preflight_runs_only_the_dependency_report
    result = terminal({}, arguments: ['--preflight'])
    assert result[:status].success?, result[:output]
    assert_equal ['dependency'], written_events.map { |event| event.split(':').first }
  end

  def test_post_integrate_runs_only_recovery_and_codegraph
    result = terminal({}, arguments: ['--post-integrate'])
    assert result[:status].success?, result[:output]
    assert_equal %w[pif codegraph], written_events.map { |event| event.split(':').first }
  end

  def test_explicit_offline_is_propagated_without_disabling_terminal_input
    result = terminal({ 'JOBS_POD_INSTALL_OFFLINE' => '1' })
    assert result[:status].success?, result[:output]
    assert_includes written_events, 'dependency:dependency-answer:interactive:1'
  end

  def test_failed_child_is_reported_and_remaining_children_still_run
    result = terminal({ 'FIXTURE_FAIL' => 'pif' })
    refute result[:status].success?, result[:output]
    assert_equal %w[dependency pif codegraph], written_events.map { |event| event.split(':').first }
    assert_match(/pif|PIF/, result[:output])
    assert_match(/警告|失败/, result[:output])
  end

  private

  # 假子脚本只写临时轨迹；需要真的读到 PTY 输入才算写任务执行成功。
  def child_source(label)
    <<~ZSH
      #!/bin/zsh
      for argument in "$@"; do
        if [[ "$argument" == '--check-only' ]]; then
          print -r -- '#{label}:check' >> "$FIXTURE_TRACE"
          exit 0
        fi
      done
      if [[ "${JOBS_POD_INSTALL_INTERACTION:-interactive}" == 'check-only' ]]; then
        print -r -- '#{label}:check' >> "$FIXTURE_TRACE"
        exit 0
      fi
      print -r -- 'fixture-confirm:#{label}'
      answer=''
      IFS= read -r answer || exit 61
      print -r -- "#{label}:${answer}:${JOBS_POD_INSTALL_INTERACTION:-interactive}:${JOBS_POD_INSTALL_OFFLINE:-0}" >> "$FIXTURE_TRACE"
      [[ "${FIXTURE_FAIL:-}" == '#{label}' ]] && exit 37
      exit 0
    ZSH
  end

  # 非 TTY 分支通过普通管道执行，确认输入内容不会被当成终端授权。
  def capture(extra = {}, input = '', *arguments)
    Open3.capture3(@environment.merge(extra), '/bin/zsh', SCRIPT,
                   '--project-root', @project, *arguments, stdin_data: input)
  end

  # 顺序驱动 PTY 提示，保证每个子任务均继承可交互标准输入。
  def terminal(extra = {}, cancel: false, arguments: [])
    output = +''
    delivered = {}
    process_status = nil
    PTY.spawn(@environment.merge(extra), '/bin/zsh', SCRIPT, '--project-root', @project, *arguments) do |reader, writer, pid|
      writer.write(cancel ? "\u0004" : "\n")
      begin
        Timeout.timeout(12) do
          loop do
            chunk = reader.readpartial(4096)
            output << chunk
            CHILDREN.each_key do |label|
              next if cancel || delivered[label] || !output.include?("fixture-confirm:#{label}")

              writer.write("#{label}-answer\n")
              delivered[label] = true
            end
          end
        end
      rescue EOFError, Errno::EIO
        # macOS 与 Linux 的 PTY 退出分别以 EOF / EIO 表达。
      rescue Timeout::Error
        Process.kill('TERM', pid) rescue nil
        flunk "挂载流程未在时限内结束：#{output.force_encoding(Encoding::UTF_8)}"
      ensure
        _, process_status = Process.wait2(pid) rescue [nil, $?]
      end
    end
    { output: output.force_encoding(Encoding::UTF_8), status: process_status }
  end

  def events
    File.file?(@trace) ? File.readlines(@trace, chomp: true) : []
  end

  def written_events
    events.reject { |event| event.end_with?(':check') }
  end
end

# 实际加载 Ruby 挂载器，检查父进程等待与标准输入传递。
class PodInstallGuardInteractionTest < Minitest::Test
  GUARD = File.expand_path('../../jobs_pod_install_offline_guard.rb/jobs_pod_install_offline_guard.rb', __dir__)
  SCRIPT_NAME = '【MacOS】📦Pod Install离线保护.command'
  RUBY_ENTRY = <<~RUBY.freeze
    require ENV.fetch('FIXTURE_GUARD')
    $PROGRAM_NAME = 'pod'
    ARGV.replace(['install'])
    JobsPodInstallOfflineGuard.guard!(ENV.fetch('FIXTURE_PROJECT'))
    puts 'fixture-parent-finished'
  RUBY

  def setup
    @temporary = Dir.mktmpdir('jobs-pod-guard-')
    @trace = File.join(@temporary, 'guard.log')
    directory = File.join(@temporary, 'ScriptsByPods', 'Cocoapods相关脚本', SCRIPT_NAME)
    FileUtils.mkdir_p(directory)
    File.write(File.join(directory, SCRIPT_NAME), <<~ZSH)
      #!/bin/zsh
      for argument in "$@"; do
        if [[ "$argument" == '--check-only' ]]; then
          print -r -- 'guard-check' >> "$FIXTURE_TRACE"
          exit 0
        fi
      done
      print -r -- 'guard-start' >> "$FIXTURE_TRACE"
      print -r -- 'fixture-guard-confirm'
      answer=''
      IFS= read -r answer || exit 61
      print -r -- "guard-finish:${answer}" >> "$FIXTURE_TRACE"
    ZSH
    @environment = {
      'FIXTURE_GUARD' => GUARD,
      'FIXTURE_PROJECT' => @temporary,
      'FIXTURE_TRACE' => @trace,
      'JOBS_POD_INSTALL_INTERACTION' => 'interactive',
      'JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY' => '0',
      'JOBS_POD_INSTALL_HOOK' => '1',
      'JOBS_SKIP_README' => '1',
      'JOBS_POD_INSTALL_PURE' => '0',
      'JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS' => '0'
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary) if @temporary && File.directory?(@temporary)
  end

  def test_guard_waits_and_preserves_terminal_input
    result = guard_terminal
    assert result[:status].success?, result[:output]
    assert_equal ['guard-start', 'guard-finish:guard-answer'], events
    assert_includes result[:output], 'fixture-parent-finished'
  end

  def test_guard_eof_does_not_authorize_child_writes
    result = guard_terminal(eof: true)
    assert_equal ['guard-start'], events, result[:output]
    assert_match(/失败/, result[:output])
  end

  def test_guard_has_no_writes_without_tty_even_with_piped_yes
    output, error, status = capture({}, "YES\n")
    assert status.success?, output + error
    assert_empty events, output + error
  end

  def test_guard_pure_and_skip_modes_do_not_start_a_child
    [
      { 'JOBS_POD_INSTALL_PURE' => '1' },
      { 'JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS' => '1' },
      { 'JOBS_POD_INSTALL_INTERACTION' => 'skip' },
      { 'JOBS_POD_INSTALL_INTERACTION' => 'skip', 'JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY' => '1' }
    ].each do |extra|
      output, error, status = capture(extra)
      assert status.success?, output + error
      assert_empty events, output + error
    end
  end

  def test_guard_explicit_check_only_propagates_to_child_without_tty
    output, error, status = capture('JOBS_POD_INSTALL_INTERACTION' => 'check-only')
    assert status.success?, output + error
    assert_equal ['guard-check'], events
  end

  def test_guard_legacy_check_only_propagates_to_child_without_tty
    output, error, status = capture('JOBS_POD_INSTALL_POST_SCRIPTS_CHECK_ONLY' => '1')
    assert status.success?, output + error
    assert_equal ['guard-check'], events
  end

  private

  def capture(extra = {}, input = '')
    Open3.capture3(@environment.merge(extra), RbConfig.ruby, '-e', RUBY_ENTRY, stdin_data: input)
  end

  # 等待子脚本提示后确认 Ruby 父进程尚未结束，再发送输入。
  def guard_terminal(eof: false)
    output = +''
    delivered = false
    process_status = nil
    PTY.spawn(@environment, RbConfig.ruby, '-e', RUBY_ENTRY) do |reader, writer, pid|
      begin
        Timeout.timeout(8) do
          loop do
            output << reader.readpartial(4096)
            next if delivered || !output.include?('fixture-guard-confirm')

            assert_nil Process.waitpid(pid, Process::WNOHANG), 'Ruby 挂载器没有等待子脚本'
            writer.write(eof ? "\u0004" : "guard-answer\n")
            delivered = true
          end
        end
      rescue EOFError, Errno::EIO
        # 只在临时进程中运行假调度器。
      rescue Timeout::Error
        Process.kill('TERM', pid) rescue nil
        flunk "Ruby 挂载器未在时限内结束：#{output.force_encoding(Encoding::UTF_8)}"
      ensure
        _, process_status = Process.wait2(pid) rescue [nil, $?]
      end
    end
    { output: output.force_encoding(Encoding::UTF_8), status: process_status }
  end

  def events
    File.file?(@trace) ? File.readlines(@trace, chomp: true) : []
  end
end
