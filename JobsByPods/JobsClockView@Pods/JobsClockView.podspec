require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsClockView'
  spec.version          = '1.0.0'
  spec.summary          = 'Analog clock view component for Jobs projects.'
  spec.description      = <<-DESC
JobsClockView is a local Objective-C UI component library providing an analog clock view
with dial, number labels, hour hand, minute hand and second hand support.
  DESC

  spec.homepage         = 'https://example.local/JobsClockView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  # 本地 pod
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsClockView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.source_files = [
    'JobsClockViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsClockViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsClockView'


  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsClockView.apply_standard_xcconfig(spec)

end
