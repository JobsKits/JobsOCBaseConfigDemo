module JobsPodspecKitForJobsOCExcel
  def self.apply_standard_exclude_files(spec)
    spec.exclude_files = [
      '**/.DS_Store',
      '**/.git/**',
      '**/Pods/**',
      '**/build/**',
      '**/DerivedData/**',
      '**/Demo/**',
      '**/Example/**',
      '**/Tests/**',
      '**/*.zip'
    ]
  end

  def self.apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/Headers/Public/**',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
    spec.user_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(inherited) ${PODS_ROOT}/Headers/Public/JobsOCExcel/**'
    }
  end
end
