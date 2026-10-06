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

  # 测试 fixture 只进入显式 Stability 目标，不进入生产 source_files。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
