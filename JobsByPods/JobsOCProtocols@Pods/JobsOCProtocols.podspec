require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCProtocols'
  spec.version          = '1.0.0'
  spec.summary          = 'Protocols definitions for Jobs.'
  spec.description      = <<-DESC
JobsOCProtocols provides shared protocol definitions.
  DESC

  spec.homepage         = 'https://example.local/JobsOCProtocols'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}'

  JobsPodspecKitForJobsOCProtocols.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'WebKit',
    'PDFKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'SPAlertController'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'YTKNetwork'

  spec.source_files = [
    'JobsBaseProtocolHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsBaseProtocolHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCProtocols'


  JobsPodspecKitForJobsOCProtocols.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'PRODUCT_MODULE_NAME' => 'JobsOCProtocols',
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )
end
