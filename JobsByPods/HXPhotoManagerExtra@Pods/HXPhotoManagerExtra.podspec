require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'HXPhotoManagerExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'HXPhotoManager helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for HXPhotoManager convenience APIs.'
  spec.homepage         = 'https://example.local/HXPhotoManagerExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'HXPhotoManagerExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'HXPhotoPickerObjC'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'HXPhotoManagerExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'HXPhotoManagerExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'HXPhotoManagerExtra'


  JobsPodspecKitForHXPhotoManagerExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForHXPhotoManagerExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/HXPhotoManagerExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
