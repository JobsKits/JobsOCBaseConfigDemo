# frozen_string_literal: true

require 'minitest/autorun'
require 'tmpdir'
require 'fileutils'
require 'open3'
require 'json'
require 'rbconfig'

class JobsCocoaPodsPodfileIntegrationTest < Minitest::Test
  PROJECT_ROOT = File.expand_path('../../..', __dir__)
  NETWORK_PACKAGE = '【MacOS】🌐CocoaPods网络适配.command'
  SOURCE_PACKAGE = '【MacOS】🌐CocoaPods源自动选择.command'
  GUARD_PACKAGE = '【MacOS】📦Pod Install离线保护.command'

  GUARD_MODULE = <<~'RUBY'
    module JobsPodInstallOfflineGuard
      def self.guard!(project_root)
        $jobs_fixture_events << ['guard', project_root]
      end
    end
  RUBY

  NETWORK_MODULE = <<~'RUBY'
    module JobsCocoaPodsNetwork
      def self.apply!(project_root:)
        dependency_command = File.basename($PROGRAM_NAME) == 'pod' &&
          %w[install update].include?(ARGV.find { |argument| !argument.start_with?('-') })
        unless dependency_command
          $jobs_fixture_events << ['network_skipped', project_root]
          return :skipped
        end
        $jobs_fixture_events << ['network', project_root]
        ENV.fetch('JOBS_FIXTURE_NETWORK_RESULT', 'inherited').to_sym
      end
    end
  RUBY

  ARCHIVE_MODULE = <<~'RUBY'
    module JobsCocoaPodsDownloadFallback
      def self.install!
        $jobs_fixture_events << ['archive']
        :installed
      end
    end
  RUBY

  SOURCE_MODULE = <<~'RUBY'
    module JobsCocoaPodsSource
      def self.apply!(podfile, project_root:)
        $jobs_fixture_events << ['specs', project_root]
        podfile.source('https://cdn.cocoapods.org/')
      end
    end
  RUBY

  RUNNER = <<~'RUBY'
    require 'json'
    prefix_path, events_path, program, *arguments = ARGV
    $PROGRAM_NAME = program
    ARGV.replace(arguments)
    $jobs_fixture_events = []
    podfile = Object.new
    def podfile.source(url)
      $jobs_fixture_events << ['source', url]
    end
    def podfile.platform(*arguments)
    end
    # 只执行真实 Podfile 的安装配置前置段，不能触发安装 hook。
    podfile.instance_eval(File.read(prefix_path), prefix_path, 1)
    File.write(events_path, JSON.generate($jobs_fixture_events))
  RUBY

  def setup
    lines = File.readlines(File.join(PROJECT_ROOT, 'Podfile'))
    boundary = lines.index { |line| line.match?(/^\s*install!\s+['"]cocoapods['"]/) }
    raise '未找到 Podfile install! 边界，拒绝执行完整 Podfile' unless boundary

    @podfile_prefix = lines.take(boundary).join
  end

  def test_install_prepares_network_and_archive_before_specs
    result = run_fixture(arguments: ['install'])
    assert_equal %w[guard network archive specs source], event_names(result)
    assert_project_roots(result)
    assert_empty result[:stderr]
  end

  def test_update_with_a_leading_option_registers_archive_before_specs
    result = run_fixture(arguments: ['--silent', 'update', 'AMPopTip'])
    assert_equal %w[guard network archive specs source], event_names(result)
    assert_project_roots(result)
  end

  def test_query_commands_do_not_probe_or_register_an_archive_downloader
    [%w[ipc spec], %w[spec cat AMPopTip], %w[repo list], %w[env], %w[--version]].each do |arguments|
      result = run_fixture(arguments: arguments)
      assert_equal %w[guard network_skipped specs source], event_names(result), arguments.inspect
      assert_project_roots(result)
      assert_empty result[:stderr]
    end
  end

  def test_non_pod_program_does_not_register_an_archive_downloader
    result = run_fixture(arguments: ['install'], program: '/fixture/bin/ruby')
    assert_equal %w[guard network_skipped specs source], event_names(result)
  end

  def test_network_outcomes_keep_archive_and_specs_in_the_same_order
    %w[skipped inherited proxy unavailable].each do |outcome|
      result = run_fixture(arguments: ['install'], network_result: outcome)
      assert_equal %w[guard network archive specs source], event_names(result), outcome
    end
  end

  def test_missing_network_module_warns_and_continues_to_archive_and_specs
    result = run_fixture(arguments: ['install'], network_mode: :missing)
    assert_equal %w[guard archive specs source], event_names(result)
    assert_includes result[:stderr], '[PodNetwork]'
    assert_includes result[:stderr], '网络适配模块缺失'
  end

  def test_network_load_and_execution_failures_warn_and_continue_to_specs
    [:load_error, :syntax_error, :load_runtime_error, :runtime_error].each do |mode|
      result = run_fixture(arguments: ['install'], network_mode: mode)
      assert_equal %w[guard archive specs source], event_names(result), mode.to_s
      assert_includes result[:stderr], '[PodNetwork]', mode.to_s
      assert_includes result[:stderr], '网络适配不可用', mode.to_s
    end
  end

  def test_missing_archive_module_warns_and_continues_to_specs
    result = run_fixture(arguments: ['install'], archive_mode: :missing)
    assert_equal %w[guard network specs source], event_names(result)
    assert_includes result[:stderr], '[PodNetwork]'
    assert_includes result[:stderr], '官方源码归档回退模块缺失'
  end

  def test_archive_load_and_execution_failures_warn_and_continue_to_specs
    [:load_error, :syntax_error, :load_runtime_error, :runtime_error].each do |mode|
      result = run_fixture(arguments: ['install'], archive_mode: mode)
      assert_equal %w[guard network specs source], event_names(result), mode.to_s
      assert_includes result[:stderr], '[PodNetwork]', mode.to_s
      assert_includes result[:stderr], '官方源码归档回退不可用', mode.to_s
    end
  end

  def test_both_optional_modules_can_fail_without_blocking_specs
    result = run_fixture(arguments: ['install'], network_mode: :runtime_error, archive_mode: :syntax_error)
    assert_equal %w[guard specs source], event_names(result)
    assert_includes result[:stderr], '网络适配不可用'
    assert_includes result[:stderr], '官方源码归档回退不可用'
  end

  private

  def event_names(result)
    result[:events].map(&:first)
  end

  def assert_project_roots(result)
    assert_includes result[:root], 'OC 工程 中文路径'
    result[:events].each do |name, value|
      next unless %w[guard network network_skipped specs].include?(name)

      assert_equal result[:root], value, "#{name} 使用错误的工程根目录"
    end
  end

  def run_fixture(arguments:, program: '/fixture/bin/pod', network_mode: :normal, archive_mode: :normal, network_result: 'inherited')
    Dir.mktmpdir('jobs-podfile-integration-') do |temporary_root|
      project_root = File.join(temporary_root, 'OC 工程 中文路径')
      prefix_path = File.join(project_root, 'Podfile')
      events_path = File.join(temporary_root, 'events.json')
      FileUtils.mkdir_p(project_root)
      File.write(prefix_path, @podfile_prefix)
      write_module(project_root, GUARD_PACKAGE, 'jobs_pod_install_offline_guard.rb', GUARD_MODULE)
      write_module(project_root, NETWORK_PACKAGE, 'jobs_cocoapods_network.rb', NETWORK_MODULE, network_mode, 'JobsCocoaPodsNetwork', 'apply!')
      write_module(project_root, NETWORK_PACKAGE, 'jobs_cocoapods_download_fallback.rb', ARCHIVE_MODULE, archive_mode, 'JobsCocoaPodsDownloadFallback', 'install!')
      write_module(project_root, SOURCE_PACKAGE, 'jobs_cocoapods_source.rb', SOURCE_MODULE)

      environment = { 'JOBS_FIXTURE_NETWORK_RESULT' => network_result }
      stdout, stderr, status = Open3.capture3(
        environment, RbConfig.ruby, '-e', RUNNER, prefix_path, events_path, program, *arguments,
        chdir: temporary_root
      )
      assert status.success?, "隔离 Podfile 前置段失败：#{stderr}\n#{stdout}"
      assert File.file?(events_path), 'Podfile 前置段未正常执行完成'
      { events: JSON.parse(File.read(events_path)), stderr: stderr, root: project_root }
    end
  end

  def write_module(project_root, package, basename, normal_source, mode = :normal, module_name = nil, method_name = nil)
    return if mode == :missing

    source = case mode
             when :normal
               normal_source
             when :load_error
               "raise LoadError, 'fixture module load failed'\n"
             when :syntax_error
               "module FixtureBrokenModule\n  def self.unfinished(\n"
             when :load_runtime_error
               "raise RuntimeError, 'fixture module initialization failed'\n"
             when :runtime_error
               <<~RUBY
                 module #{module_name}
                   def self.#{method_name}(*arguments, **keywords)
                     raise RuntimeError, 'fixture module execution failed'
                   end
                 end
               RUBY
             else
               raise "不支持的模块夹具模式：#{mode}"
             end
    path = File.join(project_root, 'ScriptsByPods', package, basename)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, source)
  end
end
