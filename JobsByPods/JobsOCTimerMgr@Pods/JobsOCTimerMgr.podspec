require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCTimerMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C timer manager component for Jobs projects.'
  spec.description      = <<-DESC
  JobsOCTimerMgr is a local Objective-C component library that provides
centralized timer creation, lifecycle management, callback management, and
foreground/background policy handling for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsOCTimerMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'


    ss.dependency 'JobsMakes'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCTimer/Core'
    ss.dependency 'JobsOCProtocols/Core'
  end

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_xcconfig(spec)

end
