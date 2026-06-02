Pod::Spec.new do |spec|

# Dynamic Support subspecs mirror the real Support directory tree, including empty directories.
support_dir = 'Support'
support_podspec_dir = File.expand_path(File.dirname(__FILE__))
support_source_exts = 'h,m,mm'
support_resource_exts = 'png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle,xcassets,strings,stringsdict,ttf,otf,mp4,aiff'
support_dependencies = [] if !defined?(support_dependencies) || support_dependencies.nil?
support_excluded_dir_names = [
  'Pods', 'Demo', 'Demos', 'Example', 'Examples', 'Sample', 'Samples',
  'Test', 'Tests', 'UnitTests', 'UITests', 'Docs', 'doc', 'Documentation',
  'Screenshots', 'Images', 'fastlane', 'tmp', 'temp', 'build', 'DerivedData',
  '__MACOSX'
]
support_resource_dir_suffixes = ['.bundle', '.xcassets']

support_glob_has_matches = lambda do |relative_glob|
  Dir.glob(File.join(support_podspec_dir, relative_glob)).any?
end

support_set_direct_files = lambda do |subspec, relative_dir|
  source_glob = "#{relative_dir}/*.{#{support_source_exts}}"
  header_glob = "#{relative_dir}/*.h"
  resource_glob = "#{relative_dir}/*.{#{support_resource_exts}}"
  has_source_files = support_glob_has_matches.call(source_glob)
  has_header_files = support_glob_has_matches.call(header_glob)
  has_resources = support_glob_has_matches.call(resource_glob)

  subspec.source_files = source_glob if has_source_files
  subspec.public_header_files = header_glob if has_header_files
  subspec.resources = resource_glob if has_resources
  subspec.preserve_paths = relative_dir unless has_source_files || has_header_files || has_resources
end

support_child_directory_names = lambda do |relative_dir|
  absolute_dir = File.join(support_podspec_dir, relative_dir)
  next [] unless Dir.exist?(absolute_dir)

  Dir.entries(absolute_dir).sort.select do |child_name|
    child_absolute_dir = File.join(absolute_dir, child_name)

    File.directory?(child_absolute_dir) &&
      child_name != '.' &&
      child_name != '..' &&
      !child_name.start_with?('.') &&
      !support_excluded_dir_names.include?(child_name) &&
      !support_resource_dir_suffixes.any? { |suffix| child_name.end_with?(suffix) }
  end
end

support_subspec_paths = []
support_collect_subspec_paths = lambda do |relative_dir, pod_subspec_path|
  support_subspec_paths << pod_subspec_path

  support_child_directory_names.call(relative_dir).each do |child_name|
    support_collect_subspec_paths.call(
      File.join(relative_dir, child_name),
      "#{pod_subspec_path}/#{child_name}"
    )
  end
end
support_collect_subspec_paths.call(support_dir, 'Support') if Dir.exist?(File.join(support_podspec_dir, support_dir))

support_add_dependencies = lambda do |subspec|
  support_dependencies.each do |dependency_name|
    subspec.dependency dependency_name
  end
end

support_add_real_directory_subspecs = nil
support_add_real_directory_subspecs = lambda do |parent_subspec, relative_dir|
  support_child_directory_names.call(relative_dir).each do |child_name|
    child_relative_dir = File.join(relative_dir, child_name)

    parent_subspec.subspec child_name do |child_subspec|
      child_subspec.header_mappings_dir = child_relative_dir
      support_add_dependencies.call(child_subspec)
      support_set_direct_files.call(child_subspec, child_relative_dir)
      support_add_real_directory_subspecs.call(child_subspec, child_relative_dir)
    end
  end
end
  spec.name         = 'ZBNetworking'
  spec.version      = '1.0.4'
  spec.summary      = 'The network request library adds caching policies.'
  spec.description  = <<-DESC
ZBNetworking is a lightweight networking library based on AFNetworking with request management and caching support.
  DESC

  spec.homepage     = 'https://github.com/Suzhibin/ZBNetworking'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Suzhibin' => 'szb2323@163.com' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.source       = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'AFNetworking' # https://github.com/AFNetworking/AFNetworking  ⚠️ 作者停止维护

  # 顶层总入口头文件
  spec.source_files = 'ZBNetworking.h'
  spec.public_header_files = 'ZBNetworking.h'

  # 按磁盘目录在 Pods 工程里分组显示
  spec.default_subspecs = 'Core'

  spec.subspec 'Support' do |ss|
    ss.header_mappings_dir = support_dir
    support_add_dependencies.call(ss)
    support_set_direct_files.call(ss, support_dir)
    support_add_real_directory_subspecs.call(ss, support_dir)
  end
  
  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    support_subspec_paths.each do |support_subspec_path|
      ss.dependency "#{spec.name}/#{support_subspec_path}"
    end

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.dependency 'ZBNetworking/Support/UIKit'
  end

  spec.exclude_files = [
    # macOS
    '**/.DS_Store',
    '**/._*',
    '__MACOSX/**/*',

    # Git / SVN
    '.git/**/*',
    '.svn/**/*',

    # CocoaPods
    'Pods/**/*',
    'Podfile',
    'Podfile.lock',
    '*.podspec',

    # Xcode 工程/工作区
    '*.xcodeproj/**/*',
    '*.xcworkspace/**/*',
    'DerivedData/**/*',
    'build/**/*',

    # Demo / Example / Test
    'Demo/**/*',
    'Demos/**/*',
    'Example/**/*',
    'Examples/**/*',
    'Sample/**/*',
    'Samples/**/*',
    'Test/**/*',
    'Tests/**/*',
    'UnitTests/**/*',
    'UITests/**/*',

    # 文档/截图
    'README*',
    'CHANGELOG*',
    'LICENSE*',
    'Docs/**/*',
    'doc/**/*',
    'Documentation/**/*',
    'Screenshots/**/*',
    'Images/**/*',

    # 脚本/CI
    'fastlane/**/*',
    '.github/**/*',
    '.gitlab/**/*',
    '.circleci/**/*',
    '.travis.yml',
    'Jenkinsfile',

    # 临时/缓存
    'tmp/**/*',
    'temp/**/*',
    '.tmp/**/*',
    '.temp/**/*',
    '*.log',
    '*.bak',
    '*.swp',

    # 压缩包
    '*.zip',
    '*.tar',
    '*.tar.gz',
    '*.tgz',
    '*.rar',
    '*.7z'
  ]

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ZBNetworking/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
