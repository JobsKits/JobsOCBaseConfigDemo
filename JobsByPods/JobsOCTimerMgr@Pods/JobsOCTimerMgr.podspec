require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCTimerMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C timer manager component for Jobs projects.'
  spec.description      = <<-DESC
  JobsOCTimerMgr is a local Objective-C component library that provides
centralized timer creation, lifecycle management, callback management, and
foreground/background policy handling for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsOCTimerMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsOCTimerMgr.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCTimerMgr.h',
    'Core/JobsTimerMgr/*.h',
    'Core/JobsTimerMgr+DSL/*.h'
  ]
  spec.private_header_files = 'Core/_JobsTimerMgrEntry/*.h'
  spec.header_dir = 'JobsOCTimerMgr'


  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsOCTimerMgr.apply_standard_xcconfig(spec)

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
