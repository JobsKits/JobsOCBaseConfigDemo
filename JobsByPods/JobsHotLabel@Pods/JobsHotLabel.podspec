require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsHotLabel'
  spec.version          = '1.0.0'
  spec.summary          = 'Hot label UI components for Jobs projects.'
  spec.description      = <<-DESC
JobsHotLabel is a local Objective-C UI component library providing
single-line and multi-line hot label views, related config definitions,
collection view cell support, and a unified umbrella header for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsHotLabel'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsHotLabel.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.source_files        = [
    'JobsHotLabel.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsHotLabel.h',
    'Core/**/*.h'
  ]

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsHotLabel.apply_standard_xcconfig(spec)


end
