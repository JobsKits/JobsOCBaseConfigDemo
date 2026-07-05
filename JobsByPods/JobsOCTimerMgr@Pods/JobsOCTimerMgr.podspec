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

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsOCTimerMgr.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCTimerMgr.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCTimerMgr'


  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_xcconfig(spec)

end
