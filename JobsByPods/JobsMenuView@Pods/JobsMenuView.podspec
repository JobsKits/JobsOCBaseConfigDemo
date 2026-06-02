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
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsMenuView.apply_standard_exclude_files(spec)

  spec.subspec 'Support' do |ss|
    ss.source_files        = 'Support/**/*.{h,m,mm}'
    ss.public_header_files = 'Support/**/*.h'
  end

  spec.subspec 'Core' do |ss|
    ss.dependency 'JobsMenuView/Support'

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsBlock'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsByOCPods'
    ss.dependency 'JobsLinkageMenuView'

  end

  JobsPodspecKitForJobsMenuView.apply_standard_xcconfig(spec)

end
