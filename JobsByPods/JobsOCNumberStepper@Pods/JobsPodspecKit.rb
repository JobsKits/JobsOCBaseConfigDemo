module JobsPodspecKitForJobsOCNumberStepper
  STANDARD_EXCLUDE_FILES = [
    '**/.DS_Store',
    '**/._*',
    '.git/**/*',
    'Pods/**/*',
    'Podfile',
    'Podfile.lock',
    '*.podspec',
    '*.xcodeproj/**/*',
    '*.xcworkspace/**/*',
    'DerivedData/**/*',
    'build/**/*',
    'Demo/**/*',
    'Demos/**/*',
    'Example/**/*',
    'Examples/**/*',
    'Sample/**/*',
    'Samples/**/*',
    'Test/**/*',
    'Tests/**/*',
    'README*',
    'CHANGELOG*',
    'LICENSE*',
    'Docs/**/*',
    'Documentation/**/*',
    '*.log',
    '*.bak',
    '*.zip'
  ].freeze

  module_function

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
