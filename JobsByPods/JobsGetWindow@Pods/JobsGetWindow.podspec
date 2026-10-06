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


  JobsPodspecKitForJobsGetWindow.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsGetWindow.apply_standard_xcconfig(spec)


  spec.source_files = [
    'JobsGetWindow.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsGetWindow.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsGetWindow'

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
