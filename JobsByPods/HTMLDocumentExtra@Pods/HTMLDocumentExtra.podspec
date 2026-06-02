Pod::Spec.new do |spec|
  spec.name             = 'HTMLDocumentExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'HTMLReader document helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for HTMLDocument convenience APIs.'
  spec.homepage         = 'https://example.local/HTMLDocumentExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'HTMLDocumentExtra'
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'
  spec.source_files        = 'HTMLDocumentExtra.h'
  spec.public_header_files = 'HTMLDocumentExtra.h'
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'HTMLReader'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

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
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/HTMLDocumentExtra/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
