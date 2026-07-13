require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'LMJDropdownMenuExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'LMJDropdownMenu helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for LMJDropdownMenu convenience APIs.'
  spec.homepage         = 'https://example.local/LMJDropdownMenuExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'LMJDropdownMenuExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'LMJDropdownMenu'
  spec.dependency 'JobsOCDSL'

  spec.source_files = [
    'LMJDropdownMenuExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'LMJDropdownMenuExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'LMJDropdownMenuExtra'


  JobsPodspecKitForLMJDropdownMenuExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForLMJDropdownMenuExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/LMJDropdownMenuExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
