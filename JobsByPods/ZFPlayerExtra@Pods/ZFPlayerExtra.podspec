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
  spec.default_subspecs = 'Core'
  spec.source_files        = 'ZFPlayerExtra.h'
  spec.public_header_files = 'ZFPlayerExtra.h'
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'ZFPlayer'
  spec.dependency 'ZFPlayer/AVPlayer'
  spec.dependency 'ZFPlayer/ControlView'
  spec.dependency 'ZFPlayer/ijkplayer'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'

  spec.subspec 'Core' do |ss|
    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = [
      'Core/ZFDouYinControlView/ZFDouYinControlView.h'
    ]
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ZFPlayerExtra/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
