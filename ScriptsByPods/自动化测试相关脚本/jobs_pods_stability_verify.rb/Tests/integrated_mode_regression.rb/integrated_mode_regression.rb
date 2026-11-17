#!/usr/bin/env ruby
# frozen_string_literal: true

require 'digest'
require 'fileutils'
require 'json'
require 'minitest/autorun'
require 'tmpdir'
require 'xcodeproj'
require_relative '../../jobs_stability_integrated.rb/jobs_stability_integrated'

# 用实际Xcodeproj对象构造合法与损坏项目，不执行安装、构建或设备操作。
class IntegratedModeRegression < Minitest::Test
  APP = JobsStabilityIntegrated::APP
  TESTS = JobsStabilityIntegrated::TESTS

  def setup
    @temporary = Dir.mktmpdir('jobs-integrated-regression-')
    @root = File.join(@temporary, '工程 中文 (临时)')
    FileUtils.mkdir_p(@root)
    @root = File.realpath(@root)
  end

  def teardown
    FileUtils.remove_entry(@temporary) if File.directory?(@temporary)
  end

  def write(relative, content)
    path = File.join(@root, relative)
    FileUtils.mkdir_p(File.dirname(path))
    File.write(path, content)
    path
  end

  def build_fixture(default_on: false, main_without_exceptions: false)
    write('App/main.m', 'int main(int argc, char **argv) { return argc; }')
    write('Libs/Production.m', '@implementation FixtureProduction @end')
    write('Libs/Excluded.m', '@implementation ExcludedProduction @end')
    write('Tests/ComponentStability/Alpha/AlphaTests.m', <<~'OBJC')
      @interface AlphaTests : XCTestCase @end
      @implementation AlphaTests
      - (void)testFirst { XCTAssertTrue(YES); }
      - (void)testSecond { XCTAssertTrue(YES); }
      @end
    OBJC
    write('Tests/ComponentStability/Alpha/Support.m', '@implementation AlphaFixture @end')
    write('Tests/ComponentStability/Host/HostTests.m', <<~'OBJC')
      @interface HostTests : XCTestCase @end
      @implementation HostTests
      - (void)testHost { XCTAssertTrue(YES); }
      @end
    OBJC
    write('Tests/ComponentStability/Skipped.m', '@implementation DeliberatelySkipped @end')
    write('Tests/ComponentStability/Alpha/Fixture.xib', '<document/>')
    Xcodeproj::Plist.write_to_path({ 'original-signing-key' => 'preserve-me' }, File.join(@root, 'App/Original.entitlements'))
    Xcodeproj::Plist.write_to_path({
      'CFBundleIdentifier' => 'org.jobs.Original',
      'UIApplicationSceneManifest' => {
        'UISceneConfigurations' => {
          'UIWindowSceneSessionRoleApplication' => [{ 'UISceneDelegateClassName' => 'OriginalBusinessSceneDelegate' }]
        }
      }
    }, File.join(@root, 'App/Original.plist'))
    @manifest = {
      'version' => 1,
      'components' => [{
        'name' => 'Alpha',
        'test_sources' => ['Tests/ComponentStability/Alpha/AlphaTests.m'],
        'support_sources' => ['Tests/ComponentStability/Alpha/Support.m'],
        'resources' => ['Tests/ComponentStability/Alpha/Fixture.xib'],
        'production_sources' => ['Libs/Production.m'],
        'test_classes' => ['AlphaTests'], 'expected_test_count' => 2
      }],
      'host' => {
        'test_sources' => ['Tests/ComponentStability/Host/HostTests.m'],
        'test_classes' => ['HostTests'], 'expected_test_count' => 1
      }
    }
    save_manifest
    @project = Xcodeproj::Project.new(File.join(@root, APP + '.xcodeproj'))
    @app = @project.new_target(:application, APP, :ios, '16.6')
    @tests = @project.new_target(:unit_test_bundle, TESTS, :ios, '16.6')
    @tests.add_dependency(@app)
    @app.build_configurations.each do |configuration|
      configuration.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = 'org.jobs.IntegratedFixture'
      configuration.build_settings['CODE_SIGN_ENTITLEMENTS'] = 'App/Original.entitlements'
      configuration.build_settings['INFOPLIST_FILE'] = 'App/Original.plist'
    end
    @main_group = synchronized('App', @app, default_on, main_without_exceptions ? nil : (default_on ? [] : ['main.m']))
    @libs_group = synchronized('Libs', @app, default_on, default_on ? ['Excluded.m'] : ['Production.m'])
    tests_enabled = ['Alpha/AlphaTests.m', 'Alpha/Support.m', 'Host/HostTests.m', 'Alpha/Fixture.xib']
    @test_group = synchronized('Tests/ComponentStability', @tests, default_on, default_on ? ['Skipped.m'] : tests_enabled)
    @project.save
  end

  def synchronized(path, target, default_on, members)
    group = @project.new(Xcodeproj::Project::Object::PBXFileSystemSynchronizedRootGroup)
    group.path = path
    group.source_tree = '<group>'
    @project.main_group.children << group
    target.file_system_synchronized_groups << group if default_on
    if members
      exception = @project.new(Xcodeproj::Project::Object::PBXFileSystemSynchronizedBuildFileExceptionSet)
      exception.target = target
      exception.membership_exceptions = members
      group.exceptions << exception
    end
    group
  end

  def save_manifest
    write(JobsStabilityIntegrated::MANIFEST, JSON.pretty_generate(@manifest))
  end

  def snapshot(root)
    Dir.glob(File.join(root, '**', '*'), File::FNM_DOTMATCH).select { |path| File.file?(path) }.sort.to_h do |path|
      [path.delete_prefix(root + '/'), Digest::SHA256.file(path).hexdigest]
    end
  end

  def assert_manifest_rejected(pattern)
    save_manifest
    error = assert_raises(StandardError) { JobsStabilityIntegrated.read_manifest(@root) }
    assert_match(pattern, error.message)
  end

  def test_manifest_freezes_classes_and_method_counts
    build_fixture
    report = JobsStabilityIntegrated.audit(@root)
    assert report['valid'], report['issues'].join("\n")
    assert_equal 1, report['component_count']
    assert_equal 2, report['test_method_count']
    assert_equal 1, report['host_test_method_count']
    assert_equal 0, report['harness_count']
    assert_equal Digest::SHA256.file(File.join(@root, JobsStabilityIntegrated::MANIFEST)).hexdigest, report['manifest_sha256']
  end

  def install_test_xcconfig(content = nil)
    label = "Pods-#{TESTS}"
    @tests.build_configurations.each do |configuration|
      relative = "Pods/Target Support Files/#{label}/#{label}.#{configuration.name.downcase}.xcconfig"
      text = content || "PODS_ROOT = ${SRCROOT}/Pods\nPODS_CONFIGURATION_BUILD_DIR = ${BUILD_DIR}/${CONFIGURATION}${EFFECTIVE_PLATFORM_NAME}\nHEADER_SEARCH_PATHS = $(inherited) ${PODS_CONFIGURATION_BUILD_DIR}/Dependency/Dependency.framework/Headers\nFRAMEWORK_SEARCH_PATHS = $(inherited) ${PODS_CONFIGURATION_BUILD_DIR}/Dependency\n"
      write(relative, text)
      configuration.base_configuration_reference = @project.main_group.new_file(relative)
    end
    @project.save
  end

  def test_installed_test_configuration_requires_actual_generated_test_context
    build_fixture
    assert_match(/缺少已安装/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release]) }.message)
    install_test_xcconfig
    result = JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release])
    assert_equal TESTS, result['target']
    assert_equal %w[Debug Release], result['configurations'].map { |row| row['configuration'] }
    assert result['configurations'].all? { |row| row['sha256'] == Digest::SHA256.file(row['xcconfig']).hexdigest }
  end

  def test_installed_test_configuration_rejects_missing_or_empty_dependency_settings
    build_fixture
    install_test_xcconfig("PODS_ROOT = ${SRCROOT}/Pods\nHEADER_SEARCH_PATHS = $(inherited)\n")
    assert_match(/缺少有效/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, ['Debug']) }.message)
    File.unlink(@tests.build_configurations.first.base_configuration_reference.real_path)
    assert_match(/缺少已安装/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, [@tests.build_configurations.first.name]) }.message)
  end

  def test_search_context_preserves_order_quoted_paths_variables_and_unrelated_settings
    build_fixture
    other = @project.new_target(:unit_test_bundle, TESTS + 'Other', :ios, '16.6')
    @app.build_configurations.each do |configuration|
      suffix = configuration.name
      configuration.build_settings['HEADER_SEARCH_PATHS'] = ['$(inherited)', '"$(SRCROOT)/App Headers"', "$(SRCROOT)/#{suffix}"]
      configuration.build_settings['FRAMEWORK_SEARCH_PATHS'] = '$(inherited) "${SRCROOT}/Frameworks With Spaces" ${CUSTOM_FRAMEWORKS}'
      configuration.build_settings['LIBRARY_SEARCH_PATHS'] = ['$(inherited)', '$(CUSTOM_LIBRARIES)']
    end
    @tests.build_configurations.each do |configuration|
      configuration.build_settings['HEADER_SEARCH_PATHS'] = ['${inherited}', '"$(SRCROOT)/Test Headers"', '"$(SRCROOT)/App Headers"']
      configuration.build_settings['FRAMEWORK_SEARCH_PATHS'] = '$(inherited) "$(SRCROOT)/Test Frameworks"'
      configuration.build_settings['OTHER_LDFLAGS'] = ['$(inherited)', '-test-only']
    end
    before_app = Marshal.dump(@app.build_configurations.map(&:build_settings))
    before_other = Marshal.dump(other.build_configurations.map(&:build_settings))
    before_test_non_search = @tests.build_configurations.map { |configuration| configuration.build_settings.reject { |key, _| JobsStabilityIntegrated::SEARCH_CONTEXT_KEYS.include?(key) } }
    assert JobsStabilityIntegrated.inherit_test_search_context(@project)
    @tests.build_configurations.each do |configuration|
      assert_equal ['${inherited}', '"$(SRCROOT)/Test Headers"', '"$(SRCROOT)/App Headers"', '$(inherited)', "$(SRCROOT)/#{configuration.name}"], configuration.build_settings['HEADER_SEARCH_PATHS']
      assert_equal ['$(inherited)', '"$(SRCROOT)/Test Frameworks"', '"${SRCROOT}/Frameworks With Spaces"', '${CUSTOM_FRAMEWORKS}'], configuration.build_settings['FRAMEWORK_SEARCH_PATHS']
      assert_equal ['$(inherited)', '$(CUSTOM_LIBRARIES)'], configuration.build_settings['LIBRARY_SEARCH_PATHS']
    end
    assert_equal before_app, Marshal.dump(@app.build_configurations.map(&:build_settings))
    assert_equal before_other, Marshal.dump(other.build_configurations.map(&:build_settings))
    assert_equal before_test_non_search, @tests.build_configurations.map { |configuration| configuration.build_settings.reject { |key, _| JobsStabilityIntegrated::SEARCH_CONTEXT_KEYS.include?(key) } }
    @project.save
    reopened = Xcodeproj::Project.open(@project.path)
    refute JobsStabilityIntegrated.inherit_test_search_context(reopened), '重复安装应幂等'
  end

  def test_search_context_handles_empty_values_and_requires_exact_targets_and_configuration
    build_fixture
    @app.build_configurations.each do |configuration|
      configuration.build_settings['HEADER_SEARCH_PATHS'] = nil
      configuration.build_settings['FRAMEWORK_SEARCH_PATHS'] = ''
      configuration.build_settings['LIBRARY_SEARCH_PATHS'] = []
    end
    @tests.build_configurations.each do |configuration|
      configuration.build_settings['HEADER_SEARCH_PATHS'] = ['$(inherited)', '']
      configuration.build_settings['FRAMEWORK_SEARCH_PATHS'] = nil
      configuration.build_settings['LIBRARY_SEARCH_PATHS'] = '   '
    end
    assert JobsStabilityIntegrated.inherit_test_search_context(@project)
    @tests.build_configurations.each do |configuration|
      JobsStabilityIntegrated::SEARCH_CONTEXT_KEYS.each do |key|
        assert_equal ['$(inherited)'], configuration.build_settings[key]
      end
    end
    refute JobsStabilityIntegrated.inherit_test_search_context(@project)
    @tests.name = TESTS + 'Other'
    refute JobsStabilityIntegrated.inherit_test_search_context(@project)
    @tests.name = TESTS
    @tests.build_configurations.first.name = 'Unmatched'
    assert_match(/App缺少测试对应配置/, assert_raises(RuntimeError) { JobsStabilityIntegrated.inherit_test_search_context(@project) }.message)
  end

  def test_installed_test_configuration_rejects_lost_app_context_until_merged
    build_fixture
    install_test_xcconfig
    JobsStabilityIntegrated::SEARCH_CONTEXT_KEYS.each do |key|
      @app.build_configurations.each { |configuration| configuration.build_settings[key] = ['$(inherited)', '"$(SRCROOT)/App Context With Spaces"'] }
      @project.save
      assert_match(/缺少App自有#{key}/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release]) }.message)
      JobsStabilityIntegrated.inherit_test_search_context(@project)
      @project.save
      assert_equal 2, JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release])['configurations'].size
    end
    @app.name = APP + 'Other'
    @project.save
    assert_match(/App缺少测试对应配置/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, ['Debug']) }.message)
  end

  def test_audit_only_without_installed_pods_remains_read_only
    build_fixture
    before = snapshot(@root)
    output = File.join(@temporary, 'audit-only')
    assert_equal 0, JobsStabilityIntegrated.run(['--audit-only', '--output', output], @root)
    assert_equal before, snapshot(@root)
    refute File.exist?(File.join(output, 'installed-test-configuration.json'))
  end

  def test_installed_test_configuration_rejects_explicit_search_override_without_inherited
    build_fixture
    install_test_xcconfig
    assert_equal 2, JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release])['configurations'].size
    @app.build_configurations.each do |configuration|
      configuration.build_settings['HEADER_SEARCH_PATHS'] = ['$(inherited)', '"$(SRCROOT)/App Headers"']
      configuration.build_settings['FRAMEWORK_SEARCH_PATHS'] = ['${inherited}', '"$(SRCROOT)/App Frameworks"']
    end
    JobsStabilityIntegrated.inherit_test_search_context(@project)
    %w[HEADER_SEARCH_PATHS FRAMEWORK_SEARCH_PATHS].each do |key|
      @tests.build_configurations.each do |configuration|
        configuration.build_settings[key].reject! { |value| %w[$(inherited) ${inherited}].include?(value) }
      end
      @project.save
      assert_match(/#{key}覆盖丢失inherited/, assert_raises(RuntimeError) { JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release]) }.message)
      JobsStabilityIntegrated.inherit_test_search_context(@project)
      @project.save
      assert_equal 2, JobsStabilityIntegrated.installed_test_configuration(@root, %w[Debug Release])['configurations'].size
    end
  end

  def test_rejects_duplicate_component_names
    build_fixture
    @manifest['components'] << @manifest['components'].first.dup
    assert_manifest_rejected(/重复/)
  end

  def test_rejects_unsupported_manifest_version
    build_fixture
    @manifest['version'] = 99
    assert_manifest_rejected(/版本/)
  end

  def test_rejects_duplicate_source_even_with_normalized_alias
    build_fixture
    @manifest['components'].first['test_sources'] << 'Tests/ComponentStability/Alpha/../Alpha/AlphaTests.m'
    @manifest['components'].first['expected_test_count'] = 4
    assert_manifest_rejected(/重复/)
  end

  def test_rejects_duplicate_xctest_class_across_components
    build_fixture
    row = @manifest['components'].first.dup
    row['name'] = 'DifferentComponent'
    copied = 'Tests/ComponentStability/Beta/OtherTests.m'
    write(copied, File.read(File.join(@root, row['test_sources'].first)))
    row['test_sources'] = [copied]
    row['support_sources'] = []
    row['resources'] = []
    @manifest['components'] << row
    assert_manifest_rejected(/重复 XCTest 类/)
  end

  def test_rejects_changed_method_count
    build_fixture
    @manifest['components'].first['expected_test_count'] = 3
    assert_manifest_rejected(/用例数变化/)
  end

  def test_rejects_incorrect_class_inventory
    build_fixture
    @manifest['components'].first['test_classes'] = ['InventedTests']
    assert_manifest_rejected(/类清单不一致/)
  end

  def test_rejects_missing_support_file
    build_fixture
    @manifest['components'].first['support_sources'] << 'Tests/ComponentStability/Missing.m'
    assert_manifest_rejected(/文件不存在/)
  end

  def test_rejects_parent_traversal_even_when_file_exists
    build_fixture
    File.write(File.join(@temporary, 'Outside.m'), '@implementation Outside @end')
    @manifest['components'].first['support_sources'] << '../Outside.m'
    assert_manifest_rejected(/路径越出工程/)
  end

  def test_rejects_symlink_escaping_project
    build_fixture
    outside = File.join(@temporary, 'Outside.m')
    File.write(outside, '@implementation Outside @end')
    File.symlink(outside, File.join(@root, 'Libs/Escape.m'))
    @manifest['components'].first['production_sources'] << 'Libs/Escape.m'
    assert_manifest_rejected(/软链接越出工程/)
  end

  def test_rejects_companion_header_symlink_outside_project
    build_fixture
    outside = File.join(@temporary, 'OutsideHeader.h')
    File.write(outside, '@interface AlphaTests : XCTestCase @end')
    File.symlink(outside, File.join(@root, 'Tests/ComponentStability/Alpha/AlphaTests.h'))
    assert_manifest_rejected(/软链接越出工程/)
  end

  def test_comments_and_strings_cannot_inflate_xctest_inventory
    build_fixture
    path = File.join(@root, 'Tests/ComponentStability/Alpha/AlphaTests.m')
    File.open(path, 'a') do |file|
      file.puts <<~'OBJC'
        /*
        @interface FakeCommentTests : XCTestCase @end
        - (void)testCommentSpoof { }
        */
        NSString *example = @"@interface FakeStringTests : XCTestCase";
      OBJC
    end
    assert_equal 2, JobsStabilityIntegrated.read_manifest(@root)['components'].first['expected_test_count']
    @manifest['components'].first['expected_test_count'] = 3
    assert_manifest_rejected(/用例数变化/)
  end

  def test_default_off_whitelist_does_not_compile_sibling_sources
    build_fixture
    actual = JobsStabilityIntegrated.target_sources(@project, @app)
    assert_includes actual, File.join(@root, 'App/main.m')
    assert_includes actual, File.join(@root, 'Libs/Production.m')
    refute_includes actual, File.join(@root, 'Libs/Excluded.m')
    refute_includes actual, File.join(@root, 'Tests/ComponentStability/Alpha/AlphaTests.m')
    assert JobsStabilityIntegrated.audit(@root)['valid']
  end

  def test_default_on_exclusions_preserve_enabled_sources
    build_fixture(default_on: true)
    actual = JobsStabilityIntegrated.target_sources(@project, @app)
    assert_includes actual, File.join(@root, 'Libs/Production.m')
    refute_includes actual, File.join(@root, 'Libs/Excluded.m')
    tests = JobsStabilityIntegrated.target_sources(@project, @tests)
    assert_includes tests, File.join(@root, 'Tests/ComponentStability/Alpha/AlphaTests.m')
    refute_includes tests, File.join(@root, 'Tests/ComponentStability/Skipped.m')
    assert JobsStabilityIntegrated.audit(@root)['valid']
  end

  def test_default_on_directory_exclusion_covers_descendants
    build_fixture(default_on: true)
    hidden = write('Libs/ExcludedFolder/Nested/Hidden.m', '@implementation HiddenProduction @end')
    @libs_group.exceptions.first.membership_exceptions << 'ExcludedFolder'
    @project.save
    actual = JobsStabilityIntegrated.target_sources(@project, @app)
    refute_includes actual, hidden
    assert_includes actual, File.join(@root, 'Libs/Production.m')
    assert JobsStabilityIntegrated.audit(@root)['valid']
  end

  def test_audit_rejects_test_source_missing_from_unit_target
    build_fixture
    @test_group.exceptions.first.membership_exceptions.delete('Alpha/Support.m')
    @project.save
    report = JobsStabilityIntegrated.audit(@root)
    refute report['valid']
    assert report['issues'].any? { |issue| issue.include?('测试未加入') && issue.include?('Support.m') }
  end

  def test_audit_rejects_tests_leaking_into_app
    build_fixture
    exception = @project.new(Xcodeproj::Project::Object::PBXFileSystemSynchronizedBuildFileExceptionSet)
    exception.target = @app
    exception.membership_exceptions = ['Alpha/AlphaTests.m']
    @test_group.exceptions << exception
    @project.save
    report = JobsStabilityIntegrated.audit(@root)
    refute report['valid']
    assert report['issues'].any? { |issue| issue.include?('测试误入主 App') }
  end

  def test_audit_rejects_existing_enabled_source_outside_project
    build_fixture
    File.write(File.join(@temporary, 'Outside.m'), '@implementation Outside @end')
    @libs_group.exceptions.first.membership_exceptions << '../../Outside.m'
    @project.save
    begin
      report = JobsStabilityIntegrated.audit(@root)
      refute report['valid'], 'An existing out-of-project compiler source must not pass the membership audit'
    rescue StandardError => error
      assert_match(/越|outside|escape/i, error.message)
    end
  end

  def test_prepare_plan_only_changes_temporary_project
    build_fixture
    assert_prepared_plan_isolated
  end

  def test_prepare_plan_supports_default_on_group_without_exceptions
    build_fixture(default_on: true, main_without_exceptions: true)
    assert_prepared_plan_isolated
  end

  def test_prepare_plan_supports_explicit_original_main
    build_fixture
    @main_group.exceptions.first.membership_exceptions = []
    reference = @project.main_group.new_file('App/main.m')
    reference.source_tree = 'SOURCE_ROOT'
    @app.source_build_phase.add_file_reference(reference)
    @project.save
    assert_prepared_plan_isolated
  end

  def test_prepare_plan_rejects_ambiguous_original_main_without_touching_sources
    build_fixture
    write('Libs/Other/main.m', 'int main(void) { return 0; }')
    @libs_group.exceptions.first.membership_exceptions << 'Other/main.m'
    @project.save
    before = snapshot(@root)
    error = assert_raises(StandardError) do
      JobsStabilityIntegrated.prepare_plan(@root, File.join(@temporary, 'ambiguous-plan'))
    end
    assert_match(/main.m 不唯一/, error.message)
    assert_equal before, snapshot(@root)
  end

  def test_prepare_plan_rejects_unresolved_bundle_identifier
    build_fixture
    @app.build_configurations.first.build_settings['PRODUCT_BUNDLE_IDENTIFIER'] = '$(UNRESOLVED_ID)'
    @project.save
    before = snapshot(@root)
    error = assert_raises(StandardError) do
      JobsStabilityIntegrated.prepare_plan(@root, File.join(@temporary, 'unresolved-signing'))
    end
    assert_match(/Bundle ID/, error.message)
    assert_equal before, snapshot(@root)
  end

  def assert_prepared_plan_isolated
    original = snapshot(@root)
    production = JobsStabilityIntegrated.target_sources(@project, @app).reject { |path| File.basename(path) == 'main.m' }
    plan = JobsStabilityIntegrated.prepare_plan(@root, File.join(@temporary, '验收 输出'))
    assert_equal original, snapshot(@root), 'source project, source code and signing inputs must remain byte-identical'
    refute plan['project'].start_with?(@root + '/')
    cloned = Xcodeproj::Project.open(plan.fetch('project'))
    app = cloned.targets.find { |target| target.name == APP }
    sources = JobsStabilityIntegrated.target_sources(cloned, app)
    assert sources.all? { |path| Pathname.new(path).absolute? && File.file?(path) }, "clone compiler inputs must resolve to existing absolute files: #{sources.inspect}"
    canonical = sources.map { |path| File.realpath(path) }
    refute_includes canonical, File.realpath(File.join(@root, 'App/main.m'))
    assert_includes canonical, File.realpath(File.join(plan.fetch('folder'), 'main.m'))
    assert_includes canonical, File.realpath(File.join(plan.fetch('folder'), 'JobsIntegratedTestAppDelegate.m'))
    assert_includes canonical, File.realpath(File.join(@root, 'Libs/Production.m'))
    generated = Dir.glob(File.join(plan.fetch('folder'), '*.m'))
    assert_equal (production + generated).map { |path| File.realpath(path) }.sort, canonical.sort, 'only the normal entry may be replaced; production compilation members must remain unchanged'
    assert_equal 1, sources.count { |path| File.basename(path) == 'main.m' }
    app.build_configurations.each do |configuration|
      entitlements = configuration.build_settings.fetch('CODE_SIGN_ENTITLEMENTS')
      assert entitlements.start_with?(plan.fetch('folder') + '/')
      values = Xcodeproj::Plist.read_from_path(entitlements)
      assert_equal 'org.jobs.IntegratedFixture', values['application-identifier']
      assert_equal ['org.jobs.IntegratedFixture'], values['keychain-access-groups']
      assert_equal true, values['get-task-allow']
      assert_equal '-', configuration.build_settings['CODE_SIGN_IDENTITY']
      assert File.file?(configuration.build_settings.fetch('INFOPLIST_FILE'))
      refute_includes File.read(configuration.build_settings.fetch('INFOPLIST_FILE')), 'OriginalBusinessSceneDelegate'
    end
    assert File.file?(File.join(plan.fetch('workspace'), 'contents.xcworkspacedata'))
    assert File.file?(File.join(plan.fetch('project'), 'xcshareddata/xcschemes', plan.fetch('scheme') + '.xcscheme'))
  end
end
