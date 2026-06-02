module JobsPodspecKitForJobsBaseUI
  SUPPORT_SOURCE_EXTS = 'h,m,mm'.freeze
  SUPPORT_RESOURCE_EXTS = 'png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle,xcassets,strings,stringsdict,ttf,otf,mp4,aiff'.freeze

  SUPPORT_EXCLUDED_DIR_NAMES = [
    'Pods', 'Demo', 'Demos', 'Example', 'Examples', 'Sample', 'Samples',
    'Test', 'Tests', 'UnitTests', 'UITests', 'Docs', 'doc', 'Documentation',
    'Screenshots', 'Images', 'fastlane', 'tmp', 'temp', 'build', 'DerivedData',
    '__MACOSX'
  ].freeze

  SUPPORT_RESOURCE_DIR_SUFFIXES = ['.bundle', '.xcassets'].freeze

  STANDARD_EXCLUDE_FILES = [
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
  ].freeze

  module_function

  def build_support_context(podspec_dir:, support_dir: 'Support', support_dependencies: [], support_exclude_files: [])
    support_dependencies = [] if !defined?(support_dependencies) || support_dependencies.nil?
    support_exclude_files = [] if !defined?(support_exclude_files) || support_exclude_files.nil?

    support_glob_has_matches = lambda do |relative_glob|
      Dir.glob(File.join(podspec_dir, relative_glob)).any?
    end

    support_set_direct_files = lambda do |subspec, relative_dir|
      source_glob = "#{relative_dir}/*.{#{SUPPORT_SOURCE_EXTS}}"
      header_glob = "#{relative_dir}/*.h"
      resource_glob = "#{relative_dir}/*.{#{SUPPORT_RESOURCE_EXTS}}"
      has_source_files = support_glob_has_matches.call(source_glob)
      has_header_files = support_glob_has_matches.call(header_glob)
      has_resources = support_glob_has_matches.call(resource_glob)

      subspec.source_files = source_glob if has_source_files
      subspec.private_header_files = header_glob if has_header_files
      subspec.resources = resource_glob if has_resources
      subspec.exclude_files = support_exclude_files unless support_exclude_files.empty?
      subspec.preserve_paths = relative_dir unless has_source_files || has_header_files || has_resources
    end

    support_child_directory_names = lambda do |relative_dir|
      absolute_dir = File.join(podspec_dir, relative_dir)
      next [] unless Dir.exist?(absolute_dir)

      Dir.entries(absolute_dir).sort.select do |child_name|
        child_absolute_dir = File.join(absolute_dir, child_name)

        File.directory?(child_absolute_dir) &&
          child_name != '.' &&
          child_name != '..' &&
          !child_name.start_with?('.') &&
          !SUPPORT_EXCLUDED_DIR_NAMES.include?(child_name) &&
          !SUPPORT_RESOURCE_DIR_SUFFIXES.any? { |suffix| child_name.end_with?(suffix) }
      end
    end

    support_subspec_paths = []
    support_collect_subspec_paths = nil
    support_collect_subspec_paths = lambda do |relative_dir, pod_subspec_path|
      support_subspec_paths << pod_subspec_path

      support_child_directory_names.call(relative_dir).each do |child_name|
        support_collect_subspec_paths.call(
          File.join(relative_dir, child_name),
          "#{pod_subspec_path}/#{child_name}"
        )
      end
    end
    support_collect_subspec_paths.call(support_dir, 'Support') if Dir.exist?(File.join(podspec_dir, support_dir))
    support_subspec_paths.uniq!

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

    {
      :support_dir => support_dir,
      :support_subspec_paths => support_subspec_paths,
      :support_add_dependencies => support_add_dependencies,
      :support_set_direct_files => support_set_direct_files,
      :support_add_real_directory_subspecs => support_add_real_directory_subspecs
    }
  end

  def add_support_subspec(spec, support_context)
    support_dir = support_context[:support_dir]

    spec.subspec 'Support' do |ss|
      ss.header_mappings_dir = support_dir
      support_context[:support_add_dependencies].call(ss)
      support_context[:support_set_direct_files].call(ss, support_dir)
      support_context[:support_add_real_directory_subspecs].call(ss, support_dir)
    end
  end

  def add_dynamic_support_dependencies(subspec, spec, support_context)
    support_context[:support_subspec_paths].uniq.each do |support_subspec_path|
      next if support_subspec_path.start_with?('Support/Other/JobsNavBar')
      next if support_subspec_path.start_with?('Support/Other/JobsNavBarConfig')
      next if support_subspec_path.start_with?('Support/Other/JobsLinkageMenuView')
      next if support_subspec_path.start_with?('Support/Other/JobsMenuView')
      subspec.dependency "#{spec.name}/#{support_subspec_path}"
    end
  end

  def build_file_support_context(podspec_dir:, support_dir: 'Support', support_dependencies: [])
    source_exts = 'h,m,mm'
    resource_exts = 'png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle,xcassets'
    support_dependencies = [] if !defined?(support_dependencies) || support_dependencies.nil?

    glob_has_matches = lambda do |relative_glob|
      Dir.glob(File.join(podspec_dir, relative_glob)).any?
    end

    has_direct_pod_files = lambda do |relative_dir|
      source_glob = "#{relative_dir}/*.{#{source_exts}}"
      resource_glob = "#{relative_dir}/*.{#{resource_exts}}"

      glob_has_matches.call(source_glob) || glob_has_matches.call(resource_glob)
    end

    has_recursive_pod_files = lambda do |relative_dir|
      source_glob = "#{relative_dir}/**/*.{#{source_exts}}"
      resource_glob = "#{relative_dir}/**/*.{#{resource_exts}}"

      glob_has_matches.call(source_glob) || glob_has_matches.call(resource_glob)
    end

    child_directory_names = lambda do |relative_dir|
      absolute_dir = File.join(podspec_dir, relative_dir)
      next [] unless Dir.exist?(absolute_dir)

      Dir.entries(absolute_dir).sort.select do |child_name|
        child_relative_dir = File.join(relative_dir, child_name)
        child_absolute_dir = File.join(podspec_dir, child_relative_dir)

        File.directory?(child_absolute_dir) &&
          child_name != '.' &&
          child_name != '..' &&
          !child_name.start_with?('.') &&
          !SUPPORT_EXCLUDED_DIR_NAMES.include?(child_name) &&
          !SUPPORT_RESOURCE_DIR_SUFFIXES.any? { |suffix| child_name.end_with?(suffix) } &&
          has_recursive_pod_files.call(child_relative_dir)
      end
    end

    collect_file_subspec_paths = nil
    collect_file_subspec_paths = lambda do |relative_dir, pod_subspec_path, collector|
      collector << pod_subspec_path if has_direct_pod_files.call(relative_dir)

      child_directory_names.call(relative_dir).each do |child_name|
        child_relative_dir = File.join(relative_dir, child_name)
        child_pod_subspec_path = "#{pod_subspec_path}/#{child_name}"
        collect_file_subspec_paths.call(child_relative_dir, child_pod_subspec_path, collector)
      end
    end

    support_file_subspec_paths = []
    collect_file_subspec_paths.call(support_dir, 'Support', support_file_subspec_paths)

    {
      :support_dir => support_dir,
      :support_dependencies => support_dependencies,
      :support_file_subspec_paths => support_file_subspec_paths
    }
  end

  def add_file_support_dependencies(subspec, spec, file_support_context)
    file_support_context[:support_file_subspec_paths].each do |support_subspec_path|
      subspec.dependency "#{spec.name}/#{support_subspec_path}"
    end

    subspec.dependency "#{spec.name}/#{file_support_context[:support_dir]}" if file_support_context[:support_file_subspec_paths].empty?
  end

  def apply_standard_exclude_files(spec, exclude_files = nil)
    spec.exclude_files = exclude_files || STANDARD_EXCLUDE_FILES
  end

  def standard_pod_target_xcconfig
    {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  def standard_user_target_xcconfig(spec)
    {
      'HEADER_SEARCH_PATHS' => "$(inherited) \"$(PODS_ROOT)/Headers/Public/#{spec.name}/**\"",
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  def apply_standard_pod_target_xcconfig(spec, pod_target_xcconfig = nil)
    spec.pod_target_xcconfig = pod_target_xcconfig || standard_pod_target_xcconfig
  end

  def apply_standard_user_target_xcconfig(spec, user_target_xcconfig = nil)
    spec.user_target_xcconfig = user_target_xcconfig || standard_user_target_xcconfig(spec)
  end

  def apply_standard_xcconfig(spec, pod_target_xcconfig: nil, user_target_xcconfig: nil)
    apply_standard_pod_target_xcconfig(spec, pod_target_xcconfig)
    apply_standard_user_target_xcconfig(spec, user_target_xcconfig)
  end
end
