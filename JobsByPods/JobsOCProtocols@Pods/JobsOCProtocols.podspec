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

  spec.source_files        = 'JobsBaseProtocolHeader.h'
  spec.public_header_files = 'JobsBaseProtocolHeader.h'

  spec.default_subspecs = 'Core'

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

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir          = 'JobsOCProtocols'
  end

  JobsPodspecKitForJobsOCProtocols.apply_standard_pod_target_xcconfig(
    spec,
    {
      'PRODUCT_MODULE_NAME' => 'JobsOCProtocols',
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )
end
