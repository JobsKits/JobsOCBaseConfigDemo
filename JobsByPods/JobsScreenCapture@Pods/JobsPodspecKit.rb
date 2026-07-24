module JobsPodspecKitForJobsScreenCapture
  STANDARD_EXCLUDE_FILES = [
    '**/.DS_Store', '**/._*', '__MACOSX/**/*',
    '.git/**/*', '.svn/**/*',
    'Pods/**/*', 'Podfile', 'Podfile.lock', '*.podspec',
    '*.xcodeproj/**/*', '*.xcworkspace/**/*', 'DerivedData/**/*', 'build/**/*',
    'Demo/**/*', 'Demos/**/*', 'Example/**/*', 'Examples/**/*',
    'Test/**/*', 'Tests/**/*', 'UnitTests/**/*', 'UITests/**/*',
    'README*', 'CHANGELOG*', 'LICENSE*', 'Docs/**/*', 'Documentation/**/*',
    'Screenshots/**/*', 'Images/**/*', 'fastlane/**/*', '.github/**/*',
    'tmp/**/*', 'temp/**/*', '*.log', '*.bak', '*.swp',
    '*.zip', '*.tar', '*.tar.gz', '*.tgz', '*.rar', '*.7z'
  ].freeze

  module_function

  def build_support_context(podspec_dir:, support_dir: 'Support', support_dependencies: [])
    {
      :podspec_dir => podspec_dir,
      :support_dir => support_dir,
      :support_dependencies => support_dependencies || []
    }
  end

  def add_support_subspec(spec, support_context)
    support_dir = support_context[:support_dir]
    absolute_support_dir = File.join(support_context[:podspec_dir], support_dir)
    return unless Dir.exist?(absolute_support_dir)

    spec.subspec 'Support' do |ss|
      ss.header_mappings_dir = support_dir
      ss.source_files = "#{support_dir}/**/*.{h,m,mm}"
      ss.private_header_files = "#{support_dir}/**/*.h"
      support_context[:support_dependencies].each do |dependency_name|
        ss.dependency dependency_name
      end
    end
  end

  def apply_standard_exclude_files(spec)
    spec.exclude_files = STANDARD_EXCLUDE_FILES
  end

  def apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
    spec.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => "$(inherited) \"$(PODS_ROOT)/Headers/Public/#{spec.name}/**\"",
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end
end
