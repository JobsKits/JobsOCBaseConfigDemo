require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsModelDSL.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsModelDSL'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C chain DSL categories for JobsModel.'
  spec.description      = 'JobsModelDSL centralizes Objective-C dot-syntax DSL categories for JobsModel model objects and protocol-backed model properties.'
  spec.homepage         = 'https://example.local/JobsModelDSL'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit',
    'UserNotifications',
    'CoreLocation',
    'AVFoundation'
  ]

  spec.dependency 'JobsModel'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsModelDSL.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsModelDSL.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsModelDSL.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsModelDSL'


  JobsPodspecKitForJobsModelDSL.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsModelDSL.apply_standard_xcconfig(spec)

end
