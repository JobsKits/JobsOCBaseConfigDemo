# frozen_string_literal: true

module JobsPodspecKitForJobsAppIconRibbon
  module_function

  def apply_standard_exclude_files(spec)
    spec.exclude_files = [
      '.git/**/*',
      '.github/**/*',
      '**/.DS_Store',
      'Pods/**/*',
      'Demo/**/*',
      'Example/**/*',
      'Tests/**/*',
      '**/*.xcodeproj/**/*',
      '**/*.xcworkspace/**/*',
      '**/*.zip'
    ]
  end

  def apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
    spec.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => "$(inherited) \"$(PODS_ROOT)/Headers/Public/#{spec.name}/**\""
    }
  end
end
