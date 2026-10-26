# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'pty'
require 'timeout'

# 使用真实脚本函数、伪终端和假命令，不安装工具、不触碰真实 PIF 进程。
class JobsPodReportInteractionTest < Minitest::Test
  REPORT = File.expand_path('../【MacOS】🔍查询Xcode工程依赖关系.command', __dir__)
  PIF = File.expand_path('../../【MacOS】🧹恢复Xcode PIF构建会话.command/【MacOS】🧹恢复Xcode PIF构建会话.command', __dir__)

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
