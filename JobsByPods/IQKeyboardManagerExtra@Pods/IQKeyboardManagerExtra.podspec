require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'IQKeyboardManagerExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'IQKeyboardManager helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for IQKeyboardManager convenience APIs.'
  spec.homepage         = 'https://example.local/IQKeyboardManagerExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'IQKeyboardManagerExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'IQKeyboardManager'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'IQKeyboardManagerExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'IQKeyboardManagerExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'IQKeyboardManagerExtra'


  JobsPodspecKitForIQKeyboardManagerExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForIQKeyboardManagerExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/IQKeyboardManagerExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
