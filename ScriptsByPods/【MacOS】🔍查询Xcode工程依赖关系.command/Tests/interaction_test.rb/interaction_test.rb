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
require 'pty'
require 'timeout'

# 用途：验证工程依赖报告与 PIF 恢复入口的确认／取消、工具选路、输出目录及路径保护。
# 运行：终端用 ruby 执行本文件，Minitest 驱动真实脚本函数和伪终端；不加入主 App 或 XCTest Target。
# 边界：依赖命令和进程探测均用临时替身，不安装工具、不触碰真实 PIF 进程。
class JobsPodReportInteractionTest < Minitest::Test
  REPORT = File.expand_path('../../【MacOS】🔍查询Xcode工程依赖关系.command', __dir__)
  PIF = File.expand_path('../../../【MacOS】🧹恢复Xcode PIF构建会话.command/【MacOS】🧹恢复Xcode PIF构建会话.command', __dir__)

  def setup
    @temporary = Dir.mktmpdir('jobs-pod-report-test-')
    @project = File.join(@temporary, '工程 空格 (测试)')
    @trace = File.join(@temporary, 'trace')
    @bin = File.join(@temporary, 'bin')
    FileUtils.mkdir_p([@project, @bin, File.join(@temporary, 'brew')])
    File.write(File.join(@project, 'Podfile'), '# fixture')
    @libraries = {}
    { report: REPORT, pif: PIF }.each do |kind, path|
      library = File.join(@temporary, "#{kind}.zsh")
      File.write(library, File.read(path).sub(/\nmain "\$@"\s*\z/, "\n"))
      @libraries[kind] = library
    end
    write_tool('brew', <<~'ZSH')
      [[ -f "$HOME/brew-ready" ]] || exit 1
      print -r -- "brew:$*" >> "$FIXTURE_TRACE"
      case "$1" in
        --version|-v) print -r -- 'Homebrew fixture' ;;
        --prefix) print -r -- "$HOME/brew" ;;
        shellenv) print -r -- 'export FIXTURE_SHELLENV=activated' ;;
        config) exit 0 ;;
        list) [[ -f "$HOME/graphviz-ready" ]] ;;
        install|upgrade)
          [[ "${MOCK_GRAPHVIZ_FAIL:-0}" != 1 ]] || exit 23
          /usr/bin/touch "$HOME/graphviz-ready"
          ;;
        update|cleanup|doctor) exit 0 ;;
        *) exit 72 ;;
      esac
    ZSH
    write_tool('dot', <<~'ZSH')
      print -r -- "dot:$*" >> "$FIXTURE_TRACE"
      [[ -f "$HOME/graphviz-ready" ]] || exit 1
      [[ "${MOCK_DOT_FAIL:-0}" != 1 ]] || exit 24
      if [[ "$1" != -V ]]; then
        print -r -- 'fixture png' > "${@: -1}"
      fi
    ZSH
    @environment = {
      'HOME' => @temporary, 'TMPDIR' => @temporary, 'FIXTURE_PROJECT' => @project,
      'FIXTURE_TRACE' => @trace, 'FIXTURE_BIN' => @bin, 'JOBS_PROJECT_ROOT' => @project,
      'PATH' => "#{@bin}:/usr/bin:/bin:/usr/sbin:/sbin", 'NO_COLOR' => '1',
      'JOBS_POD_INSTALL_HOOK' => '1', 'JOBS_SKIP_README' => '1',
      'JOBS_POD_INSTALL_INTERACTION' => 'interactive', 'JOBS_POD_INSTALL_OFFLINE' => '0'
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary)
  end

  def test_optional_tool_failure_still_generates_reports_but_returns_failure
    output, status = shell(:report, <<~'ZSH')
      SELECTED_TARGET_DIR="$FIXTURE_PROJECT"
      ensure_graphviz() { return 23; }
      prepare_report_dir() { print -r -- "$1/PodspecDependencyReport"; }
      write_generator_script() { print -r -- GENERATOR_READY; }
      run_generator() { print -r -- REPORT_GENERATED; }
      generate_graphviz_png() { return 0; }
      open_outputs() { return 0; }
      generate_dependency_reports
    ZSH
    assert_equal 23, status.exitstatus, output
    assert_includes output, 'REPORT_GENERATED'
  end

  def test_report_hook_without_terminal_does_not_write
    output, status = shell(:report, 'main')
    assert status.success?, output
    assert_includes output, '无可交互终端'
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
    refute File.exist?(@trace)
  end

  def test_report_hook_still_requires_return_and_cancel_has_no_log
    output, status = shell(:report, 'show_script_intro_and_wait; print -r -- CONTINUED', input: "cancel\n")
    assert status.success?, output
    assert_includes output, '准备好后按 Enter'
    refute_includes output, 'CONTINUED'
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
  end

  def test_report_eof_cancels_before_writing
    output, status = shell(:report, 'show_script_intro_and_wait; print -r -- CONTINUED', input: "\u0004")
    assert status.success?, output
    refute_includes output, 'CONTINUED'
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
  end

  def test_report_readonly_finds_project_without_writing
    output, status = shell(:report, 'main', environment: { 'JOBS_POD_INSTALL_INTERACTION' => 'check-only' })
    assert status.success?, output
    assert_includes output, @project
    assert_equal ['Podfile'], Dir.children(@project)
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
  end

  def test_report_directory_symlink_is_rejected
    elsewhere = File.join(@temporary, 'elsewhere')
    FileUtils.mkdir_p(elsewhere)
    File.symlink(elsewhere, File.join(@project, 'PodspecDependencyReport'))
    output, status = shell(:report, 'prepare_report_dir "$FIXTURE_PROJECT"')
    refute status.success?, output
    assert_empty Dir.children(elsewhere)
  end

  def test_report_output_symlink_is_rejected_and_other_files_are_preserved
    directory = File.join(@project, 'PodspecDependencyReport')
    FileUtils.mkdir_p(directory)
    File.write(File.join(directory, 'user-note.txt'), 'preserve')
    outside = File.join(@temporary, 'outside')
    File.write(outside, 'original')
    File.symlink(outside, File.join(directory, 'PodspecDependencies.md'))
    output, status = shell(:report, 'prepare_report_dir "$FIXTURE_PROJECT"')
    refute status.success?, output
    assert_equal 'original', File.read(outside)
    assert_equal 'preserve', File.read(File.join(directory, 'user-note.txt'))
  end

  def test_report_existing_directory_preserves_unrelated_files
    directory = File.join(@project, 'PodspecDependencyReport')
    FileUtils.mkdir_p(directory)
    File.write(File.join(directory, 'user-note.txt'), 'preserve')
    output, status = shell(:report, 'prepare_report_dir "$FIXTURE_PROJECT"')
    assert status.success?, output
    assert_equal 'preserve', File.read(File.join(directory, 'user-note.txt'))
  end

  def test_invalid_report_root_does_not_create_output
    output, status = shell(:report, 'prepare_report_dir "$HOME/not-a-project"')
    refute status.success?, output
    refute File.exist?(File.join(@temporary, 'not-a-project'))
  end

  def test_brew_current_process_activation_never_changes_profile
    File.write(File.join(@temporary, 'brew-ready'), '')
    profile = File.join(@temporary, '.zprofile')
    File.write(profile, 'preserve')
    output, status = shell(:report, brew_fixture + 'install_homebrew; print -r -- "activated=$FIXTURE_SHELLENV"', input: "\n")
    assert status.success?, output
    assert_includes output, 'activated=activated'
    assert_equal 'preserve', File.read(profile)
    refute events.any? { |entry| entry.match?(/brew:(update|upgrade|cleanup)/) }
  end

  def test_brew_missing_return_skips_install
    output, status = shell(:report, brew_fixture + 'install_homebrew', input: "\n")
    refute status.success?, output
    refute events.any? { |entry| entry.start_with?('install:') }
    refute File.exist?(File.join(@temporary, '.zprofile'))
  end

  def test_brew_missing_nonempty_then_yes_selects_system
    output, status = shell(:report, brew_fixture + 'install_homebrew', input: "go\nYES\n")
    assert status.success?, output
    assert_includes events, 'install:system'
    refute_includes events, 'install:user'
  end

  def test_brew_other_path_input_selects_user_without_sudo
    output, status = shell(:report, brew_fixture + 'install_homebrew', input: "go\n\n")
    assert status.success?, output
    assert_includes events, 'install:user'
    refute_includes events, 'install:system'
  end

  def test_brew_install_failure_does_not_switch_path
    output, status = shell(:report, brew_fixture + 'install_homebrew', input: "go\nYES\n",
                           environment: { 'MOCK_BREW_INSTALL_FAIL' => '1' })
    refute status.success?, output
    assert_includes events, 'install:system'
    refute_includes events, 'install:user'
  end

  def test_brew_eof_at_operation_or_path_choice_cancels_installation
    ["\u0004", "go\n\u0004"].each do |input|
      output, status = shell(:report, brew_fixture + 'install_homebrew; print -r -- CONTINUED', input: input)
      assert status.success?, output
      refute_includes output, 'CONTINUED'
      refute events.any? { |entry| entry.start_with?('install:') }
    end
  end

  def test_brew_update_requires_nonempty_input
    File.write(File.join(@temporary, 'brew-ready'), '')
    output, status = shell(:report, brew_fixture + 'install_homebrew', input: "go\n")
    assert status.success?, output
    %w[update upgrade cleanup doctor].each { |action| assert_includes events, "brew:#{action}" }
  end

  def test_graphviz_return_skips_install_and_nonempty_runs
    File.write(File.join(@temporary, 'brew-ready'), '')
    output, status = shell(:report, brew_fixture + 'ensure_graphviz', input: "\n\n")
    assert status.success?, output
    refute_includes events, 'brew:install graphviz'
    output, status = shell(:report, brew_fixture + 'ensure_graphviz', input: "\nx\n")
    assert status.success?, output
    assert_includes events, 'brew:install graphviz'
  end

  def test_graphviz_upgrade_failure_is_reported
    %w[brew-ready graphviz-ready].each { |name| File.write(File.join(@temporary, name), '') }
    output, status = shell(:report, brew_fixture + 'ensure_graphviz', input: "\ngo\n",
                           environment: { 'MOCK_GRAPHVIZ_FAIL' => '1' })
    refute status.success?, output
    assert_includes output, 'Graphviz upgrade 失败'
  end

  def test_graphviz_eof_cancels_before_installation
    File.write(File.join(@temporary, 'brew-ready'), '')
    output, status = shell(:report, brew_fixture + 'ensure_graphviz; print -r -- CONTINUED', input: "\n\u0004")
    assert status.success?, output
    refute_includes output, 'CONTINUED'
    refute_includes events, 'brew:install graphviz'
  end

  def test_png_failure_propagates_and_never_claims_success
    File.write(File.join(@temporary, 'graphviz-ready'), '')
    output, status = shell(:report, 'generate_graphviz_png "$FIXTURE_PROJECT"', environment: { 'MOCK_DOT_FAIL' => '1' })
    refute status.success?, output
    assert_includes output, 'PNG 生成失败'
    refute_includes output, '已生成 Graphviz PNG'
  end

  def test_ruby_generator_failure_propagates
    generator = File.join(@temporary, 'generator.rb')
    File.write(generator, 'exit 17')
    output, status = shell(:report, 'run_generator "$HOME/generator.rb" "$FIXTURE_PROJECT" "$FIXTURE_PROJECT"')
    assert_equal 17, status.exitstatus, output
    refute File.exist?(generator)
  end

  def test_pif_hook_without_terminal_never_mutates
    output, status = shell(:pif, 'main --project-root "$FIXTURE_PROJECT"')
    assert status.success?, output
    assert_includes output, '无可交互终端'
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
  end

  def test_pif_hook_return_lowercase_and_eof_all_cancel
    ["\n", "yes\n", "\u0004"].each do |input|
      output, status = shell(:pif, 'show_script_intro_and_wait; print -r -- CONTINUED', input: input)
      assert status.success?, output
      refute_includes output, 'CONTINUED'
      assert_empty Dir.glob(File.join(@temporary, '*.log'))
    end
  end

  def test_pif_exact_yes_reaches_approved_mock_actions
    output, status = shell(:pif, pif_fixture + 'main --project-root "$FIXTURE_PROJECT" --skip-verify', input: "YES\n")
    assert status.success?, output
    assert_includes events, 'kill:-TERM 900'
  end

  def test_pif_check_only_uses_memory_snapshot_and_never_writes
    output, status = shell(:pif, pif_fixture + 'main --project-root "$FIXTURE_PROJECT" --check-only')
    assert status.success?, output
    assert_includes output, '未创建日志、进程快照文件或恢复锁'
    assert_empty Dir.glob(File.join(@temporary, '*.log'))
    assert_empty Dir.glob(File.join(@temporary, '*.processes'))
    refute events.any? { |entry| entry.start_with?('kill:') }
  end

  def test_pif_active_build_signal_preserves_all_services
    fixture = pif_fixture + <<~'ZSH'
      function /bin/ps() {
        print -r -- '900 1 501 SWBBuildService'
        print -r -- '901 1 501 xcodebuild'
      }
    ZSH
    output, status = shell(:pif, fixture + 'main --project-root "$FIXTURE_PROJECT" --skip-verify', input: "YES\n")
    assert status.success?, output
    assert_includes output, '跳过构建服务回收'
    refute events.any? { |entry| entry.start_with?('kill:') }
  end

  def test_brew_network_preflight_failure_stops_update_and_reports_existing_graphviz_separately
    %w[brew-ready graphviz-ready].each { |name| File.write(File.join(@temporary, name), '') }
    fixture = brew_fixture + <<~'ZSH'
      jobs_brew_prepare_network() { print -r -- network:prepare >> "$FIXTURE_TRACE"; return 19; }
    ZSH
    output, status = shell(:report, fixture + 'ensure_graphviz', input: "go\n")
    assert_equal 19, status.exitstatus, output
    assert_equal 1, events.count('network:prepare')
    refute events.any? { |entry| entry.match?(/^brew:(?:update|upgrade)/) }
    assert_includes output, 'Homebrew 安装或维护未完成'
    assert_includes output, '已有 Graphviz 仍可用'
    refute_includes output, 'Graphviz 步骤未完成'
  end

  def test_declined_brew_update_does_not_prepare_network
    File.write(File.join(@temporary, 'brew-ready'), '')
    fixture = brew_fixture + <<~'ZSH'
      jobs_brew_prepare_network() { print -r -- network:prepare >> "$FIXTURE_TRACE"; return 19; }
    ZSH
    output, status = shell(:report, fixture + 'install_homebrew', input: "\n")
    assert status.success?, output
    refute_includes events, 'network:prepare'
  end

  def test_offline_graphviz_does_not_prepare_network_or_maintain_brew
    File.write(File.join(@temporary, 'graphviz-ready'), '')
    fixture = brew_fixture + <<~'ZSH'
      jobs_brew_prepare_network() { print -r -- network:prepare >> "$FIXTURE_TRACE"; return 19; }
    ZSH
    output, status = shell(:report, fixture + 'ensure_graphviz', environment: { 'JOBS_POD_INSTALL_OFFLINE' => '1' })
    assert status.success?, output
    refute_includes events, 'network:prepare'
    refute events.any? { |entry| entry.start_with?('brew:') }
  end

  def test_graphviz_install_uses_network_wrapper_after_confirmation
    File.write(File.join(@temporary, 'brew-ready'), '')
    fixture = brew_fixture + <<~'ZSH'
      jobs_brew_prepare_network() { print -r -- network:prepare >> "$FIXTURE_TRACE"; return 19; }
    ZSH
    output, status = shell(:report, fixture + 'ensure_graphviz', input: "\ngo\n")
    refute status.success?, output
    assert_equal 1, events.count('network:prepare')
    refute_includes events, 'brew:install graphviz'
    assert_includes output, 'Graphviz install 失败'
  end

  private

  def events
    File.exist?(@trace) ? File.readlines(@trace, chomp: true) : []
  end

  def write_tool(name, body)
    path = File.join(@bin, name)
    File.write(path, "#!/bin/zsh\n" + body)
    File.chmod(0o755, path)
  end

  def brew_fixture
    <<~'ZSH'
      # 这里只验证交互与安装编排；网络路由另由 network_regression 覆盖。
      jobs_brew_prepare_network() { return 0; }
      jobs_brew_run_network() { "$@"; }
      jobs_brew_find() {
        jobs_brew_candidate_ok "$FIXTURE_BIN/brew" || return 1
        print -r -- "$FIXTURE_BIN/brew"
      }
      jobs_brew_install_system() {
        print -r -- install:system >> "$FIXTURE_TRACE"
        [[ "${MOCK_BREW_INSTALL_FAIL:-0}" != 1 ]] || return 1
        /usr/bin/touch "$HOME/brew-ready"
        JOBS_HOMEBREW_BIN="$FIXTURE_BIN/brew"
      }
      jobs_brew_install_user() {
        print -r -- install:user >> "$FIXTURE_TRACE"
        [[ "${MOCK_BREW_INSTALL_FAIL:-0}" != 1 ]] || return 1
        /usr/bin/touch "$HOME/brew-ready"
        JOBS_HOMEBREW_BIN="$FIXTURE_BIN/brew"
      }
    ZSH
  end

  def pif_fixture
    <<~'ZSH'
      validate_environment() { CURRENT_UID=501; }
      acquire_cross_project_lock() { return 0; }
      function /bin/ps() { print -r -- '900 1 501 SWBBuildService'; }
      process_is_alive() { return 0; }
      wait_for_process_exit() { return 0; }
      function /bin/kill() { print -r -- "kill:$*" >> "$FIXTURE_TRACE"; }
    ZSH
  end

  def shell(kind, body, input: nil, environment: {})
    setup = <<~'ZSH'
      source "$FIXTURE_LIBRARY"
      LOG_FILE="$HOME/run.log"
      VERIFY_LOG="$HOME/verify.log"
      LOCK_FILE="$HOME/pif.lock"
    ZSH
    env = @environment.merge('FIXTURE_LIBRARY' => @libraries.fetch(kind)).merge(environment)
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
          # 子进程退出后伪终端以 EIO 表示结束。
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
