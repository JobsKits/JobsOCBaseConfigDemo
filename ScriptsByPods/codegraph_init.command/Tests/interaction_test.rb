# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'json'
require 'pty'
require 'timeout'

# 在临时工程和伪终端验证真实确认分支；所有 CLI 写入边界都使用假命令。
class JobsCodeGraphInteractionTest < Minitest::Test
  SCRIPT = File.expand_path('../codegraph_init.command', __dir__)
  EXPORT_SCRIPT = File.expand_path('../../codegraph_export_md.command/codegraph_export_md.command', __dir__)

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
