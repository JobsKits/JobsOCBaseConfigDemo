Pod::Spec.new do |spec|
  spec.name             = 'TextureExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'Texture DSL helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for AsyncDisplayKit / Texture DSL extensions.'
  spec.homepage         = 'https://example.local/TextureExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '14.0'
  spec.requires_arc     = true
  spec.module_name      = 'TextureExtra'
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'
  spec.source_files        = 'TextureExtra.h'
  spec.public_header_files = 'TextureExtra.h'
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'Texture'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/TextureExtra/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
