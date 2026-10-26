# frozen_string_literal: true

require 'fileutils'
require 'minitest/autorun'
require 'open3'
require 'pty'
require 'timeout'
require 'tmpdir'

# 用真实伪终端和假子脚本验证挂载链路，不调用安装器或工程工具。
class PodInstallInteractionWorkflowTest < Minitest::Test
  SCRIPT_NAME = '【MacOS】📦Pod Install离线保护.command'
  SCRIPT = File.expand_path("../#{SCRIPT_NAME}", __dir__)
  CHILDREN = {
    'dependency' => '【MacOS】🔍查询Xcode工程依赖关系.command',
    'pif' => '【MacOS】🧹恢复Xcode PIF构建会话.command',
    'codegraph' => 'codegraph_init.command'
  }.freeze

  def setup
    @temporary = Dir.mktmpdir('jobs-pod-interaction-')
    @project = File.join(@temporary, '工程 空格 (交互)')
    @trace = File.join(@temporary, 'children.log')
    FileUtils.mkdir_p(@project)
    File.write(File.join(@project, 'Podfile'), "# 隔离测试工程\n")
    CHILDREN.each do |label, script_name|
      path = File.join(@project, 'ScriptsByPods', script_name, script_name)
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
    result = terminal('JOBS_POD_INSTALL_OFFLINE' => '1')
    assert result[:status].success?, result[:output]
    assert_includes written_events, 'dependency:dependency-answer:interactive:1'
  end

  def test_failed_child_is_reported_and_remaining_children_still_run
    result = terminal('FIXTURE_FAIL' => 'pif')
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
  GUARD = File.expand_path('../jobs_pod_install_offline_guard.rb', __dir__)
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
    directory = File.join(@temporary, 'ScriptsByPods', SCRIPT_NAME)
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
