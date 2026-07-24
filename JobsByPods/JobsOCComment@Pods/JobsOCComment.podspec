require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCComment'
  spec.version          = '1.0.0'
  spec.summary          = 'Comment list component for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCComment is a local Objective-C comment component. It provides a comment
model, configurable display mode, inline reply rendering, and a Toutiao-style
entry point that lets the host app open replies in a separate page.
  DESC

  spec.homepage         = 'https://example.local/JobsOCComment'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.source_files = [
    'JobsOCComment.h',
    'Core/**/*.{h,m,mm}',
    'Support/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCComment.h',
    'Core/**/*.h'
  ]
  spec.private_header_files = [
    'Support/**/*.h'
  ]
  spec.header_dir = 'JobsOCComment'

  spec.dependency 'Masonry'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCRefresher'

  JobsPodspecKitForJobsOCComment.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCComment.apply_standard_xcconfig(spec)

end
