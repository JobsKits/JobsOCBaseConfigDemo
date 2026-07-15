module JobsPodspecKitForJobsOCAudioRecorder
  def self.apply_standard_exclude_files(spec)
    spec.exclude_files = ['LICENSE', 'README.md', '**/*.command', '**/*.sh']
  end

  def self.apply_standard_xcconfig(spec)
    spec.pod_target_xcconfig = {
      'CLANG_ENABLE_MODULES' => 'YES',
      'DEFINES_MODULE' => 'YES',
      'APPLICATION_EXTENSION_API_ONLY' => 'NO'
    }
  end
end
