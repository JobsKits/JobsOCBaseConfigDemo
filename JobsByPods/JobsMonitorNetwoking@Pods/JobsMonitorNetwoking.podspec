require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name                  = 'JobsMonitorNetwoking'
  spec.version               = '1.0.0'
  spec.summary               = 'Objective-C network speed monitoring component for Jobs projects.'
  spec.description           = <<-DESC
JobsMonitorNetwoking is a local Objective-C component that calculates current
network traffic speed and displays it with JobsSuspendLab.
  DESC

  spec.homepage              = 'https://example.local/JobsMonitorNetwoking'
  spec.license               = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform              = :ios, '12.0'
  spec.requires_arc          = true
  spec.source                = { :path => '.' }
  spec.module_name           = 'JobsMonitorNetwoking'
  spec.static_framework      = true

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsMonitorNetwoking.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsMonitorNetwokingHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsMonitorNetwokingHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsMonitorNetwoking'

  spec.dependency 'JobsSuspend'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsMonitorNetwoking.apply_standard_xcconfig(spec)

end
