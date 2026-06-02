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
  spec.default_subspecs = 'Core'

  # 本地 pod
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsClockView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCTimer'
    ss.dependency 'JobsOCProtocols'
  end

  JobsPodspecKitForJobsClockView.apply_standard_xcconfig(spec)

end
