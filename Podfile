# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

require 'fileutils'
require 'pathname'
require 'securerandom'

jobs_pod_install_guard_path = File.join(
  __dir__,
  'ScriptsByPods',
  '【MacOS】📦Pod Install离线保护.command',
  'jobs_pod_install_offline_guard.rb'
)
require jobs_pod_install_guard_path
JobsPodInstallOfflineGuard.guard!(__dir__)

# ⚠️ 与 post_install 保持一致
platform :ios, '16.6'

source 'https://cdn.cocoapods.org/'

install! 'cocoapods',
  :deterministic_uuids => false,
  :disable_input_output_paths => true,
  :warn_for_unused_master_specs_repo => false

use_frameworks! :linkage => :static
inhibit_all_warnings!

deps_path = File.join(__dir__, 'Podfile.deps')
unless File.exist?(deps_path)
  raise "[Podfile] ❌ 找不到 #{deps_path}，请确认 Podfile.deps 存在于工程根目录"
end
instance_eval(File.read(deps_path), deps_path, 1)

# ===== ScriptsByPods: 脚本统一按 同名文件夹/同名脚本 取路径 =====
def scripts_by_pods_script_path(script_name)
  File.expand_path(File.join(__dir__, 'ScriptsByPods', script_name, script_name))
end

def jobs_pod_install_pure_mode?
  %w[
    JOBS_POD_INSTALL_PURE
    JOBS_POD_INSTALL_SKIP_EXTERNAL_SCRIPTS
  ].any? do |key|
    %w[1 true yes y on].include?(ENV.fetch(key, '').to_s.strip.downcase)
  end
end

def skip_optional_podfile_enhancement(label)
  return false unless jobs_pod_install_pure_mode?

  Pod::UI.puts "[#{label}] pure mode skip optional enhancement" if defined?(Pod::UI)
  true
end

# 统一执行 pod install 后置脚本；纯净模式和子脚本失败都不阻断安装结果。
def run_pod_install_post_scripts
  return if skip_optional_podfile_enhancement('PodInstallPostScripts')

  script_name = '【MacOS】📦Pod Install离线保护.command'
  script_path = scripts_by_pods_script_path(script_name)
  unless File.file?(script_path)
    Pod::UI.puts "[PodInstallPostScripts] skip, script not found: #{script_path}" if defined?(Pod::UI)
    return
  end

  succeeded = system(
    { 'JOBS_POD_INSTALL_HOOK' => '1', 'JOBS_SKIP_README' => '1' },
    '/bin/zsh',
    script_path,
    '--post-integrate',
    '--project-root',
    __dir__,
    chdir: __dir__
  )
  return if succeeded

  Pod::UI.puts '[PodInstallPostScripts] ⚠️ 存在失败项；pod install 主流程已完成' if defined?(Pod::UI)
rescue => e
  Pod::UI.puts "[PodInstallPostScripts] ⚠️ 后置脚本异常，已跳过：#{e.message}" if defined?(Pod::UI)
end

def configure_podfile_text_reference(file_ref, name, path)
  file_ref.name = name
  file_ref.path = path
  file_ref.source_tree = 'SOURCE_ROOT'
  file_ref.include_in_index = '1'
  file_ref.explicit_file_type = 'text.script.ruby'
  file_ref.last_known_file_type = 'text'
  file_ref.xc_language_specification_identifier = 'xcode.lang.ruby'
  file_ref.tab_width = '2'
  file_ref.indent_width = '2'
end

# 集成完成后从磁盘重开，避免复用 CocoaPods 的顺序 UUID 分配器。
def patch_pods_project_podfile_references(installer)
  project_path = installer.pods_project.path
  project_file = File.join(project_path, 'project.pbxproj')
  backup_path = "#{project_file}.repair-backup-#{SecureRandom.hex(8)}"
  FileUtils.cp(project_file, backup_path)

  pods_project = Xcodeproj::Project.open(project_path)
  root_uuid = pods_project.root_object.uuid
  root_group = pods_project.main_group
  wanted_files = {
    'Podfile' => '../Podfile',
    'Podfile.deps' => '../Podfile.deps'
  }

  wanted_files.each_with_index do |(name, path), index|
    expected_path = File.expand_path(path, project_path.dirname)
    raise "#{name} 文件不存在" unless File.file?(expected_path)

    existing_refs = pods_project.files.select do |ref|
      ref.path == path || ref.name == name
    end
    raise "#{name} 存在重复引用" if existing_refs.length > 1

    file_ref = existing_refs.first
    if file_ref && !root_group.files.include?(file_ref)
      raise "#{name} 引用不在 Pods 根组"
    end
    file_ref ||= root_group.new_file(path)
    configure_podfile_text_reference(file_ref, name, path)
    root_group.children.delete(file_ref)
    root_group.children.insert(index, file_ref)
  end

  pods_project.save
  reopened = Xcodeproj::Project.open(project_path)
  unless reopened.root_object.isa == 'PBXProject' && reopened.root_object.uuid == root_uuid
    raise 'Pods 工程根对象核验失败'
  end

  build_phase_refs = reopened.targets.flat_map(&:build_phases).flat_map do |phase|
    phase.respond_to?(:files_references) ? phase.files_references : []
  end
  wanted_files.each_with_index do |(name, path), index|
    refs = reopened.files.select { |ref| ref.path == path || ref.name == name }
    file_ref = refs.first
    reference_valid = refs.length == 1 &&
      reopened.main_group.children[index] == file_ref &&
      file_ref.explicit_file_type == 'text.script.ruby' &&
      file_ref.real_path.to_s == File.expand_path(path, project_path.dirname) &&
      !build_phase_refs.include?(file_ref)
    raise "#{name} 展示引用核验失败" unless reference_valid
  end
rescue StandardError => error
  begin
    FileUtils.cp(backup_path, project_file) if backup_path && File.file?(backup_path)
  rescue StandardError => restore_error
    warn "[PodfileRefs] Pods 工程恢复失败：#{restore_error.message}"
  end
  warn "[PodfileRefs] Xcode 展示引用维护失败，已跳过：#{error.message}"
ensure
  FileUtils.rm_f(backup_path) if backup_path
end

def strip_ijk_media_framework_ldflags(ldflags)
  ldflags
    .gsub(/-framework\s+"IJKMediaFramework"/, '')
    .gsub(/-framework\s+IJKMediaFramework/, '')
    .gsub(/\s+/, ' ')
    .strip
end

def patch_zfplayer_ijkplayer_for_simulator
  ijk_files = [
    File.join(__dir__, 'Pods', 'ZFPlayer', 'ZFPlayer', 'Classes', 'ijkplayer', 'ZFIJKPlayerManager.h'),
    File.join(__dir__, 'Pods', 'ZFPlayer', 'ZFPlayer', 'Classes', 'ijkplayer', 'ZFIJKPlayerManager.m')
  ]

  ijk_files.each do |path|
    next unless File.exist?(path)

    text = File.read(path)
    new_text = text

    if path.end_with?('.h') && !new_text.include?('#import <TargetConditionals.h>')
      new_text = new_text.sub('#import <Foundation/Foundation.h>', "#import <Foundation/Foundation.h>\n#import <TargetConditionals.h>")
    end

    if path.end_with?('.m') && !new_text.include?('#import <TargetConditionals.h>')
      new_text = new_text.sub('#import "ZFIJKPlayerManager.h"', "#import \"ZFIJKPlayerManager.h\"\n#import <TargetConditionals.h>")
    end

    new_text = new_text.gsub(
      '#if __has_include(<IJKMediaFramework/IJKMediaFramework.h>)',
      '#if !TARGET_OS_SIMULATOR && __has_include(<IJKMediaFramework/IJKMediaFramework.h>)'
    )

    next if new_text == text

    FileUtils.chmod('u+w', path) rescue nil
    File.write(path, new_text)
  end
end

def patch_zfplayer_netinet6_private_header
  zfplayer_root = File.join(__dir__, 'Pods', 'ZFPlayer', 'ZFPlayer')
  return unless Dir.exist?(zfplayer_root)

  changed_count = 0
  Dir.glob(File.join(zfplayer_root, '**', '*.{h,m,mm,c}')).each do |path|
    next unless File.file?(path)

    text = File.read(path)
    new_text = text.gsub(/^\s*#\s*import\s+<netinet6\/in6\.h>\s*\n/, '')
    next if new_text == text

    FileUtils.chmod('u+w', path) rescue nil
    File.write(path, new_text)
    changed_count += 1
  end

  Pod::UI.puts "[ZFPlayer] removed netinet6/in6.h imports from #{changed_count} files" if defined?(Pod::UI) && changed_count.positive?
end

def patch_reactiveobjc_metamacros_header(installer)
  reactive_root = File.join(__dir__, 'Pods', 'ReactiveObjC', 'ReactiveObjC')
  reactive_extobjc_metamacros = File.join(reactive_root, 'extobjc', 'RACmetamacros.h')
  reactive_root_metamacros = File.join(reactive_root, 'RACmetamacros.h')
  return unless File.exist?(reactive_extobjc_metamacros)

  FileUtils.chmod(0644, reactive_root_metamacros) rescue nil
  FileUtils.chmod(0755, reactive_root) rescue nil
  FileUtils.cp(reactive_extobjc_metamacros, reactive_root_metamacros)
  FileUtils.chmod(0644, reactive_root_metamacros) rescue nil

  %w[
    RACTuple.h
    RACKVOChannel.h
    NSObject+RACPropertySubscribing.h
  ].each do |filename|
    path = File.join(reactive_root, filename)
    next unless File.exist?(path)

    text = File.read(path)
    new_text = text
      .gsub('#import "extobjc/RACmetamacros.h"', '#import "RACmetamacros.h"')
      .gsub('#import <ReactiveObjC/extobjc/RACmetamacros.h>', '#import <ReactiveObjC/RACmetamacros.h>')
    next if new_text == text

    FileUtils.chmod('u+w', path) rescue nil
    File.write(path, new_text)
  end

  configure_reactiveobjc_header_copy_phase(installer)

end

# CocoaPods 生成配置修正，不改写任何供应商源码。
def configure_reactiveobjc_header_copy_phase(installer)
  reactive_objc_target = installer.pods_project.targets.find { |target| target.name == 'ReactiveObjC' }
  return unless reactive_objc_target&.headers_build_phase

  racmetamacros_build_files = reactive_objc_target.headers_build_phase.files.select do |build_file|
    file_ref = build_file.file_ref
    file_ref && File.basename(file_ref.path.to_s) == 'RACmetamacros.h'
  end
  return unless racmetamacros_build_files.size > 1

  # 已有兼容副本只调整生成的复制阶段；内容不同则拒绝静默选择。
  source_paths = racmetamacros_build_files.map { |file| file.file_ref.real_path.to_s }
  unless source_paths.all? { |path| File.file?(path) } && source_paths.map { |path| File.binread(path) }.uniq.size == 1
    raise 'ReactiveObjC RACmetamacros.h 输出冲突且内容不同，请核对实际依赖，不能自动覆盖'
  end

  keep_build_file = racmetamacros_build_files.find do |build_file|
    build_file.file_ref&.path.to_s.include?('/extobjc/')
  end || racmetamacros_build_files.first

  racmetamacros_build_files.each do |build_file|
    next if build_file == keep_build_file

    reactive_objc_target.headers_build_phase.remove_build_file(build_file)
  end
end

def patch_cocoapods_realpath_on_error_scripts
  target_support_dir = File.join(__dir__, 'Pods', 'Target Support Files')
  return unless Dir.exist?(target_support_dir)

  Dir.glob(File.join(target_support_dir, '**', '*.sh')).each do |script_path|
    text = File.read(script_path)
    new_text = text.gsub(
      'echo "$(realpath -mq "${0}"):$1: error: Unexpected failure"',
      'echo "$(realpath -q "${0}"):$1: error: Unexpected failure"'
    )
    next if new_text == text

    FileUtils.chmod('u+w', script_path) rescue nil
    File.write(script_path, new_text)
  end
end

def patch_xcframework_shell_script_invocations(installer)
  installer.pods_project.targets.each do |target|
    target.shell_script_build_phases.each do |phase|
      next unless phase.name.to_s.include?('Copy XCFrameworks')

      script = phase.shell_script.to_s
      new_script = script.gsub(
        /"(\$\{PODS_ROOT\}\/Target Support Files\/[^"]+-xcframeworks\.sh)"/,
        '/bin/sh "\1"'
      )
      phase.shell_script = new_script if new_script != script
    end
  end
end

def patch_cocoapods_app_icon_resource_scripts
  target_support_dir = File.join(__dir__, 'Pods', 'Target Support Files')
  return unless Dir.exist?(target_support_dir)

  actool_block = <<~'SH'.rstrip
    if [[ -n "${WRAPPER_EXTENSION}" ]] && [ "`xcrun --find actool`" ] && [ -n "${XCASSET_FILES:-}" ]
    then
      # Find all other xcassets (this unfortunately includes those of path pods and other targets).
      OTHER_XCASSETS=$(find -L "$PWD" -iname "*.xcassets" -type d)
      while read line; do
        if [[ $line != "${PODS_ROOT}*" ]]; then
          XCASSET_FILES+=("$line")
        fi
      done <<<"$OTHER_XCASSETS"
      printf "%s\0" "${XCASSET_FILES[@]}" | xargs -0 xcrun actool --output-format human-readable-text --notices --warnings --platform "${PLATFORM_NAME}" --minimum-deployment-target "${!DEPLOYMENT_TARGET_SETTING_NAME}" ${TARGET_DEVICE_ARGS} --compress-pngs --compile "${BUILT_PRODUCTS_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}"
    fi
  SH
  actool_block_pattern = /
    ^if\ \[\[\ -n\ "\$\{WRAPPER_EXTENSION\}"\ \]\]\ &&\ \[\ "`xcrun\ --find\ actool`"\ \]\ &&\ \[\ -n\ "\$\{XCASSET_FILES:-\}"\ \]\n
    then\n
    .*?
    ^fi$
  /mx

  Dir.glob(File.join(target_support_dir, '**', '*-resources.sh')).each do |script_path|
    text = File.read(script_path)
    next unless text.include?('xcrun actool')
    next unless text.include?('--app-icon "${ASSETCATALOG_COMPILER_APPICON_NAME}"')

    app_icon_block_pattern = /
      \s*APP_ICON_RESOURCE_ARGS=\(\)\n
      .*?
      \s*if\ \[\ -z\ \$\{ASSETCATALOG_COMPILER_APPICON_NAME\+x\}\ \];\ then\n
      .*?
      \s*fi
    /mx
    fallback_block_pattern = /
      \s*if\ \[\ -z\ \$\{ASSETCATALOG_COMPILER_APPICON_NAME\+x\}\ \];\ then\n
      .*?
      \s*fi
    /mx
    new_text = text.sub(actool_block_pattern) { actool_block }
    new_text = new_text.sub(app_icon_block_pattern) { "\n#{actool_block}" } if new_text == text
    new_text = new_text.sub(fallback_block_pattern) { "\n#{actool_block}" } if new_text == text
    next if new_text == text

    FileUtils.chmod('u+w', script_path) rescue nil
    File.write(script_path, new_text)
    Pod::UI.puts "[AppIconAssets] patched #{script_path}" if defined?(Pod::UI)
  end
end

def jobs_config_xcconfig_path(installer)
  installer.aggregate_targets.each do |aggregate_target|
    project = aggregate_target.user_project
    project_dir = File.dirname(project.path.to_s)
    file_ref = project.files.find { |ref| File.basename(ref.path.to_s) == 'JobsConfig.xcconfig' }
    next unless file_ref

    candidate = File.expand_path(file_ref.path.to_s, project_dir)
    return candidate if File.exist?(candidate)
  end

  Dir.glob(File.join(__dir__, '*', 'JobsConfig.xcconfig')).find { |path| File.file?(path) }
end

def aggregate_target_xcconfig?(xcconfig_path, aggregate_target_names)
  basename = File.basename(xcconfig_path)
  aggregate_target_names.any? { |name| basename.start_with?("#{name}.") }
end

def include_jobs_config_xcconfig(text, xcconfig_path, jobs_config_path)
  return text unless jobs_config_path && File.exist?(jobs_config_path)

  relative_path = Pathname
    .new(jobs_config_path)
    .relative_path_from(Pathname.new(File.dirname(xcconfig_path)))
    .to_s
  include_line = "#include \"#{relative_path}\""
  lines = text.lines.reject { |line| line.strip.match?(%r{\A#include\s+"[^"]*JobsConfig\.xcconfig"\z}) }
  (lines + ["\n", include_line + "\n"]).join
end

# 宿主声明由主工程负责；第三方同名裸资源复制后恢复 Jobs 自有声明。
def protect_jobs_host_privacy_manifest
  script_path = File.join(__dir__, 'Pods', 'Target Support Files', 'Pods-JobsOCBaseConfigDemo', 'Pods-JobsOCBaseConfigDemo-resources.sh')
  return unless File.file?(script_path)
  manifest_path = File.join(__dir__, 'JobsOCBaseConfigDemo', '启动配置', 'JobsPrivacy', 'PrivacyInfo.xcprivacy')
  raise "宿主隐私声明不存在: #{manifest_path}" unless File.file?(manifest_path)
  text = File.read(script_path).sub(/\n# JOBS_HOST_PRIVACY_BEGIN\n.*?# JOBS_HOST_PRIVACY_END\n?/m, '')
  text += <<~'SCRIPT'

    # JOBS_HOST_PRIVACY_BEGIN
    jobs_host_privacy_source="${PODS_ROOT}/../JobsOCBaseConfigDemo/启动配置/JobsPrivacy/PrivacyInfo.xcprivacy"
    if [ ! -f "$jobs_host_privacy_source" ]; then
      echo "error: Jobs host PrivacyInfo.xcprivacy is missing: $jobs_host_privacy_source"
      exit 1
    fi
    /bin/cp -f "$jobs_host_privacy_source" "${TARGET_BUILD_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/PrivacyInfo.xcprivacy"
    if [[ "${ACTION}" == "install" ]] && [[ "${SKIP_INSTALL}" == "NO" ]]; then
      /bin/cp -f "$jobs_host_privacy_source" "${INSTALL_DIR}/${UNLOCALIZED_RESOURCES_FOLDER_PATH}/PrivacyInfo.xcprivacy"
    fi
    # JOBS_HOST_PRIVACY_END
  SCRIPT
  File.write(script_path, text) if text != File.read(script_path)
end

# target UUID 稳定化后，CocoaPods 的顺序池可能从旧编号重填；仅本项目采用 Xcodeproj 防撞分配。
def protect_jobs_post_install_uuid_allocator(project)
  allocator = Xcodeproj::Project.instance_method(:generate_available_uuid_list)
  project.define_singleton_method(:generate_available_uuid_list) do |count = 100|
    allocator.bind(self).call(count)
  end
end

# 为 CocoaPods 自动测试宿主挂载 Jobs 自有 Scene delegate；兼容要求 Scene 生命周期的新 SDK。
def configure_jobs_stability_test_hosts(installer)
  delegate_root = File.join(File.expand_path(__dir__), 'Tests', 'JobsPodsStabilityHost', 'JobsPodsStabilitySceneDelegate')
  return unless File.file?(File.join(delegate_root, 'JobsPodsStabilitySceneDelegate.m'))

  project = installer.pods_project
  group = project.main_group.find_subpath('Jobs Stability Test Host', true)
  references = %w[JobsPodsStabilitySceneDelegate.h JobsPodsStabilitySceneDelegate.m].map do |filename|
    path = File.join(delegate_root, filename)
    reference = group.files.find { |file| file.display_name == filename } || group.new_file(path)
    reference.path = Pathname.new(path).relative_path_from(project.path.dirname).to_s
    reference.source_tree = 'SOURCE_ROOT'
    reference
  end
  project.targets.select { |target| target.name.start_with?('AppHost-') && target.name.end_with?('-Unit-Tests') }.each do |target|
    reference = references.last
    unless target.source_build_phase.files_references.include?(reference)
      target.source_build_phase.add_file_reference(reference)
    end
    target.build_configurations.each do |configuration|
      if target.name == 'AppHost-JobsBaseUI-Unit-Tests'
        entitlements = File.join(__dir__, 'Tests', 'JobsPodsStabilityHost', 'JobsBaseUIKeychain', 'JobsBaseUIKeychain.entitlements')
        raise "Keychain 测试宿主 entitlement 不存在: #{entitlements}" unless File.file?(entitlements)
        configuration.build_settings['CODE_SIGN_ENTITLEMENTS[sdk=iphonesimulator*]'] = Pathname.new(entitlements).relative_path_from(project.path.dirname).to_s
        configuration.build_settings['CODE_SIGN_IDENTITY[sdk=iphonesimulator*]'] = '-'
        configuration.build_settings['CODE_SIGNING_ALLOWED[sdk=iphonesimulator*]'] = 'YES'
        configuration.build_settings['AD_HOC_CODE_SIGNING_ALLOWED'] = 'YES'
        configuration.build_settings['CODE_SIGN_STYLE'] = 'Manual'
      end
      path = configuration.build_settings['INFOPLIST_FILE']
      next unless path
      path = File.expand_path(path, project.path.dirname)
      next unless File.file?(path)
      plist = Xcodeproj::Plist.read_from_path(path)
      plist['UIApplicationSceneManifest'] = {
        'UIApplicationSupportsMultipleScenes' => false,
        'UISceneConfigurations' => {
          'UIWindowSceneSessionRoleApplication' => [{
            'UISceneConfigurationName' => 'JobsStability',
            'UISceneClassName' => 'UIWindowScene',
            'UISceneDelegateClassName' => 'JobsPodsStabilitySceneDelegate'
          }]
        }
      }
      Xcodeproj::Plist.write_to_path(plist, path)
    end
  end
end

post_install do |installer|
  ijk_framework_binary = File.join(
    __dir__,
    'Pods',
    'IJKMediaFramework',
    'IJKMediaFramework',
    'Classes',
    'IJKMediaFramework.framework',
    'IJKMediaFramework'
  )
  needs_ijk_simulator_arch_workaround = File.exist?(ijk_framework_binary)
  simulator_excluded_archs = ''
  xcconfig_excluded_archs_line = "EXCLUDED_ARCHS[sdk=iphonesimulator*] = #{simulator_excluded_archs}"
  aggregate_target_names = installer.aggregate_targets.map { |aggregate_target| aggregate_target.name.to_s }
  jobs_config_path = jobs_config_xcconfig_path(installer)

  installer.aggregate_targets.each do |agg|
    user_project = agg.user_project
    user_project.native_targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.6'
        config.build_settings.delete('EXCLUDED_ARCHS[sdk=iphonesimulator*]')
      end
    end
    user_project.save
  end

  pods_project = installer.pods_project
  protect_jobs_post_install_uuid_allocator(pods_project)
  pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      if target.name == 'JobsDebugPanel' && config.name == 'Debug'
        config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] = ['$(inherited)', 'DEBUG=1']
      end
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.6'
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = simulator_excluded_archs
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'.to_s] = simulator_excluded_archs

      xcconfig_path = config.base_configuration_reference&.real_path
      next unless xcconfig_path && File.exist?(xcconfig_path)

      text = File.read(xcconfig_path)
      new_text = text.gsub(/^EXCLUDED_ARCHS\[sdk=iphonesimulator\*\]\s*=.*$/, xcconfig_excluded_archs_line)
      if aggregate_target_xcconfig?(xcconfig_path, aggregate_target_names)
        new_text = include_jobs_config_xcconfig(new_text, xcconfig_path, jobs_config_path)
      end

      if needs_ijk_simulator_arch_workaround
        match = new_text.match(/^OTHER_LDFLAGS\s*=\s*(.+)$/)
        if match
          all_ldflags = match[1].strip
          simulator_ldflags = strip_ijk_media_framework_ldflags(all_ldflags)
          simulator_ldflags = '$(inherited)' if simulator_ldflags.empty?

          new_text = new_text.gsub(/^OTHER_LDFLAGS\[sdk=iphoneos\*\]\s*=.*\n?/, '')
          new_text = new_text.gsub(/^OTHER_LDFLAGS\[sdk=iphonesimulator\*\]\s*=.*\n?/, '')
          new_text = new_text.sub(
            /^OTHER_LDFLAGS\s*=.*$/,
            "OTHER_LDFLAGS = #{simulator_ldflags}\nOTHER_LDFLAGS[sdk=iphoneos*] = #{all_ldflags}\nOTHER_LDFLAGS[sdk=iphonesimulator*] = #{simulator_ldflags}"
          )
        end
      end

      File.write(xcconfig_path, new_text) if new_text != text
    end
  end

  unless ENV['JOBS_POD_INSTALL_SKIP_VENDOR_PATCHES'] == '1'
    patch_zfplayer_ijkplayer_for_simulator if needs_ijk_simulator_arch_workaround
    patch_zfplayer_netinet6_private_header
    patch_reactiveobjc_metamacros_header(installer)
  end
  configure_reactiveobjc_header_copy_phase(installer)
  patch_cocoapods_realpath_on_error_scripts
  patch_xcframework_shell_script_invocations(installer)
  patch_cocoapods_app_icon_resource_scripts

  configure_jobs_stability_test_hosts(installer)
  pods_project.save

end

post_integrate do |installer|
  protect_jobs_host_privacy_manifest
  patch_pods_project_podfile_references(installer)
  run_pod_install_post_scripts
end
