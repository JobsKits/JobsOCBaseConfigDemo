require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCRefresher.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCRefresher'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C refresh component library for Jobs projects.'
  spec.description      = <<-DESC
JobsOCRefresher provides UIKit refresh and load-more components for Jobs Objective-C projects,
including vertical and horizontal pull gestures, configurable states, default skins,
and a protocol-driven refresh animator host supplied by JobsFuseAnimation.
  DESC

  spec.homepage         = 'https://example.local/JobsOCRefresher'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = :none

  spec.source_files = [
    'JobsOCRefresher.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCRefresher.h',
    'Core/**/*.h'
  ]
  spec.header_dir          = 'JobsOCRefresher'

  spec.frameworks = [
    'AudioToolbox',
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsFuseAnimation'

  JobsPodspecKitForJobsOCRefresher.add_support_subspec(spec, support_context)

  JobsPodspecKitForJobsOCRefresher.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCRefresher.apply_standard_xcconfig(spec)

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
