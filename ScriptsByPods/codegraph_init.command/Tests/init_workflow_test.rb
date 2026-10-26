# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'json'

# 所有安装器和 CLI 均在临时目录模拟，不调用真实 brew/npm、pod install 或构建。
class JobsCodeGraphInitWorkflowTest < Minitest::Test
  SCRIPT = File.expand_path(ENV.fetch('JOBS_CODEGRAPH_SCRIPT', '../codegraph_init.command'), __dir__)
  MOCK_TOOL = <<~'ZSH'
    #!/bin/zsh
    tool="${0:t}"
    print -r -- "$tool:$*" >> "$FIXTURE_TRACE"
    case "$tool" in
      brew)
        [[ -f "$FIXTURE_HOME/brew-ready" ]] || exit 1
        case "$1" in
          --version) print -r -- 'Homebrew 5.0.0' ;;
          --prefix)
            if [[ -n "${2:-}" ]]; then print -r -- "$FIXTURE_HOME/node"; else print -r -- "$FIXTURE_HOME/brew"; fi
            ;;
          shellenv) print -r -- "export PATH=${(q)FIXTURE_HOME}/node/bin:${(q)FIXTURE_HOME}/bin:/usr/bin:/bin:/usr/sbin:/sbin" ;;
          config|doctor) exit 0 ;;
          list) [[ -f "$FIXTURE_HOME/node-ready" ]] ;;
          install|reinstall)
            [[ "${MOCK_NODE_INSTALL_FAIL:-0}" != 1 ]] || exit 23
            [[ "${MOCK_NODE_RECHECK_FAIL:-0}" == 1 ]] || /usr/bin/touch "$FIXTURE_HOME/node-ready"
            ;;
          *) exit 71 ;;
        esac
        ;;
      node)
        [[ -f "$FIXTURE_HOME/node-ready" ]] || exit 1
        case "$1" in --version) print -r -- 'v24.7.0' ;; -e) exit 0 ;; *) exit 72 ;; esac
        ;;
      npm)
        [[ -f "$FIXTURE_HOME/node-ready" ]] || exit 1
        case "$1" in
          --version) print -r -- '11.5.0' ;;
          config) print -r -- "$FIXTURE_HOME/npm-prefix" ;;
          root) print -r -- "$FIXTURE_HOME/npm-prefix/lib/node_modules" ;;
          ping) [[ "${MOCK_REGISTRY_FAIL:-0}" != 1 ]] ;;
          install)
            [[ "${MOCK_NPM_INSTALL_FAIL:-0}" != 1 ]] || exit 24
            [[ "${MOCK_CLI_RECHECK_FAIL:-0}" == 1 ]] || /usr/bin/touch "$FIXTURE_HOME/cli-ready"
            ;;
          *) exit 73 ;;
        esac
        ;;
      codegraph)
        [[ -f "$FIXTURE_HOME/cli-ready" ]] || exit 1
        case "$1" in
          --help)
            if [[ "${MOCK_WRONG_CLI:-0}" == 1 ]]; then print -r -- 'A different product'; else print -r -- 'Code intelligence and knowledge graph'; fi
            ;;
          --version) print -r -- '3.0.11' ;;
          init|sync|index|status)
            if [[ "${2:-}" == --help ]]; then
              print -r -- "Usage: codegraph $1 [options] [directory]"
              print -r -- 'CodeGraph code knowledge graph, index and explore your codebase'
              exit 0
            fi
            if [[ "$1" == sync && "${MOCK_SYNC_FAIL:-0}" == 1 ]]; then exit 25; fi
            if [[ "${MOCK_DYNAMIC_STATUS:-0}" == 1 ]]; then
              target="${@: -1}"
              target="$(cd -P -- "$target" && pwd)" || exit 76
              if [[ "$1" == status ]]; then
                /bin/cat "$target/.codegraph/fixture-status.json"
              else
                /bin/mkdir -p "$target/.codegraph" || exit 77
                /usr/bin/sqlite3 "$target/.codegraph/codegraph.db" 'CREATE TABLE IF NOT EXISTS nodes(id INTEGER PRIMARY KEY, name TEXT);' || exit 78
                printf '{"initialized":true,"projectPath":"%s","indexPath":"%s/.codegraph","lastIndexed":"2026-10-20T00:00:00Z","nodeCount":1,"index":{"state":"complete","pendingRefs":0},"pendingChanges":{"added":0,"modified":0,"removed":0}}\n' "$target" "$target" > "$target/.codegraph/fixture-status.json"
              fi
            elif [[ "$1" == status ]]; then
              /bin/cat "$FIXTURE_HOME/status.json"
            fi
            ;;
          *) exit 74 ;;
        esac
        ;;
      *) exit 75 ;;
    esac
  ZSH

  def setup
    @temporary = Dir.mktmpdir('jobs-codegraph-test-')
    @project = File.join(@temporary, '项目 空格 (测试)')
    @trace = File.join(@temporary, 'trace.log')
    @library = File.join(@temporary, 'codegraph-functions.zsh')
    FileUtils.mkdir_p([@project, File.join(@temporary, 'bin'), File.join(@temporary, 'brew'),
                      File.join(@temporary, 'node/bin'), File.join(@temporary, 'cli/bin'),
                      File.join(@temporary, 'tmp')])
    source = File.read(SCRIPT)
    raise '脚本必须以唯一 main 调用结束，拒绝执行完整入口' unless source.match?(/\nmain "\$@"\s*\z/)

    File.write(@library, source.sub(/\nmain "\$@"\s*\z/, "\n"))
    %w[brew node npm codegraph].each do |tool|
      directory = case tool
                  when 'node', 'npm' then 'node/bin'
                  when 'codegraph' then 'cli/bin'
                  else 'bin'
                  end
      path = File.join(@temporary, directory, tool)
      File.write(path, MOCK_TOOL)
      File.chmod(0o755, path)
    end
    @environment = {
      'FIXTURE_HOME' => @temporary, 'FIXTURE_TRACE' => @trace,
      'FIXTURE_LIBRARY' => @library, 'FIXTURE_PROJECT' => @project,
      'TMPDIR' => File.join(@temporary, 'tmp'),
      'PATH' => "#{@temporary}/node/bin:#{@temporary}/bin:/usr/bin:/bin:/usr/sbin:/sbin",
      'CODEGRAPH_AUTO_INIT' => '1', 'CODEGRAPH_SKIP_EXPORT' => '1',
      'CODEGRAPH_ALLOW_INSTALL' => '1', 'JOBS_POD_INSTALL_OFFLINE' => '0',
      'JOBS_CODEGRAPH_INTRO_CONFIRMED' => '0',
      'JOBS_SKIP_CODEGRAPH' => '0', 'JOBS_CODEGRAPH_PROJECT_ROOT' => @project
    }
  end

  def teardown
    FileUtils.remove_entry(@temporary) if @temporary && File.directory?(@temporary)
  end

  def test_healthy_chain_reuses_all_tools_without_installing
    mark_ready('brew', 'node', 'cli')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream')
    assert_success result
    assert_includes events, 'downstream'
    assert_includes events, 'brew:doctor'
    assert events.any? { |entry| entry.start_with?('node:-e ') }
    assert_empty installations
  end

  def test_missing_cli_reuses_healthy_upstream_and_installs_once
    mark_ready('brew', 'node')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream')
    assert_success result
    assert_equal 1, events.grep(/^npm:install /).length
    assert_empty events.grep(/^brew:(?:install|reinstall) /)
    assert_includes events, 'downstream'
    assert File.exist?(File.join(@temporary, 'cli-ready'))
  end

  def test_consecutive_missing_layers_install_in_order_and_recheck
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream')
    assert_success result
    assert_equal ['fixture:install-brew', 'brew:install node@24'], installations.take(2)
    assert_equal 3, installations.length
    assert_match(/^npm:install /, installations.last)
    assert_includes events, 'downstream'
    assert_operator events.count('node:--version'), :>=, 2
    assert_operator events.count('codegraph:--version'), :>=, 1
    assert_operator events.count('codegraph:--help'), :>=, 2
  end

  def test_cli_install_failure_stops_before_downstream_work_without_retry
    mark_ready('brew', 'node')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'MOCK_NPM_INSTALL_FAIL' => '1')
    refute result[:status].success?
    assert_equal 1, events.grep(/^npm:install /).length
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '安装失败'
  end

  def test_cli_post_install_health_failure_stops_without_retry
    mark_ready('brew', 'node')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'MOCK_CLI_RECHECK_FAIL' => '1')
    refute result[:status].success?
    assert_equal 1, events.grep(/^npm:install /).length
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '复检失败'
  end

  def test_node_install_failure_does_not_attempt_cli_install
    mark_ready('brew')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'MOCK_NODE_INSTALL_FAIL' => '1')
    refute result[:status].success?
    assert_equal ['brew:install node@24'], installations
    refute_includes events, 'downstream'
  end

  def test_node_post_install_health_failure_does_not_attempt_cli_install
    mark_ready('brew')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'MOCK_NODE_RECHECK_FAIL' => '1')
    refute result[:status].success?
    assert_equal ['brew:install node@24'], installations
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '复检失败'
  end

  def test_registry_failure_does_not_attempt_install
    mark_ready('brew', 'node')
    result = shell('ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'MOCK_REGISTRY_FAIL' => '1')
    refute result[:status].success?
    assert_empty installations
    refute_includes events, 'downstream'
  end

  def test_same_named_other_cli_is_rejected_without_install_permission
    mark_ready('brew', 'node', 'cli')
    result = shell('ALLOW_INSTALL=0; ensure_codegraph; fixture_trace downstream', 'MOCK_WRONG_CLI' => '1')
    refute result[:status].success?
    assert_empty installations
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '禁止安装'
  end

  def test_full_main_uses_sample_then_exact_project_and_cleans_its_locks
    mark_ready('brew', 'node', 'cli')
    result = shell('check_system_toolchain() { fixture_trace system-health; }; main --project-root "$FIXTURE_PROJECT"', 'MOCK_DYNAMIC_STATUS' => '1')
    assert_success result
    assert_empty installations
    initialization_events = events.grep(/^codegraph:init --yes /)
    assert_equal 2, initialization_events.length
    assert_includes initialization_events.first, '/jobs-codegraph-health.'
    assert_equal "codegraph:init --yes #{File.realpath(@project)}", initialization_events.last
    assert File.file?(File.join(@project, '.codegraph/codegraph.db'))
    refute File.exist?(File.join(@project, '.codegraph/.jobs-update.lock'))
    refute File.exist?(File.join(@project, '.codegraph/codegraph_init.pid'))
    assert_empty Dir.glob(File.join(@temporary, 'tmp/jobs-codegraph-*'))
  end

  def test_full_main_failure_releases_project_and_toolchain_locks
    mark_ready('brew', 'node')
    result = shell('check_system_toolchain() { fixture_trace system-health; }; main --project-root "$FIXTURE_PROJECT"', 'MOCK_NPM_INSTALL_FAIL' => '1')
    refute result[:status].success?
    assert_equal 1, events.grep(/^npm:install /).length
    refute File.exist?(File.join(@project, '.codegraph/.jobs-update.lock'))
    refute File.exist?(File.join(@project, '.codegraph/codegraph_init.pid'))
    assert_empty Dir.glob(File.join(@temporary, 'tmp/jobs-codegraph-*'))
    assert_empty events.grep(/^codegraph:(?:init|sync|index) (?!.*--help)/)
  end

  def test_check_only_healthy_main_does_not_write_project_or_install
    mark_ready('brew', 'node', 'cli')
    before = Dir.children(@project)
    result = shell('check_system_toolchain() { fixture_trace system-health; }; main --check-only --project-root "$FIXTURE_PROJECT"')
    assert_success result
    assert_equal before, Dir.children(@project)
    assert_empty installations
    assert_empty events.grep(/^codegraph:(?:init|sync|index) (?!.*--help)/)
    assert_includes result[:stdout], '只读体检完成'
  end

  def test_check_only_after_project_option_is_noninteractive
    mark_ready('brew', 'node', 'cli')
    result = shell('check_system_toolchain() { fixture_trace system-health; }; main --project-root "$FIXTURE_PROJECT" --check-only', 'CODEGRAPH_AUTO_INIT' => '0')
    assert_success result
    assert_empty Dir.children(@project)
    assert_empty installations
    assert_includes result[:stdout], '只读体检完成'
  end

  def test_short_help_does_not_require_terminal_or_write_project
    result = shell('main -h', 'CODEGRAPH_AUTO_INIT' => '0')
    assert_success result
    assert_empty Dir.children(@project)
    assert_empty events
    assert_includes result[:stdout], '用法：'
  end

  def test_check_only_missing_tool_does_not_install_or_write_project
    result = shell('check_system_toolchain() { fixture_trace system-health; }; main --check-only --project-root "$FIXTURE_PROJECT"')
    refute result[:status].success?
    assert_empty Dir.children(@project)
    assert_empty installations
    assert_includes result[:stdout], '禁止安装'
  end

  def test_offline_mode_forbids_missing_cli_install
    mark_ready('brew', 'node')
    result = shell('initialize_runtime --project-root "$FIXTURE_PROJECT"; ensure_brew; ensure_node_npm; ensure_codegraph; fixture_trace downstream', 'JOBS_POD_INSTALL_OFFLINE' => '1')
    refute result[:status].success?
    assert_empty installations
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '禁止安装'
  end

  def test_sync_failure_falls_back_once_using_exact_unicode_space_target
    mark_ready('cli')
    write_database
    write_status
    result = shell('MOCK_SYNC_FAIL=1; export MOCK_SYNC_FAIL; run_codegraph_index')
    assert_success result
    assert_equal ["codegraph:sync #{@project}", "codegraph:index #{@project}"], events.grep(/^codegraph:(?:sync|index) /)
    assert_equal 2, events.grep(/^codegraph:status --json /).length
    assert_includes result[:stdout], '地图更新通过'
  end

  def test_first_index_initializes_exact_target
    mark_ready('cli')
    result = shell('codegraph_check_target; PROJECT_ROOT="$CODEGRAPH_TARGET_DIRECTORY"; run_codegraph_index', 'MOCK_DYNAMIC_STATUS' => '1')
    assert_success result
    assert_equal ["codegraph:init --yes #{File.realpath(@project)}"], events.grep(/^codegraph:init --yes /)
    assert File.file?(File.join(@project, '.codegraph/codegraph.db'))
  end

  def test_database_missing_nodes_table_is_rejected_before_cli_status
    mark_ready('cli')
    write_database('CREATE TABLE unrelated(value TEXT);')
    result = shell('validate_index_status complete; fixture_trace downstream')
    refute result[:status].success?
    assert_empty events.grep(/^codegraph:status /)
    refute_includes events, 'downstream'
    assert_includes result[:stdout], 'nodes 表'
  end

  def test_real_wal_database_without_sidecars_supports_readonly_schema_fallback
    @project = File.join(@temporary, 'WAL 项目 % ? #')
    FileUtils.mkdir_p(File.join(@project, '.codegraph'))
    @environment['FIXTURE_PROJECT'] = @project
    database = File.join(@project, '.codegraph/codegraph.db')
    _stdout, stderr, status = Open3.capture3('/usr/bin/sqlite3', '-cmd', 'PRAGMA journal_mode=WAL;', database,
                                           'CREATE TABLE nodes(id INTEGER PRIMARY KEY); PRAGMA wal_checkpoint(TRUNCATE);')
    assert status.success?, stderr
    # 夹具连接已退出且 WAL 已 checkpoint；精确移除系统 SQLite 保留的空 sidecar。
    assert_equal 0, File.size("#{database}-wal") if File.exist?("#{database}-wal")
    FileUtils.rm_f(["#{database}-wal", "#{database}-shm"])
    refute File.exist?("#{database}-wal")
    refute File.exist?("#{database}-shm")
    original = File.binread(database)
    _plain_output, _plain_error, plain_status = Open3.capture3('/usr/bin/sqlite3', '-batch', '-readonly', '-init', '/dev/null', database,
                                                             "SELECT 1 FROM sqlite_master WHERE type='table' AND name='nodes' LIMIT 1;")
    result = shell('codegraph_require_target_schema; fixture_trace schema-ok')
    assert_success result
    assert_includes events, 'schema-ok'
    assert_includes result[:stdout], '无 WAL 主库的只读 schema 兼容检查' unless plain_status.success?
    assert_equal original, File.binread(database)
    refute File.exist?("#{database}-wal")
    refute File.exist?("#{database}-shm")
  end

  def test_active_wal_readonly_failure_never_uses_immutable_fallback
    FileUtils.mkdir_p(File.join(@project, '.codegraph'))
    database = File.join(@project, '.codegraph/codegraph.db')
    Open3.popen3('/usr/bin/sqlite3', database) do |input, output, _error, _process|
      input.puts "PRAGMA journal_mode=WAL;\nCREATE TABLE nodes(id INTEGER PRIMARY KEY);\n.print fixture-ready"
      input.flush
      ready = false
      while (line = output.gets)
        if line.chomp == 'fixture-ready'
          ready = true
          break
        end
      end
      assert ready, 'SQLite 写连接未能准备 WAL 夹具'
      assert File.file?("#{database}-wal")
      result = shell('function /usr/bin/sqlite3() { fixture_trace "sqlite:$*"; return 14; }; codegraph_require_target_schema; fixture_trace downstream')
      refute result[:status].success?
      assert_equal 1, events.grep(/^sqlite:/).length
      refute events.any? { |entry| entry.include?('immutable=1') }
      refute_includes events, 'downstream'
      assert_includes result[:stdout], '含 WAL 且无法只读校验'
      assert File.file?("#{database}-wal"), '失败分支不得删除活跃 WAL'
      input.close
    end
  end

  def test_foreign_project_status_is_rejected_before_sync
    mark_ready('cli')
    write_database
    write_status('projectPath' => @temporary, 'indexPath' => File.join(@temporary, '.codegraph'))
    result = shell('run_codegraph_index; fixture_trace downstream')
    refute result[:status].success?
    assert_empty events.grep(/^codegraph:(?:sync|index) /)
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '身份或输出位置不匹配'
  end

  def test_incomplete_index_and_pending_changes_are_rejected
    mark_ready('cli')
    write_database
    [
      { 'lastIndexed' => nil },
      { 'index' => { 'state' => 'running', 'pendingRefs' => 0 } },
      { 'pendingChanges' => { 'added' => 1, 'modified' => 0, 'removed' => 0 } },
      { 'index' => { 'state' => 'complete', 'pendingRefs' => 1 } }
    ].each do |changes|
      write_status(changes)
      result = shell('validate_index_status complete; fixture_trace downstream')
      refute result[:status].success?, changes.inspect
      refute_includes events, 'downstream'
    end
  end

  def test_symlinked_map_is_rejected_without_writing_target
    destination = File.join(@temporary, '另一个工程地图')
    FileUtils.mkdir_p(destination)
    File.symlink(destination, File.join(@project, '.codegraph'))
    result = shell('codegraph_check_target; fixture_trace downstream')
    refute result[:status].success?
    assert_empty Dir.children(destination)
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '符号链接'
  end

  def test_live_project_lock_is_preserved_and_skips_work
    lock = File.join(@project, '.codegraph/.jobs-update.lock')
    FileUtils.mkdir_p(lock)
    File.write(File.join(lock, 'pid'), "#{Process.pid}\n")
    result = shell('acquire_project_lock; fixture_trace downstream')
    assert_success result
    assert_equal "#{Process.pid}\n", File.read(File.join(lock, 'pid'))
    refute_includes events, 'downstream'
    assert_includes result[:stdout], '已有 CodeGraph 任务'
  end

  def test_stale_lock_is_replaced_once_and_owned_by_current_process
    lock = File.join(@temporary, 'old.lock')
    FileUtils.mkdir_p(lock)
    File.write(File.join(lock, 'pid'), "2147483647\n")
    result = shell('take_lock "$FIXTURE_HOME/old.lock" || exit 1; [[ "$(<"$FIXTURE_HOME/old.lock/pid")" == "$$" ]] || exit 1')
    assert_success result
  end

  def test_symlink_lock_is_rejected_without_deleting_destination_marker
    destination = File.join(@temporary, 'unrelated-lock-data')
    FileUtils.mkdir_p(destination)
    marker = File.join(destination, 'pid')
    File.write(marker, "2147483647\n")
    File.symlink(destination, File.join(@temporary, 'unsafe.lock'))
    result = shell('take_lock "$FIXTURE_HOME/unsafe.lock"; [[ "$?" != 0 ]] || exit 1')
    assert_success result
    assert File.file?(marker), '锁探测不能删除符号链接目标中的文件'
    assert_equal "2147483647\n", File.read(marker)
  end

  private

  def mark_ready(*names)
    names.each { |name| FileUtils.touch(File.join(@temporary, "#{name}-ready")) }
  end

  def write_database(sql = 'CREATE TABLE nodes(id INTEGER PRIMARY KEY, name TEXT);')
    directory = File.join(@project, '.codegraph')
    FileUtils.mkdir_p(directory)
    _stdout, stderr, status = Open3.capture3('/usr/bin/sqlite3', File.join(directory, 'codegraph.db'), sql)
    raise stderr unless status.success?
  end

  def write_status(changes = {})
    content = {
      'initialized' => true, 'projectPath' => @project, 'indexPath' => File.join(@project, '.codegraph'),
      'lastIndexed' => '2026-10-20T00:00:00.000Z', 'nodeCount' => 1,
      'index' => { 'state' => 'complete', 'pendingRefs' => 0 },
      'pendingChanges' => { 'added' => 0, 'modified' => 0, 'removed' => 0 }
    }.merge(changes)
    File.write(File.join(@temporary, 'status.json'), JSON.generate(content))
  end

  def events
    File.exist?(@trace) ? File.readlines(@trace, chomp: true) : []
  end

  def installations
    events.grep(/^(?:fixture:install-brew|brew:(?:install|reinstall) |npm:install )/)
  end

  def assert_success(result)
    assert result[:status].success?, "#{result[:stdout]}\n#{result[:stderr]}"
  end

  def shell(body, environment = {})
    setup = <<~'ZSH'
      source "$FIXTURE_LIBRARY"
      setopt NO_NOMATCH
      fixture_trace() { print -r -- "$*" >> "$FIXTURE_TRACE"; }
      CODEGRAPH_LOG_FILE="$FIXTURE_HOME/workflow.log"
      CODEGRAPH_PREFIX="$FIXTURE_HOME/cli"
      CODEGRAPH_NPM_BIN="$FIXTURE_HOME/node/bin/npm"
      CODEGRAPH_NODE_BIN="$FIXTURE_HOME/node/bin/node"
      CODEGRAPH_BIN="$CODEGRAPH_PREFIX/bin/codegraph"
      PROJECT_ROOT="$FIXTURE_PROJECT"
      CODEGRAPH_TARGET_DIRECTORY="$PROJECT_ROOT"
      JOBS_HOMEBREW_BIN="$FIXTURE_HOME/bin/brew"
      ALLOW_INSTALL=1
      CHECK_ONLY=0
      # 工作流测试只模拟已经取得的用户选择；真实 TTY、回车、YES 分支另由 interaction_test 覆盖。
      functions[fixture_real_intro]="$functions[show_script_intro_and_wait]"
      show_script_intro_and_wait() {
        local argument=""
        for argument in "$@"; do
          case "$argument" in --check-only|--help|-h) fixture_real_intro "$@"; return ;; esac
        done
        CODEGRAPH_INTERACTION=interactive
      }
      codegraph_ask_to_run() {
        [[ "$1" == *缺失或损坏* || "$1" == *当前工程代码地图* ]]
      }
      codegraph_rebuild_index() {
        codegraph_run_logged "$CODEGRAPH_BIN" index "$PROJECT_ROOT" || codegraph_stop 'CodeGraph 全量重建失败'
      }
      # 只替换发现与网络安装边界；健康检查、状态校验和下游编排沿用真实实现。
      jobs_brew_find() {
        jobs_brew_candidate_ok "$FIXTURE_HOME/bin/brew" || return 1
        print -r -- "$FIXTURE_HOME/bin/brew"
      }
      jobs_brew_choose_installation() { JOBS_HOMEBREW_INSTALL_MODE=user; }
      jobs_brew_install_user() {
        fixture_trace fixture:install-brew
        /usr/bin/touch "$FIXTURE_HOME/brew-ready"
        JOBS_HOMEBREW_BIN="$FIXTURE_HOME/bin/brew"
      }
      functions[fixture_real_candidate_ok]="$functions[codegraph_candidate_ok]"
      codegraph_candidate_ok() {
        [[ "$1" == "$FIXTURE_HOME/cli/bin/codegraph" ]] || return 1
        fixture_real_candidate_ok "$1"
      }
      cd -- "$PROJECT_ROOT" || exit 1
    ZSH
    stdout, stderr, status = Open3.capture3(@environment.merge(environment), '/bin/zsh', '-f', '-c', setup + body,
                                           chdir: @temporary)
    { stdout: stdout, stderr: stderr, status: status }
  end
end
