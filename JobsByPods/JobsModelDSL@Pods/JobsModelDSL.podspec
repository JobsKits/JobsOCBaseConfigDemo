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

  spec.default_subspecs = 'Core'
  spec.source_files        = 'JobsModelDSL.h'
  spec.public_header_files = 'JobsModelDSL.h'
  spec.header_dir          = 'JobsModelDSL'

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

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsModelDSL.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir          = 'JobsModelDSL'
  end

  JobsPodspecKitForJobsModelDSL.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsModelDSL.apply_standard_xcconfig(spec)

end
