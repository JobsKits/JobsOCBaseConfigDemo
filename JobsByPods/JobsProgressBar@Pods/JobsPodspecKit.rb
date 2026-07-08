module JobsPodspecKitForJobsProgressBar
  STANDARD_EXCLUDE_FILES = [
    'Pods/**/*',
    'Example/**/*',
    'Tests/**/*',
    '.git/**/*',
    '.codegraph/**/*',
    'build/**/*',
    'DerivedData/**/*'
  ].freeze

  module_function

  def apply_standard_exclude_files(spec)
    spec.exclude_files = STANDARD_EXCLUDE_FILES
  end

  def apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/Headers/Public/**'
    }

    spec.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/Headers/Public/JobsProgressBar/**'
    }
  end
end
