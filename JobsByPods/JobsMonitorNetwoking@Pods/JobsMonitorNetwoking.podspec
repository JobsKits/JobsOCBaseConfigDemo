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
  spec.default_subspecs      = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsMonitorNetwoking.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files          = 'Core/**/*.{h,m,mm}'
    ss.public_header_files   = 'Core/**/*.h'
    ss.header_mappings_dir   = 'Core'

    ss.dependency 'JobsSuspend'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsBlock'
  end

  JobsPodspecKitForJobsMonitorNetwoking.apply_standard_xcconfig(spec)

end
