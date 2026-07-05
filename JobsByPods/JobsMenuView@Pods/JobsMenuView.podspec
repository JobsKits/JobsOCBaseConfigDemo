require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsMenuView'
  spec.version          = '1.0.0'
  spec.summary          = 'Menu view component for Jobs projects.'
  spec.description      = <<-DESC
JobsMenuView is a local Objective-C UI component library that provides
menu view presentation and interaction support for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsMenuView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsMenuView.apply_standard_exclude_files(spec)

  spec.subspec 'Support' do |ss|
    ss.source_files        = 'Support/**/*.{h,m,mm}'
    ss.private_header_files = 'Support/**/*.h'
  end

  spec.source_files = [
    'JobsMenuViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsMenuViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsMenuView'

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsLinkageMenuView'

  JobsPodspecKitForJobsMenuView.apply_standard_xcconfig(spec)

end
