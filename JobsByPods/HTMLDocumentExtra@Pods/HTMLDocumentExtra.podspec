require_relative 'JobsPodspecKit'

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
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'HTMLReader'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'HTMLDocumentExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'HTMLDocumentExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'HTMLDocumentExtra'


  JobsPodspecKitForHTMLDocumentExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForHTMLDocumentExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/HTMLDocumentExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
