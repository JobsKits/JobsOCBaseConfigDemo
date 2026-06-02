# ================================== Podfile ==================================
ENV['COCOAPODS_DISABLE_STATS'] = 'true'
require 'fileutils'

# ⚠️ 与 post_install 保持一致
platform :ios, '16.6'

source 'https://cdn.cocoapods.org/'

# 关键：恢复这段，避免 Assets.car 重复产物冲突
install! 'cocoapods',
  :deterministic_uuids => false,
  :disable_input_output_paths => true
# 如需的话，你也可以加上（可选）:
# , :generate_multiple_pod_projects => false

use_frameworks! :linkage => :static
inhibit_all_warnings!

# 预留钩子，给 Podfile.deps 调用
def cocoPodsConfig
  # 按需扩展
end

# 加载拆分出来的依赖定义
deps_path = File.join(__dir__, 'Podfile.deps')
unless File.exist?(deps_path)
  raise "[Podfile] ❌ 找不到 #{deps_path}，请确认 Podfile.deps 存在于工程根目录"
end
instance_eval(File.read(deps_path), deps_path, 1)

# 统一工程设置 & 把 Podfile.deps 显示到 Pods 分组里
post_install do |installer|

  # -------- 0. 修复 Xcode 26 Explicit Modules：移除 Darwin 私有头文件引用 --------
  # netinet6/in6.h 是 Darwin 私有头文件，Xcode 26 Explicit Modules 下不允许从模块外直接访问。
  # 相关符号已通过 <netinet/in.h> 间接包含，因此这里在 pod install 阶段自动删除该 import。
  Dir.glob(File.join(__dir__, 'Pods/**/*.{h,m,mm,c}')).each do |file|
    begin
      content = File.read(file)
      next unless content.include?('#import <netinet6/in6.h>')

      # CocoaPods 1.14+ 可能会把文件设为只读，写入前先临时加写权限
      was_writable = File.writable?(file)
      FileUtils.chmod('u+w', file) unless was_writable

      new_content = content.gsub(/^\s*#import\s+<netinet6\/in6\.h>\s*\n/, '')
      File.write(file, new_content)
      puts "[Podfile] Removed #import <netinet6/in6.h> from #{file}"

      # 如果原来是只读，写完恢复只读
      FileUtils.chmod('u-w', file) unless was_writable
    rescue => e
      puts "[Podfile] Warning: Failed to process #{file}: #{e.message}"
    end
  end
  # -------- 1. 宿主 App 工程设置 --------
  installer.aggregate_targets.each do |agg|
    user_project = agg.user_project
    user_project.native_targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['ENABLE_USER_SCRIPT_SANDBOXING'] = 'NO'
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.6'
      end
    end
    user_project.save
  end

  # -------- 2. Pods 工程最低系统版本统一 --------
  pods_project = installer.pods_project
  pods_project.targets.each do |t|
    t.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '16.6'
    end
  end

  # -------- 2.1 关键：Apple Silicon 模拟器不要排除 arm64 --------
  pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = ''
    end
  end
  
  # -------- 强制修复：Apple Silicon 模拟器不要排除 arm64（同时修 xcconfig 文件） --------
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      # 1) 修 build_settings
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'] = ''
      config.build_settings['EXCLUDED_ARCHS[sdk=iphonesimulator*]'.to_s] = ''

      # 2) 修对应的 xcconfig 文件内容（有些 pod 会把这行写进 xcconfig）
      xcconfig_path = config.base_configuration_reference&.real_path
      next unless xcconfig_path && File.exist?(xcconfig_path)

      text = File.read(xcconfig_path)
      new_text = text.gsub(/^EXCLUDED_ARCHS\[sdk=iphonesimulator\*\]\s*=\s*arm64\s*$/, "EXCLUDED_ARCHS[sdk=iphonesimulator*] =")
      if new_text != text
        File.open(xcconfig_path, 'w') { |f| f.write(new_text) }
      end
    end
  end

  # -------- 3. 在 Pods 分组里展示 Podfile.deps（Ruby 语法高亮） --------
  main_group   = pods_project.main_group
  deps_relpath = '../Podfile.deps'
  file_ref = main_group.find_file_by_path(deps_relpath) || main_group.new_file(deps_relpath)
  if file_ref.respond_to?(:explicit_file_type=)
    file_ref.explicit_file_type = 'text.script.ruby'
  end

  pods_project.save
end
