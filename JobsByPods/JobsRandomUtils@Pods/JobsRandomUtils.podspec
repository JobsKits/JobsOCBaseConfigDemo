require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsRandomUtils'
  spec.version          = '1.0.0'
  spec.summary          = 'Random utilities for Jobs.'
  spec.description      = <<-DESC
JobsRandomUtils provides random number related utility methods.
  DESC

  spec.homepage         = 'https://example.local/JobsRandomUtils'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsRandomUtils'

  spec.source_files = [
    'JobsRandomUtilsHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsRandomUtilsHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsRandomUtils'


  JobsPodspecKitForJobsRandomUtils.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsRandomUtils.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
