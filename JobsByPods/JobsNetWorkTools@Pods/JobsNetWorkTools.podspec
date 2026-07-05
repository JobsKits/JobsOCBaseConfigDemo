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


  spec.source_files = [
    'JobsNetWorkToolsHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsNetWorkToolsHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsNetWorkTools'


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.libraries = [
    'z'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsNetWorkTools.apply_standard_xcconfig(spec)

end
