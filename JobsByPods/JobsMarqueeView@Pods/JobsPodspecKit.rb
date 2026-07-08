module JobsPodspecKitForJobsMarqueeView
  STANDARD_EXCLUDE_FILES = [
    '**/.DS_Store', '**/._*', '__MACOSX/**/*',
    '.git/**/*', '.svn/**/*', 'Pods/**/*', 'Podfile', 'Podfile.lock', '*.podspec',
    '*.xcodeproj/**/*', '*.xcworkspace/**/*', 'DerivedData/**/*', 'build/**/*',
    'Demo/**/*', 'Demos/**/*', 'Example/**/*', 'Examples/**/*',
    'Sample/**/*', 'Samples/**/*', 'Test/**/*', 'Tests/**/*',
    'README*', 'CHANGELOG*', 'LICENSE*', 'Docs/**/*', 'Documentation/**/*',
    'Screenshots/**/*', 'Images/**/*', 'fastlane/**/*', '.github/**/*',
    'tmp/**/*', 'temp/**/*', '*.log', '*.bak', '*.zip', '*.tar', '*.rar', '*.7z'
  ].freeze

  module_function

  def apply_standard_exclude_files(spec, exclude_files = nil)
    spec.exclude_files = exclude_files || STANDARD_EXCLUDE_FILES
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
