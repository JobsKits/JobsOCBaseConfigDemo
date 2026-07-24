require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCUILabelScrolling'
  spec.version          = '1.0.0'
  spec.summary          = 'CoreText powered overflow scrolling for UILabel.'
  spec.description      = <<-DESC
JobsOCUILabelScrolling keeps UILabel as the public API while rendering overflowing
single-line text through CoreText. It supports continuous marquee and ping-pong
motion, preserves attributed text, and is driven by JobsOCTimer.
  DESC
  spec.homepage         = 'https://example.local/JobsOCUILabelScrolling'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore',
    'CoreText'
  ]

  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'JobsOCUILabelScrolling.h',
    'Core/**/*.{h,m,mm}',
    'Support/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCUILabelScrolling.h',
    'Core/**/*.h'
  ]
  spec.private_header_files = 'Support/**/*.h'
  spec.header_dir = 'JobsOCUILabelScrolling'

  JobsPodspecKitForJobsOCUILabelScrolling.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCUILabelScrolling.apply_standard_xcconfig(spec)
end
