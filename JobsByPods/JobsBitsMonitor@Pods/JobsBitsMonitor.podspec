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
  spec.default_subspecs = 'Core'

  if File.exist?(File.join(__dir__, 'JobsBitsMonitor.h'))
    spec.source_files = 'JobsBitsMonitor.h'
    spec.public_header_files = 'JobsBitsMonitor.h'
  end

  spec.header_dir = 'JobsBitsMonitor'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsBitsMonitor.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsLanMgr'
    ss.dependency 'JobsNetWorkTools'
    ss.dependency 'ZWPullMenuView'
    ss.dependency 'JobsByOCPods'
    ss.dependency 'JobsSuspend'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsBlock'
  end

  spec.subspec 'NetWorkToolsSupport' do |ss|
    ss.source_files = 'NetWorkToolsSupport/**/*.{h,m,mm}'
    ss.dependency 'JobsBitsMonitor/Core'
  end

  JobsPodspecKitForJobsBitsMonitor.apply_standard_xcconfig(spec)

end
