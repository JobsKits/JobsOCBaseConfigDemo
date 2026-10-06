require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCSkeletonView'
  spec.version          = '1.0.0'
  spec.summary          = 'Skeleton and shimmer placeholder view utilities for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCSkeletonView provides lightweight UIKit skeleton placeholders, shimmer
and pulse animation modes, plus UIImageView loading placeholder helpers.
  DESC

  spec.homepage         = 'https://example.local/JobsOCSkeletonView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsOCSkeletonView'

  spec.source_files = [
    'JobsOCSkeletonView.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCSkeletonView.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCSkeletonView'

  JobsPodspecKitForJobsOCSkeletonView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCSkeletonView.apply_standard_xcconfig(spec)

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
