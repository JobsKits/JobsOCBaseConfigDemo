# 主工程集成形态的组件验收适配；测试契约与 Pod 形态共用进程、指纹和宿主权限校验。
require 'cgi'
require 'digest'
require 'fileutils'
require 'json'
require 'open3'
require 'optparse'
require 'pathname'
require 'time'
require 'xcodeproj'
require_relative '../jobs_stability_command.rb/jobs_stability_command'
require_relative '../jobs_stability_sources.rb/jobs_stability_sources'
require_relative '../jobs_stability_host_entitlements.rb/jobs_stability_host_entitlements'

module JobsStabilityIntegrated
  module_function

  MANIFEST = 'Tests/ComponentStability/manifest.json'.freeze
  APP = 'JobsOCBaseConfigDemo'.freeze
  TESTS = 'JobsOCBaseConfigDemoTests'.freeze

  def active?(root)
    File.directory?(File.join(root, 'Libs')) && File.file?(File.join(root, MANIFEST))
  end

  def local_file(root, relative)
    raise "非法项目相对路径：#{relative.inspect}" unless relative.is_a?(String) && !relative.empty?
    path = File.expand_path(relative, root)
    raise "路径越出工程：#{relative}" unless path.start_with?(root + '/')
    raise "文件不存在：#{relative}" unless File.file?(path)
    resolved = File.realpath(path)
    raise "软链接越出工程：#{relative}" unless resolved.start_with?(root + '/')
    path
  end

  def read_manifest(root)
    data = JSON.parse(File.read(local_file(root, MANIFEST)))
    raise '不支持的组件清单版本' unless data['version'] == 1
    rows = data.fetch('components')
    names = rows.map { |row| row.fetch('name') }
    raise '组件清单为空或重复' unless !names.empty? && names.uniq == names
    classes = []
    all_test_sources = []
    (rows + [data.fetch('host').merge('name' => 'Host')]).each do |row|
      %w[test_sources support_sources resources production_sources].each do |key|
        paths = Array(row[key]).map { |path| local_file(root, path) }
        raise "#{row['name']} #{key} 重复登记" unless paths.map { |path| File.realpath(path) }.uniq.size == paths.size
      end
      all_test_sources.concat(Array(row['test_sources']).map { |path| File.realpath(File.join(root, path)) })
      local_file(root, row['harness']) if row['harness']
      tests = Array(row['test_sources']).map { |path| objc_tokens(File.read(local_file(root, path))) }.join("\n")
      count = tests.scan(/^\s*-\s*\(\s*void\s*\)\s*test\w+\s*(?:\{|$)/).size
      raise "#{row['name']} 用例数变化，需重新盘点" unless count == row.fetch('expected_test_count')
      declarations = Array(row['test_sources']).map do |path|
        header = File.join(root, path.sub(/\.(?:m|mm)\z/, '.h'))
        File.file?(header) ? objc_tokens(File.read(local_file(root, header.delete_prefix(root + '/')))) : ''
      end.join("\n") + tests
      actual_classes = declarations.scan(/@interface\s+(\w+)\s*:\s*XCTestCase/).flatten.uniq
      raise "#{row['name']} XCTest 类清单不一致" unless actual_classes.sort == Array(row['test_classes']).sort
      classes.concat(actual_classes)
      raise "#{row['name']} 没有测试或生产 harness" if count.zero? && !row['harness']
    end
    raise '同一测试实现被多个组件重复登记' unless all_test_sources.uniq == all_test_sources
    raise '存在重复 XCTest 类' unless classes.uniq == classes
    data
  end

  def objc_tokens(source)
    source.gsub(%r{"(?:\\.|[^"\\])*"|//[^\n]*|/\*.*?\*/}m) { |token| token.gsub(/[^\n]/, ' ') }
  end

  def target_sources(project, target)
    files = target.source_build_phase.files_references.compact.map { |ref| ref.real_path.to_s }
    project.objects.grep(Xcodeproj::Project::Object::PBXFileSystemSynchronizedRootGroup).each do |group|
      directory = synchronized_path(project, group)
      enabled = target.file_system_synchronized_groups.include?(group)
      exceptions = group.exceptions.select { |entry| entry.respond_to?(:target) && entry.target == target }
        .flat_map(&:membership_exceptions)
      if enabled
        files.concat(Dir.glob(File.join(directory, '**', '*.{m,mm,c,cpp,swift}')).reject do |path|
          relative = Pathname.new(path).relative_path_from(Pathname.new(directory)).to_s
          exceptions.any? { |entry| relative == entry || relative.start_with?(entry + '/') }
        end)
      else
        files.concat(exceptions.select { |path| path.match?(/\.(?:m|mm|c|cpp|swift)\z/) }.map do |path|
          File.expand_path(path, directory)
        end)
      end
    end
    files.uniq
  end

  def synchronized_path(project, group)
    root = File.expand_path(project.root_object.project_dir_path.to_s, project.path.dirname)
    return File.expand_path(group.path) if group.source_tree == '<absolute>'
    parent = group.referrers.find { |object| object.respond_to?(:children) && object.children.include?(group) }
    base = group.source_tree == '<group>' && parent && parent.respond_to?(:real_path) ? parent.real_path.to_s : root
    File.expand_path(group.path, base)
  end

  def application_tests(root, manifest)
    project = Xcodeproj::Project.open(File.join(root, APP + '.xcodeproj'))
    target = project.targets.find { |item| item.name == TESTS }
    known = manifest.fetch('components').flat_map { |row| Array(row['test_classes']) } + manifest.fetch('host').fetch('test_classes')
    classes = []
    count = 0
    target_sources(project, target).grep(/\.(?:m|mm)\z/).each do |path|
      next unless File.file?(path)
      source = File.read(path)
      header = path.sub(/\.(?:m|mm)\z/, '.h')
      declarations = source + (File.file?(header) ? File.read(header) : '')
      names = declarations.scan(/@interface\s+(\w+)\s*:\s*XCTestCase/).flatten.uniq - known
      next if names.empty?
      classes.concat(names)
      count += source.scan(/^-\s*\(\s*void\s*\)\s*test\w+\s*(?:\{|$)/).size
    end
    { 'name' => 'ApplicationTests', 'test_classes' => classes.uniq, 'expected_test_count' => count }
  end

  def audit(root)
    root = File.realpath(root)
    manifest = read_manifest(root)
    project = Xcodeproj::Project.open(File.join(root, APP + '.xcodeproj'))
    app = project.targets.find { |target| target.name == APP }
    tests = project.targets.find { |target| target.name == TESTS }
    raise '主工程或 XCTest target 缺失' unless app && tests
    app_sources = target_sources(project, app)
    test_sources = target_sources(project, tests)
    issues = []
    expected = manifest.fetch('components').flat_map { |row| Array(row['test_sources']) + Array(row['support_sources']) }
    expected += Array(manifest.fetch('host')['test_sources']) + Array(manifest.fetch('host')['support_sources'])
    expected.each do |path|
      absolute = File.expand_path(path, root)
      issues << "测试未加入 #{TESTS}：#{path}" unless test_sources.include?(absolute)
      issues << "测试误入主 App：#{path}" if app_sources.include?(absolute)
    end
    manifest.fetch('components').each do |row|
      issues << "缺少真实生产映射：#{row['name']}" if Array(row['production_sources']).empty?
      Array(row['production_sources']).grep(/\.(?:m|mm|c|cpp)\z/).each do |path|
        absolute = File.expand_path(path, root)
        exception = manifest.fetch('production_membership_exceptions', {})[path]
        if exception
          valid_reason = exception['reason'].is_a?(String) && !exception['reason'].strip.empty?
          valid_target = case exception['target']
                         when 'unit-test'
                           test_sources.include?(absolute) && !app_sources.include?(absolute)
                         when 'excluded'
                           !app_sources.include?(absolute) && !test_sources.include?(absolute)
                         else
                           false
                         end
          issues << "生产成员例外无有效理由或实际归属不符：#{path}" unless valid_reason && valid_target
        else
          issues << "生产实现未加入 App：#{path}" unless app_sources.include?(absolute)
        end
      end
    end
    missing = (app_sources + test_sources).reject { |path| File.file?(path) }
    issues.concat(missing.map { |path| "构建成员不存在：#{path.delete_prefix(root + '/')}" })
    (app_sources + test_sources).select { |path| File.file?(path) }.each do |path|
      issues << "构建成员越出工程：#{path}" unless File.realpath(path).start_with?(root + '/')
    end
    {
      'schema_version' => 1, 'integration' => 'main-project', 'root' => root,
      'component_count' => manifest.fetch('components').size,
      'test_method_count' => manifest.fetch('components').sum { |row| row.fetch('expected_test_count') },
      'host_test_method_count' => manifest.fetch('host').fetch('expected_test_count'),
      'harness_count' => manifest.fetch('components').count { |row| row['harness'] },
      'manifest_sha256' => Digest::SHA256.file(File.join(root, MANIFEST)).hexdigest,
      'issues' => issues, 'valid' => issues.empty?
    }
  end

  def audit_cli(arguments, default_root)
    options = { root: default_root, output: '-' }
    OptionParser.new do |parser|
      parser.on('--root PATH') { |value| options[:root] = File.expand_path(value) }
      parser.on('--output PATH') { |value| options[:output] = value }
      parser.on('--baseline PATH') { |_value| raise '集成形态不使用 Pod 例外基线；以组件映射和实际 target 为准。' }
    end.parse!(arguments)
    result = audit(options[:root])
    text = JSON.pretty_generate(result) + "\n"
    if options[:output] == '-'
      puts text
    else
      FileUtils.mkdir_p(File.dirname(File.expand_path(options[:output])))
      File.write(options[:output], text)
    end
    result['valid'] ? 0 : 1
  rescue StandardError => error
    warn "配置门禁失败：#{error.message}"
    1
  end

  def escaped(value)
    CGI.escapeHTML(value.to_s)
  end

  # 副本仅更换测试宿主入口，原业务源码、工程和签名配置均不落盘修改。
  def prepare_plan(root, output)
    folder = File.join(output, 'IntegratedHost')
    FileUtils.mkdir_p(folder)
    project = Xcodeproj::Project.open(File.join(root, APP + '.xcodeproj'))
    app = project.targets.find { |target| target.name == APP }
    tests = project.targets.find { |target| target.name == TESTS }
    project.root_object.project_dir_path = root
    project.main_group.source_tree = '<absolute>'
    project.main_group.path = root
    app.shell_script_build_phases.dup.each do |phase|
      # 测试宿主不能被正常 App 的自动导出入口当作可分发产品保存。
      if phase.name == 'Save Build IPA' || phase.shell_script.to_s.include?('/save_device_ipa_after_build.command/')
        phase.remove_from_project
      end
    end
    group = project.main_group.new_group('Generated Stability Host')
    main = File.join(folder, 'main.m')
    File.write(main, <<~'OBJC')
      #import <UIKit/UIKit.h>
      #import "JobsIntegratedTestAppDelegate.h"
      int main(int argc, char *argv[]) {
          @autoreleasepool {
              return UIApplicationMain(argc, argv, nil, NSStringFromClass(JobsIntegratedTestAppDelegate.class));
          }
      }
    OBJC
    File.write(File.join(folder, 'JobsIntegratedTestAppDelegate.h'), <<~'OBJC')
      #import <UIKit/UIKit.h>
      @interface JobsIntegratedTestAppDelegate : UIResponder <UIApplicationDelegate>
      @property(nonatomic, strong) UIWindow *window;
      @end
    OBJC
    File.write(File.join(folder, 'JobsIntegratedTestAppDelegate.m'), <<~'OBJC')
      #import "JobsIntegratedTestAppDelegate.h"
      @implementation JobsIntegratedTestAppDelegate
      - (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)options {
          return YES;
      }
      @end
    OBJC
    File.write(File.join(folder, 'JobsIntegratedTestSceneDelegate.h'), <<~'OBJC')
      #import <UIKit/UIKit.h>
      @interface JobsIntegratedTestSceneDelegate : UIResponder <UIWindowSceneDelegate>
      @property(nonatomic, strong) UIWindow *window;
      @end
    OBJC
    File.write(File.join(folder, 'JobsIntegratedTestSceneDelegate.m'), <<~'OBJC')
      #import "JobsIntegratedTestSceneDelegate.h"
      @implementation JobsIntegratedTestSceneDelegate
      - (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)options {
          if (![scene isKindOfClass:UIWindowScene.class]) {
              return;
          }
          self.window = [[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene];
          self.window.rootViewController = [UIViewController new];
          [self.window makeKeyAndVisible];
      }
      @end
    OBJC
    source_members = target_sources(project, app)
    mains = source_members.select { |path| File.basename(path) == 'main.m' }
    raise '正常 App main.m 不唯一，拒绝猜测替换' unless mains.size == 1
    app.source_build_phase.files.dup.each do |build_file|
      build_file.remove_from_project if build_file.file_ref && File.expand_path(build_file.file_ref.real_path) == mains.first
    end
    project.objects.grep(Xcodeproj::Project::Object::PBXFileSystemSynchronizedRootGroup).each do |sync|
      directory = synchronized_path(project, sync)
      next unless mains.first.start_with?(directory + '/')
      relative = Pathname.new(mains.first).relative_path_from(Pathname.new(directory)).to_s
      exception = sync.exceptions.find { |entry| entry.respond_to?(:target) && entry.target == app }
      unless exception
        exception = project.new(Xcodeproj::Project::Object::PBXFileSystemSynchronizedBuildFileExceptionSet)
        exception.target = app
        sync.exceptions << exception
      end
      if app.file_system_synchronized_groups.include?(sync)
        exception.membership_exceptions = Array(exception.membership_exceptions) | [relative]
      else
        exception.membership_exceptions = Array(exception.membership_exceptions) - [relative]
      end
    end
    [main, File.join(folder, 'JobsIntegratedTestAppDelegate.m'), File.join(folder, 'JobsIntegratedTestSceneDelegate.m')].each do |path|
      ref = group.new_file(path)
      ref.path = path
      ref.source_tree = '<absolute>'
      app.source_build_phase.add_file_reference(ref)
    end
    app.build_configurations.each do |config|
      identifier = config.build_settings['PRODUCT_BUNDLE_IDENTIFIER']
      raise '宿主 Bundle ID 必须在实际 target 中明确配置' unless identifier.is_a?(String) && !identifier.empty? && !identifier.include?('$')
      entitlement = File.join(folder, "#{config.name}.entitlements")
      values = { 'application-identifier' => identifier, 'keychain-access-groups' => [identifier], 'get-task-allow' => true }
      Xcodeproj::Plist.write_to_path(values, entitlement)
      plist = File.join(folder, "#{config.name}-Info.plist")
      scenes = { 'UIApplicationSupportsMultipleScenes' => false, 'UISceneConfigurations' => { 'UIWindowSceneSessionRoleApplication' => [{ 'UISceneConfigurationName' => 'Stability', 'UISceneDelegateClassName' => 'JobsIntegratedTestSceneDelegate' }] } }
      original_plist = config.build_settings['INFOPLIST_FILE'].to_s.gsub('$(SRCROOT)', root).gsub('$(PROJECT_DIR)', root)
      values = File.file?(File.expand_path(original_plist, root)) ? Xcodeproj::Plist.read_from_path(File.expand_path(original_plist, root)) : {}
      values = values.merge('CFBundleIdentifier' => '$(PRODUCT_BUNDLE_IDENTIFIER)', 'CFBundleName' => '$(PRODUCT_NAME)', 'CFBundleExecutable' => '$(EXECUTABLE_NAME)', 'CFBundlePackageType' => 'APPL', 'CFBundleVersion' => '1', 'CFBundleShortVersionString' => '1.0', 'UILaunchScreen' => {}, 'LSRequiresIPhoneOS' => true, 'UIApplicationSceneManifest' => scenes)
      Xcodeproj::Plist.write_to_path(values, plist)
      config.build_settings['INFOPLIST_FILE'] = plist
      config.build_settings['GENERATE_INFOPLIST_FILE'] = 'YES'
      config.build_settings['INFOPLIST_KEY_UIApplicationSceneManifest_Generation'] = 'NO'
      config.build_settings['CODE_SIGN_ENTITLEMENTS'] = entitlement
      config.build_settings['CODE_SIGN_IDENTITY'] = '-'
      config.build_settings['CODE_SIGNING_ALLOWED'] = 'YES'
      config.build_settings['CODE_SIGNING_REQUIRED'] = 'YES'
      flags = Array(config.build_settings['OTHER_LDFLAGS'])
      flags.unshift('$(inherited)') unless flags.include?('$(inherited)')
      config.build_settings['OTHER_LDFLAGS'] = flags + ['-Xlinker', '-sectcreate', '-Xlinker', '__TEXT', '-Xlinker', '__entitlements', '-Xlinker', entitlement]
    end
    clone = File.join(folder, APP + '.xcodeproj')
    project.save(clone)
    reopened = Xcodeproj::Project.open(clone)
    scheme = Xcodeproj::XCScheme.new
    scheme.add_build_target(reopened.targets.find { |target| target.name == APP })
    scheme.add_test_target(reopened.targets.find { |target| target.name == TESTS })
    scheme.save_as(clone, 'JobsIntegratedStability', true)
    workspace = File.join(folder, 'Integrated.xcworkspace')
    FileUtils.mkdir_p(workspace)
    File.write(File.join(workspace, 'contents.xcworkspacedata'), <<~XML)
      <?xml version="1.0" encoding="UTF-8"?>
      <Workspace version="1.0"><FileRef location="group:#{APP}.xcodeproj"/><FileRef location="absolute:#{escaped(File.join(root, 'Pods/Pods.xcodeproj'))}"/></Workspace>
    XML
    { 'workspace' => workspace, 'project' => clone, 'folder' => folder, 'scheme' => 'JobsIntegratedStability' }
  end

  def host_audit(app)
    identifier, id_status = Open3.capture2e('/usr/bin/plutil', '-extract', 'CFBundleIdentifier', 'raw', '-o', '-', File.join(app, 'Info.plist'))
    executable, exe_status = Open3.capture2e('/usr/bin/plutil', '-extract', 'CFBundleExecutable', 'raw', '-o', '-', File.join(app, 'Info.plist'))
    verification, signature = Open3.capture2e('/usr/bin/codesign', '--verify', '--strict', '--verbose=2', app)
    compiled = JobsStabilityHostEntitlements.audit(File.join(app, executable.strip), bundle_identifier: identifier.strip)
    { 'app' => app, 'bundle_identifier' => identifier.strip, 'compiled_permissions' => compiled, 'verification' => verification, 'valid' => id_status.success? && exe_status.success? && signature.success? && compiled['valid'] }
  end

  def result_row(record, kind, name, configuration)
    row = record.fetch('results').reverse.find do |item|
      item.values_at('kind', 'name', 'configuration', 'source_fingerprint') == [kind, name, configuration, record['source_fingerprint']]
    end
    valid = row && row['exit_status'] == 0 && row['source_consistent'] == true &&
      row['process_status_collected'] == true && row['process_exit_status'] == 0 && row['process_signal'].nil? &&
      row['timed_out'] == false && row['log'].is_a?(String) && File.file?(row['log'])
    raise "缺少有效进程证据：#{kind}/#{name}/#{configuration}" unless valid
    row
  end

  def verify_test_receipt(record, component, configuration)
    row = result_row(record, 'test', component.fetch('name'), configuration)
    result_row(record, 'test_build', 'Libs', configuration)
    raise '测试构建关联证据缺失' unless row['test_build_record'].is_a?(Hash) && row['test_build_record']['source_fingerprint'] == record['source_fingerprint']
    text, status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', row.fetch('result_bundle'), '--compact')
    summary = JSON.parse(text)
    expected = component.fetch('expected_test_count')
    valid = status.success? && expected.positive? && summary['result'] == 'Passed' &&
      summary['totalTestCount'] == expected && summary['passedTests'] == expected && summary['failedTests'] == 0 && summary['skippedTests'] == 0
    raise "XCTest实际回执不符：#{component['name']}/#{configuration}" unless valid
    if component['name'] == 'JobsBaseUI'
      current = host_audit(row.fetch('host_signature').fetch('app'))
      previous = row.fetch('host_signature').fetch('compiled_permissions')
      raise '实际Keychain宿主权限或二进制已变化' unless current['valid'] && current.fetch('compiled_permissions')['binary_sha256'] == previous['binary_sha256']
    end
    expected
  end

  # 仅领取全矩阵的实际进程和 xcresult 证据；默认只预览，不能把静态盘点写成运行成功。
  def update_readme_results(options)
    root = File.realpath(options.fetch(:root))
    record = JSON.parse(File.read(options.fetch(:results)))
    manifest = read_manifest(root)
    names = manifest.fetch('components').map { |row| row.fetch('name') }
    raise '不是已完成的集成验收记录' unless record['integration'] == 'main-project' && record['completed'] == true
    # 支持按阶段定向补跑，完整性由下面逐项重读的实际回执决定。
    raise '组件集合记录不合法' unless record['selected_components'].is_a?(Array) && (record['selected_components'] - names).empty?
    raise '记录工程或安装模式不一致' unless File.realpath(record.fetch('root')) == root && record['installation_mode'] == JobsStabilitySources.installation_mode
    xcode, status = Open3.capture2e('xcodebuild', '-version')
    raise 'Xcode或磁盘源码已经变化' unless status.success? && record['xcode'] == xcode.strip && JobsStabilitySources.fingerprint(root, xcode, architecture: record['architecture']) == record['source_fingerprint']
    raise '组件盘点清单已变化' unless record['manifest_sha256'] == Digest::SHA256.file(File.join(root, MANIFEST)).hexdigest
    checked = audit(root)
    raise checked['issues'].join("\n") unless checked['valid']
    %w[Debug Release].each do |configuration|
      build = result_row(record, 'test_build', 'Libs', configuration)
      raise '集成构建成员证明不完整' unless build['members'].is_a?(Array) && build['members'].sort == names.sort
      result_row(record, 'app', APP, configuration)
    end
    executions = 0
    manifest.fetch('components').each do |component|
      if component['expected_test_count'].positive?
        configurations = component['name'] == 'JobsOCSnowflake' ? %w[Debug Release] : ['Debug']
        configurations.each { |configuration| executions += verify_test_receipt(record, component, configuration) }
      end
      result_row(record, 'harness', component['name'], 'macOS') if component['harness']
    end
    [manifest.fetch('host').merge('name' => 'Host'), application_tests(root, manifest)].each do |component|
      executions += verify_test_receipt(record, component, 'Debug') if component['expected_test_count'].positive?
    end
    path = File.join(root, 'Tests/ComponentStability/README.md')
    original = File.read(path)
    marker = /^当前验收结果：.*$/
    raise '结果句缺失或重复，拒绝覆盖README正文' unless original.scan(marker).size == 1
    sentence = "当前验收结果：组件与主工程 XCTest 实际执行 #{executions} 项、零失败零跳过；#{checked['harness_count']} 组 macOS 回归与 Debug／Release 构建通过，源码指纹 `#{record['source_fingerprint']}`，证据 `#{options[:results]}`。"
    puts "#{path}\n#{sentence}"
    if options[:apply]
      raise '回填前README发生并发变化' unless File.read(path) == original
      raise '回填前源码发生变化' unless JobsStabilitySources.fingerprint(root, xcode, architecture: record['architecture']) == record['source_fingerprint']
      File.write(path, original.sub(marker) { sentence })
    end
    0
  end

  def run(arguments, root)
    options = { phase: 'all', configurations: %w[Debug Release], names: [], output: File.join(root, 'work', 'JobsComponentsStability', Time.now.strftime('%Y%m%d-%H%M%S')), build_timeout: 1800, test_timeout: 600, simulator: ENV['JOBS_STABILITY_SIMULATOR'] }
    OptionParser.new do |parser|
      parser.banner = '主工程集成组件验收：CLI与Pod形态一致；--phase pods编译实际集成target。'
      parser.on('--phase PHASE', %w[all pods tests app]) { |value| options[:phase] = value }
      parser.on('--configuration NAME', %w[Debug Release]) { |value| options[:configurations] = [value] }
      parser.on('--architecture ARCH', %w[arm64 x86_64]) { |value| options[:architecture] = value }
      parser.on('--pod NAME') { |value| options[:names] << value }
      parser.on('--component NAME') { |value| options[:names] << value }
      parser.on('--simulator UDID') { |value| options[:simulator] = value }
      parser.on('--output PATH') { |value| options[:output] = File.expand_path(value) }
      parser.on('--build-timeout SECONDS', Float) { |value| options[:build_timeout] = value }
      parser.on('--test-timeout SECONDS', Float) { |value| options[:test_timeout] = value }
      parser.on('--batch-pods') { options[:batch_pods] = true }
      parser.on('--separate-test-builds') { options[:separate_test_builds] = true }
      parser.on('--audit-only') { options[:audit_only] = true }
    end.parse!(arguments)
    %i[build_timeout test_timeout].each { |key| raise "#{key}必须是有限正数" unless options[key].finite? && options[key].positive? }
    raise '输出目录不能覆盖生产目录或build/' unless options[:output].start_with?(File.join(root, 'work') + '/') || !options[:output].start_with?(root + '/')
    audit_result = audit(root)
    FileUtils.mkdir_p(options[:output])
    File.write(File.join(options[:output], 'configuration-audit.json'), JSON.pretty_generate(audit_result) + "\n")
    raise audit_result['issues'].join("\n") unless audit_result['valid']
    return 0 if options[:audit_only]
    manifest = read_manifest(root)
    rows = manifest.fetch('components')
    unknown = options[:names] - rows.map { |row| row['name'] }
    raise "未知组件：#{unknown.join(', ')}" unless unknown.empty?
    selected = options[:names].empty? ? rows : rows.select { |row| options[:names].include?(row['name']) }
    xcode, version_status = Open3.capture2e('xcodebuild', '-version')
    raise '无法查询Xcode版本' unless version_status.success?
    revision = JobsStabilitySources.fingerprint(root, xcode, architecture: options[:architecture])
    ensure_source = lambda do
      raise '源码/配置在验收期间改变，保留日志并拒绝通过' unless JobsStabilitySources.fingerprint(root, xcode, architecture: options[:architecture]) == revision
    end
    record_path = File.join(options[:output], 'results.json')
    record = { 'integration' => 'main-project', 'root' => root, 'source_fingerprint' => revision, 'xcode' => xcode.strip, 'architecture' => options[:architecture], 'installation_mode' => JobsStabilitySources.installation_mode, 'manifest_sha256' => audit_result['manifest_sha256'], 'selected_components' => selected.map { |row| row['name'] }, 'requested_phase' => options[:phase], 'configurations' => options[:configurations], 'completed' => false, 'results' => [] }
    if File.file?(record_path)
      previous = JSON.parse(File.read(record_path))
      raise '输出目录已属于另一工程，保留原记录' unless previous['root'].is_a?(String) && File.realpath(previous['root']) == root
      raise '原结果记录结构无效，保留原文件' unless previous['results'].is_a?(Array)
      record['results'] = previous['results']
    end
    save = lambda do
      File.write(record_path + '.tmp', JSON.pretty_generate(record) + "\n")
      File.rename(record_path + '.tmp', record_path)
    end
    execute = lambda do |kind, name, configuration, command, expected = nil, extra = {}|
      ensure_source.call
      log = File.join(options[:output], "#{kind}-#{name}-#{configuration}-#{Time.now.strftime('%H%M%S%L')}.log")
      puts "RUN #{kind} #{name} #{configuration}"
      result = File.open(log, 'w') do |output|
        output.puts(JSON.generate(command: command, source_fingerprint: revision))
        output.flush
        progress = kind == 'test_build' ? { progress_interval: 60 } : {}
        JobsStabilityCommand.run(command, chdir: root, output: output, timeout_seconds: kind == 'test' ? options[:test_timeout] : options[:build_timeout], **progress)
      end
      status = result[:status]
      consistent = JobsStabilitySources.fingerprint(root, xcode, architecture: options[:architecture]) == revision
      exit_status = result[:timed_out] ? 124 : (status && (status.exitstatus || 128 + status.termsig.to_i))
      row = { 'kind' => kind, 'name' => name, 'configuration' => configuration, 'command' => command, 'source_fingerprint' => revision, 'source_consistent' => consistent, 'process_status_collected' => result[:status_collected], 'process_exit_status' => status&.exitstatus, 'process_signal' => status&.termsig, 'process_pid' => result[:pid], 'timed_out' => result[:timed_out], 'termination_diagnostics' => result[:termination_diagnostics], 'seconds' => result[:seconds], 'exit_status' => consistent ? (exit_status || 79) : 75, 'log' => log }.merge(extra)
      if kind == 'test' && !result[:timed_out]
        bundle = command.fetch(command.index('-resultBundlePath') + 1)
        text, summary_status = Open3.capture2e('xcrun', 'xcresulttool', 'get', 'test-results', 'summary', '--path', bundle, '--compact')
        summary = JSON.parse(text) rescue {}
        row['result_bundle'] = bundle
        row['test_summary'] = summary
        valid = summary_status.success? && expected.to_i.positive? && summary['result'] == 'Passed' && summary['totalTestCount'] == expected && summary['passedTests'] == expected && summary['failedTests'] == 0 && summary['skippedTests'] == 0
        row['exit_status'] = 76 if row['exit_status'] == 0 && !valid
        row['validation_error'] = 'XCTest用例数、零失败/跳过或实际结果不符合冻结清单' unless valid
        if name == 'JobsBaseUI' && row['exit_status'] == 0
          app = File.join(options[:output], 'Products', "#{configuration}-iphonesimulator", APP + '.app')
          row['host_signature'] = host_audit(app)
          row['exit_status'] = 77 unless row['host_signature']['valid']
        end
      end
      record['results'] << row
      save.call
      ensure_source.call
      puts "#{row['exit_status'] == 0 ? 'PASS' : 'FAIL'} #{kind} #{name}: #{log}"
      raise "#{kind} #{name} 失败，退出码#{row['exit_status']}" unless row['exit_status'] == 0
      row
    end
    plan = prepare_plan(root, options[:output])
    base = lambda do |configuration, destination|
      args = ['xcodebuild', '-quiet', '-workspace', plan['workspace'], '-scheme', plan['scheme'], '-configuration', configuration, '-sdk', 'iphonesimulator', '-destination', destination, '-parallel-testing-enabled', 'NO', '-derivedDataPath', File.join(options[:output], 'DerivedData'), "SYMROOT=#{File.join(options[:output], 'Products')}", "OBJROOT=#{File.join(options[:output], 'Intermediates')}", "BUILD_DIR=#{File.join(options[:output], 'Products')}"]
      args += ["ARCHS=#{options[:architecture]}", 'ONLY_ACTIVE_ARCH=YES'] if options[:architecture]
      args
    end
    prepared = {}
    if %w[all pods tests].include?(options[:phase])
      options[:configurations].each do |configuration|
        destination = options[:simulator] ? "platform=iOS Simulator,id=#{options[:simulator]}" : 'generic/platform=iOS Simulator'
        args = base.call(configuration, destination).reject { |argument| argument == '-quiet' }
        row = execute.call('test_build', 'Libs', configuration, args + ['-showBuildTimingSummary', 'build-for-testing'], nil, { 'execution_mode' => 'integrated-shared-build', 'members' => rows.map { |component| component['name'] } })
        prepared[configuration] = row
      end
    end
    if %w[all tests].include?(options[:phase])
      raise '--simulator UDID必须给出具体测试目标' unless options[:simulator]
      test_rows = selected.select { |row| row['expected_test_count'].positive? }
      test_rows << manifest.fetch('host').merge('name' => 'Host')
      original = application_tests(root, manifest)
      test_rows << original if original['expected_test_count'].positive?
      test_rows.each do |component|
        configurations = component['name'] == 'JobsOCSnowflake' ? options[:configurations] : [options[:configurations].first]
        configurations.each do |configuration|
          bundle = File.join(options[:output], "#{component['name']}-#{configuration}-#{Time.now.strftime('%H%M%S%L')}.xcresult")
          args = base.call(configuration, "platform=iOS Simulator,id=#{options[:simulator]}")
          args += component.fetch('test_classes').map { |name| "-only-testing:#{TESTS}/#{name}" }
          args += ['-resultBundlePath', bundle, 'test-without-building']
          execute.call('test', component['name'], configuration, args, component['expected_test_count'], { 'execution_mode' => 'test-without-building', 'test_build_record' => prepared.fetch(configuration) })
        end
      end
      selected.each do |component|
        next unless component['harness']
        execute.call('harness', component['name'], 'macOS', ['ruby', local_file(root, component['harness'])])
      end
    end
    if %w[all app].include?(options[:phase])
      options[:configurations].each do |configuration|
        args = ['xcodebuild', '-quiet', '-workspace', File.join(root, APP + '.xcworkspace'), '-scheme', APP, '-configuration', configuration, '-sdk', 'iphonesimulator', '-destination', 'generic/platform=iOS Simulator', '-derivedDataPath', File.join(options[:output], 'AppDerivedData'), 'CODE_SIGNING_ALLOWED=NO']
        args += ["ARCHS=#{options[:architecture]}", 'ONLY_ACTIVE_ARCH=YES'] if options[:architecture]
        execute.call('app', APP, configuration, args + ['build'])
      end
    end
    ensure_source.call
    record['completed'] = true
    save.call
    puts "ALL REQUESTED CHECKS PASSED: #{record_path}"
    0
  rescue StandardError => error
    warn "验收失败：#{error.message}"
    1
  end
end
