require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsBitsMonitor'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C bits monitor components for Jobs projects.'
  spec.description      = <<-DESC
JobsBitsMonitor is a local Objective-C component library that provides
bits monitor related functionality for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsBitsMonitor'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsBitsMonitor.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsBitsMonitor.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsBitsMonitor.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsBitsMonitor'

  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsNetWorkTools'
  spec.dependency 'ZWPullMenuView'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsSuspend'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'

  JobsPodspecKitForJobsBitsMonitor.apply_standard_xcconfig(spec)

end
