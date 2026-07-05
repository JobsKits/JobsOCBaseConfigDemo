require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'FMDatabaseExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'FMDB manager helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for FMDatabase manager convenience APIs.'
  spec.homepage         = 'https://example.local/FMDatabaseExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'FMDatabaseExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  
  spec.dependency 'FMDB'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCRuntimeKits'

  spec.source_files = [
    'FMDatabaseExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'FMDatabaseExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'FMDatabaseExtra'


  JobsPodspecKitForFMDatabaseExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForFMDatabaseExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/FMDatabaseExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
