require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsNetWorkTools'
  spec.version          = '1.0.0'
  spec.summary          = 'Network traffic monitor tools for Jobs projects.'
  spec.description      = <<-DESC
JobsNetWorkTools is a local Objective-C component library that provides network traffic
sampling and speed monitoring utilities, with callback support for upload and download
speed updates.
  DESC

  spec.homepage         = 'https://example.local/JobsNetWorkTools'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsNetWorkTools.apply_standard_exclude_files(spec)

  spec.default_subspecs = 'Core'

  spec.subspec 'Core' do |ss|
    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]

    ss.frameworks = [
      'Foundation',
      'UIKit'
    ]

    ss.libraries = [
      'z'
    ]

    ss.dependency 'JobsBlock'
    ss.dependency 'JobsModel'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCTimer'
    ss.dependency 'JobsOCProtocols'
  end

  JobsPodspecKitForJobsNetWorkTools.apply_standard_xcconfig(spec)

end
