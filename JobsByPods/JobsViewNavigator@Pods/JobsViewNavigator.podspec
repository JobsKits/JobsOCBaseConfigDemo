require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsViewNavigator.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsViewNavigator'
  spec.version          = '1.0.0'
  spec.summary          = 'A lightweight Objective-C view stack navigator for UIView transitions.'
  spec.description      = <<-DESC
JobsViewNavigator is a local Objective-C UI component that manages a simple UIView-based
navigation stack, supporting push, pop and pop-to-root transitions with optional animation.
  DESC

  spec.homepage         = 'https://example.local/JobsViewNavigator'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsViewNavigator.apply_standard_exclude_files(spec)

  spec.dependency 'Masonry'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  JobsPodspecKitForJobsViewNavigator.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsViewNavigatorHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsViewNavigatorHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsViewNavigator'


  JobsPodspecKitForJobsViewNavigator.apply_standard_xcconfig(spec)

end
