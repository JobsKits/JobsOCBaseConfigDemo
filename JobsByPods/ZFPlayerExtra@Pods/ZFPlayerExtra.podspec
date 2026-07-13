require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'ZFPlayerExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'ZFPlayer helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for ZFPlayer convenience APIs and custom control views.'
  spec.homepage         = 'https://example.local/ZFPlayerExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'ZFPlayerExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'ZFPlayer'
  spec.dependency 'ZFPlayer/AVPlayer'
  spec.dependency 'ZFPlayer/ControlView'
  spec.dependency 'ZFPlayer/ijkplayer'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBaseUI'

  spec.source_files = [
    'ZFPlayerExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'ZFPlayerExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'ZFPlayerExtra'

  spec.private_header_files = 'Core/ZFPlayerExtra/ZFPlayerExtra.h'


  JobsPodspecKitForZFPlayerExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForZFPlayerExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ZFPlayerExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
