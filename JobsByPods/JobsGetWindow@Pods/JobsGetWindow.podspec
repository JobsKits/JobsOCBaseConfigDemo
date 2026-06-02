require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsGetWindow'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C helpers for getting the current window.'
  spec.description      = <<-DESC
JobsGetWindow is a lightweight Objective-C header-only library for retrieving the current active window in iOS projects.
  DESC

  spec.homepage         = 'https://example.local/JobsGetWindow'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  # 本地 pod
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsGetWindow.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsGetWindow.apply_standard_xcconfig(spec)


  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end
end
