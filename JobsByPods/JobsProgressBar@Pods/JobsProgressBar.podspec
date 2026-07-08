require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsProgressBar'
  spec.version          = '1.0.0'
  spec.summary          = 'Custom Objective-C progress bar with value labels, directions and dragging.'
  spec.description      = <<-DESC
JobsProgressBar provides a chainable Objective-C progress bar component with system-like progress display, direction switching, value labels, thumb dragging and auto progress.
  DESC

  spec.homepage         = 'https://example.local/JobsProgressBar'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsProgressBar.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'JobsProgressBarHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsProgressBarHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsProgressBar'

  JobsPodspecKitForJobsProgressBar.apply_standard_xcconfig(spec)
end
