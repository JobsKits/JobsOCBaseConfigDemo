require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsImageRotation.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsImageRotation'
  spec.version          = '1.0.0'
  spec.summary          = 'Timer-driven view rotation and minimal animated clock icons for Jobs projects.'
  spec.description      = 'Rotates any UIKit view or a tick-free clock minute hand with a configurable direction and timer interval.'
  spec.homepage         = 'https://example.local/JobsImageRotation'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsImageRotation.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsImageRotation.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsImageRotation.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsImageRotation'

  JobsPodspecKitForJobsImageRotation.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsImageRotation.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
