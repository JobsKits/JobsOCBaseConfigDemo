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

  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsNetWorkToolsPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
