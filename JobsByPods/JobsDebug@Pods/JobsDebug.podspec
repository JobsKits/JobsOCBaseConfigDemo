require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsDebug.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsDebug'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C debug components for Jobs projects.'
  spec.description      = <<-DESC
JobsDebug is a local Objective-C debug component library that provides debug log
description support and debug utilities for development and testing.
  DESC

  spec.homepage         = 'https://example.local/JobsDebug'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  # 根目录公共头（关键点：不要放进 Core / Support）

  JobsPodspecKitForJobsDebug.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLanMgr'
  JobsPodspecKitForJobsDebug.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsDebug.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsDebug.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsDebug'


  JobsPodspecKitForJobsDebug.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
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
