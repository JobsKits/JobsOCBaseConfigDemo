# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'

require 'fileutils'
require 'pathname'

# ⚠️ 与 post_install 保持一致
platform :ios, '16.6'

source 'https://cdn.cocoapods.org/'

install! 'cocoapods',
  :deterministic_uuids => false,
  :disable_input_output_paths => true

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

# ===== PodspecDependencyReport: pod install 后自动生成 Podspec 依赖分析报告 =====
def run_podspec_dependency_report_script
  return if skip_optional_podfile_enhancement('PodspecDependencyReport')

  script_name = '【MacOS】🔍查询Xcode工程依赖关系.command'
  script_path = scripts_by_pods_script_path(script_name)

  unless File.exist?(script_path)
    Pod::UI.puts "[PodspecDependencyReport] skip, script not found: #{script_path}" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[PodspecDependencyReport] chmod +x #{script_path}"
  unless system('/bin/chmod', '+x', script_path)
    Pod::UI.puts "[PodspecDependencyReport] ⚠️ chmod +x 执行失败，已跳过：#{script_path}" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[PodspecDependencyReport] 执行 #{script_path}"
  unless system(script_path, chdir: __dir__)
    Pod::UI.puts "[PodspecDependencyReport] ⚠️ 脚本执行失败或被中断；pod install 主流程已完成" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[PodspecDependencyReport] ✅ 依赖关系报告已生成"
end

# ===== CodeGraph: pod install 完成后在后台生成 CodeGraph 索引 =====
def run_codegraph_init_script
  return if skip_optional_podfile_enhancement('CodeGraph')

  script_name = 'codegraph_init.command'
  script_path = scripts_by_pods_script_path(script_name)

  unless File.exist?(script_path)
    Pod::UI.puts "[CodeGraph] skip, script not found: #{script_path}" if defined?(Pod::UI)
    return
  end

  Pod::UI.puts "[CodeGraph] chmod +x #{script_path}"
  unless system('/bin/chmod', '+x', script_path)
    Pod::UI.puts "[CodeGraph] ⚠️ chmod +x 执行失败，已跳过：#{script_path}" if defined?(Pod::UI)
    return
  end

  async_log = '/tmp/codegraph_init.async.log'
  pid_dir = File.join(__dir__, '.codegraph')
  pid_path = File.join(pid_dir, 'codegraph_init.pid')
  existing_pid = Integer(File.read(pid_path).strip, exception: false) if File.file?(pid_path)

  if existing_pid
    begin
      Process.kill(0, existing_pid)
      Pod::UI.puts "[CodeGraph] 后台同步已在运行，PID=#{existing_pid}；pod install 直接结束" if defined?(Pod::UI)
      return
    rescue Errno::ESRCH
      # PID 文件可以留存，进程不存在时直接启动新任务。
    rescue Errno::EPERM
      Pod::UI.puts "[CodeGraph] 后台同步已在运行，PID=#{existing_pid}；pod install 直接结束" if defined?(Pod::UI)
      return
    end
  end

  FileUtils.mkdir_p(pid_dir)
  log_io = File.open(async_log, 'w')
  pid = Process.spawn(
    { 'CODEGRAPH_AUTO_INIT' => '1', 'CODEGRAPH_EXPORT_ASYNC' => '0' },
    script_path,
    chdir: __dir__,
    in: File::NULL,
    out: log_io,
    err: log_io,
    pgroup: true
  )
  Process.detach(pid)
  File.write(pid_path, "#{pid}\n")
  Pod::UI.puts "[CodeGraph] 后台同步已启动，PID=#{pid}，日志=#{async_log}" if defined?(Pod::UI)
  Pod::UI.puts '[CodeGraph] pod install 主流程已完成，无需等待 CodeGraph' if defined?(Pod::UI)
rescue => e
  Pod::UI.puts "[CodeGraph] ⚠️ 后台任务启动失败，已跳过：#{e.message}" if defined?(Pod::UI)
ensure
  log_io&.close
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

def patch_pods_project_podfile_references(installer)
  pods_project = installer.pods_project
  root_group = pods_project.main_group
  wanted_files = {
    'Podfile' => '../Podfile',
    'Podfile.deps' => '../Podfile.deps'
  }

  wanted_files.each do |name, path|
    existing_refs = pods_project.files.select do |ref|
      ref.path == path || ref.name == name
    end

    root_refs = root_group.children.grep(Xcodeproj::Project::Object::PBXFileReference)
    file_ref = root_refs.find { |ref| ref.path == path || ref.name == name }
    file_ref ||= root_group.new_file(path)

    configure_podfile_text_reference(file_ref, name, path)

    existing_refs.each do |ref|
      next if ref == file_ref

      ref.remove_from_project
    end

    root_group.children.delete(file_ref)
    insert_index = name == 'Podfile' ? 0 : 1
    root_group.children.insert(insert_index, file_ref)
  end

  pods_project.save
rescue => e
  Pod::UI.puts "[PodfileRefs] skip: #{e}" if defined?(Pod::UI)
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

  reactive_objc_target = installer.pods_project.targets.find { |target| target.name == 'ReactiveObjC' }
  return unless reactive_objc_target&.headers_build_phase

  racmetamacros_build_files = reactive_objc_target.headers_build_phase.files.select do |build_file|
    file_ref = build_file.file_ref
    file_ref && File.basename(file_ref.path.to_s) == 'RACmetamacros.h'
  end
  return unless racmetamacros_build_files.size > 1

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
  pods_project.targets.each do |target|
    target.build_configurations.each do |config|
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

  patch_zfplayer_ijkplayer_for_simulator if needs_ijk_simulator_arch_workaround
  patch_zfplayer_netinet6_private_header
  patch_reactiveobjc_metamacros_header(installer)
  patch_cocoapods_realpath_on_error_scripts
  patch_xcframework_shell_script_invocations(installer)
  patch_cocoapods_app_icon_resource_scripts

  pods_project.save

  run_podspec_dependency_report_script
end

post_integrate do |installer|
  if skip_optional_podfile_enhancement('PodfileRefs')
    Pod::UI.puts '[PodfileRefs] pure mode keeps CocoaPods generated project references unchanged' if defined?(Pod::UI)
  else
    patch_pods_project_podfile_references(installer)
  end
  run_codegraph_init_script
end
