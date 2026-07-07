require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsTabBarCtrl'
  spec.version          = '1.0.0'
  spec.summary          = 'Custom tab bar controller component for Jobs projects.'
  spec.description      = <<-DESC
JobsTabBarCtrl is a local Objective-C UI component library that provides
a custom tab bar controller with horizontal paging, button layout rules,
chainable configuration, callbacks, background control and child scroll handling.
  DESC

  spec.homepage         = 'https://example.local/JobsTabBarCtrl'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsTabBarCtrl.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.source_files = [
    'JobsTabBarCtrlHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsTabBarCtrlHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsTabBarCtrl'

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'

  JobsPodspecKitForJobsTabBarCtrl.apply_standard_xcconfig(spec)

end
