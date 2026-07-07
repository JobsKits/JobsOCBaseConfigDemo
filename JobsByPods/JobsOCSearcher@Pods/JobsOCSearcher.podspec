require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCSearcher'
  spec.version          = '1.0.0'
  spec.summary          = 'Search view component for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCSearcher is a local Objective-C UI component library providing a search
input, configurable recommended searches, persistent history, single-item
deletion, and clear-history support for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsOCSearcher'
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
    'JobsOCSearcher.h',
    'Core/**/*.{h,m,mm}',
    'Support/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCSearcher.h',
    'Core/**/*.h'
  ]
  spec.private_header_files = [
    'Support/**/*.h'
  ]
  spec.header_dir = 'JobsOCSearcher'

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCSearcher.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCSearcher.apply_standard_xcconfig(spec)

end
