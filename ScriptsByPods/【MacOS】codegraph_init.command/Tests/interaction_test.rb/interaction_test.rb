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

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'json'
require 'pty'
require 'timeout'

# 用途：回归 CodeGraph 初始化与导出入口的确认、取消、只读模式和父进程确认传递。
# 运行：在终端执行 ruby 本文件，由 Minitest 自动运行用例。
# 边界：临时工程和伪终端驱动真实确认分支，CLI 写入使用假命令，不操作真实索引或加入 App Target。
class JobsCodeGraphInteractionTest < Minitest::Test
  SCRIPT = File.expand_path('../../【MacOS】codegraph_init.command', __dir__)
  EXPORT_SCRIPT = File.expand_path('../../../【MacOS】codegraph_export_md.command/【MacOS】codegraph_export_md.command', __dir__)

  def setup
    @temporary = Dir.mktmpdir('jobs-codegraph-interaction-')
    @project = File.join(@temporary, '项目 空格')
    @trace = File.join(@temporary, 'trace')
    @library = File.join(@temporary, 'functions.zsh')
    FileUtils.mkdir_p(File.join(@project, '.codegraph'))
    File.write(File.join(@project, '.codegraph/codegraph.db'), 'fixture')
    File.write(@library, File.read(SCRIPT).sub(/\nmain "\$@"\s*\z/, "\n"))
    @environment = {
      'FIXTURE_LIBRARY' => @library, 'FIXTURE_PROJECT' => @project, 'FIXTURE_TRACE' => @trace,
      'CODEGRAPH_AUTO_INIT' => '1', 'JOBS_POD_INSTALL_HOOK' => '1',
      'JOBS_CODEGRAPH_INTRO_CONFIRMED' => '1', 'JOBS_POD_INSTALL_INTERACTION' => 'interactive',
      'JOBS_SKIP_CODEGRAPH' => '0', 'TMPDIR' => @temporary, 'NO_COLOR' => '1'
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary)
  end

  def test_old_automation_markers_cannot_authorize_unattended_writes
    output, status = shell('main --project-root "$FIXTURE_PROJECT"')
    assert status.success?, output
    assert_includes output, '没有可交互输入'
    refute File.exist?(@trace)
    assert_empty Dir.glob(File.join(@temporary, 'codegraph_init.*.log'))
  end

  def test_terminal_intro_still_waits_with_old_automation_markers
    output, status = shell('show_script_intro_and_wait; print -r -- confirmed', input: "\n")
    assert status.success?, output
    assert_includes output, '按回车继续'
    assert_includes output, 'confirmed'
  end

  def test_regular_operation_return_skips_and_nonempty_input_runs
    output, status = shell('codegraph_ask_to_run 安装测试 && print -r -- EXECUTED', input: "\n")
    refute status.success?, output
    refute_includes output, 'EXECUTED'
    output, status = shell('codegraph_ask_to_run 安装测试 && print -r -- EXECUTED', input: "go\n")
    assert status.success?, output
    assert_includes output, 'EXECUTED'
  end

  def test_check_only_mode_forbids_installation_even_with_allow_install
    output, status = shell('show_script_intro_and_wait; ALLOW_INSTALL=0; require_installation CodeGraph',
                           environment: { 'JOBS_POD_INSTALL_INTERACTION' => 'check-only' })
    refute status.success?, output
    assert_includes output, '禁止安装'
    refute File.exist?(@trace)
  end

  def test_explicit_skip_has_no_project_or_log_writes
    before = Dir.glob(File.join(@project, '**/*'), File::FNM_DOTMATCH)
    output, status = shell('main --project-root "$FIXTURE_PROJECT"',
                           environment: { 'JOBS_POD_INSTALL_INTERACTION' => 'skip' })
    assert status.success?, output
    assert_equal before, Dir.glob(File.join(@project, '**/*'), File::FNM_DOTMATCH)
    refute File.exist?(@trace)
  end

  def test_legacy_missing_state_requires_exact_yes_then_full_status_verification
    output, status = shell(index_fixture + 'run_codegraph_index', input: "go\nYES\n")
    assert status.success?, output
    assert_equal ['index'], File.readlines(@trace, chomp: true)
    assert_includes output, '地图更新通过'
  end

  def test_rebuild_return_and_lowercase_yes_both_preserve_old_index
    ["go\n\n", "go\nyes\n"].each do |input|
      output, status = shell(index_fixture + 'run_codegraph_index', input: input)
      refute status.success?, output
      assert_includes output, '已取消全量重建'
      refute File.exist?(@trace)
    end
  end

  def test_rebuild_does_not_accept_incomplete_or_stale_result
    output, status = shell(index_fixture + 'run_codegraph_index', input: "go\nYES\n",
                           environment: { 'MOCK_REBUILD_INCOMPLETE' => '1' })
    refute status.success?, output
    refute_includes output, '地图更新通过'
    assert_equal ['index'], File.readlines(@trace, chomp: true)
  end

  def test_declining_index_update_never_exports
    output, status = shell(index_fixture + 'run_codegraph_index; export_codegraph_markdown', input: "\n")
    assert status.success?, output
    assert_includes output, '已跳过地图更新和导出'
    refute File.exist?(@trace)
  end

  def test_export_old_automation_markers_do_not_bypass_missing_terminal
    output, error, status = Open3.capture3(@environment, '/bin/zsh', EXPORT_SCRIPT)
    assert status.success?, output + error
    assert_includes error, '已跳过 Markdown 导出'
  end

  def test_export_check_only_never_uses_internal_confirmation
    environment = @environment.merge('JOBS_POD_INSTALL_INTERACTION' => 'check-only')
    output, error, status = Open3.capture3(environment, '/bin/zsh', EXPORT_SCRIPT, '--confirmed-by-init', Process.pid.to_s)
    assert status.success?, output + error
    assert_includes output, '本次不执行'
  end

  def test_forged_parent_confirmation_is_rejected_before_export
    output, error, status = Open3.capture3(@environment, '/bin/zsh', EXPORT_SCRIPT, '--confirmed-by-init', '2147483647')
    refute status.success?, output + error
    assert_includes error, '无效导出参数'
  end

  def test_confirmed_export_handoff_keeps_direct_parent_identity
    exporter = File.join(@temporary, 'export-fixture.zsh')
    source = File.read(EXPORT_SCRIPT).split('# 确认后执行原有业务，保留原来的参数、交互和退出策略。', 2).first
    File.write(exporter, source + "\nshow_script_intro_and_wait \"$@\"\nprint -r -- export-approved >> \"$FIXTURE_TRACE\"\n")
    output, status = shell('run_export_with_heartbeat "$FIXTURE_EXPORTER"',
                           environment: { 'FIXTURE_EXPORTER' => exporter })
    assert status.success?, output
    assert_equal ['export-approved'], File.readlines(@trace, chomp: true)
    assert_includes File.read(File.join(@temporary, 'workflow.log')), '直接父进程'
  end

  private

  def index_fixture
    legacy = status_json('reindexRecommended' => true, 'builtWithVersion' => '1.0.1', 'pendingRefs' => 0)
    complete = status_json('state' => 'complete', 'reindexRecommended' => false, 'pendingRefs' => 0)
    <<~ZSH
      CODEGRAPH_STATUS_JSON='#{legacy}'
      codegraph_require_target_schema() { return 0; }
      codegraph_read_status() { return 0; }
      codegraph_run_logged() {
        print -r -- "$2" >> "$FIXTURE_TRACE"
        [[ "${MOCK_REBUILD_INCOMPLETE:-0}" == 1 ]] || CODEGRAPH_STATUS_JSON='#{complete}'
      }
    ZSH
  end

  def status_json(index)
    JSON.generate('initialized' => true, 'projectPath' => @project, 'indexPath' => File.join(@project, '.codegraph'),
                  'lastIndexed' => '2026-10-24T00:00:00.000Z', 'index' => index,
                  'pendingChanges' => { 'added' => 0, 'modified' => 0, 'removed' => 0 })
  end

  def shell(body, input: nil, environment: {})
    setup = <<~'ZSH'
      source "$FIXTURE_LIBRARY"
      CODEGRAPH_LOG_FILE="$TMPDIR/workflow.log"
      PROJECT_ROOT="$FIXTURE_PROJECT"
      CODEGRAPH_TARGET_DIRECTORY="$PROJECT_ROOT"
      CODEGRAPH_BIN=fixture-codegraph
    ZSH
    env = @environment.merge(environment)
    if input.nil?
      output, error, status = Open3.capture3(env, '/bin/zsh', '-f', '-c', setup + body)
      return [output + error, status]
    end
    output = +''
    child = nil
    status = nil
    Timeout.timeout(15) do
      PTY.spawn(env, '/bin/zsh', '-f', '-c', setup + body) do |reader, writer, pid|
        child = pid
        writer.write(input)
        begin
          output << reader.read
        rescue Errno::EIO
          # PTY 在子进程退出时用 EIO 表示输入结束。
        end
        _, status = Process.wait2(pid)
        child = nil
      end
    end
    [output, status]
  ensure
    Process.kill('TERM', child) if child
  end
end
