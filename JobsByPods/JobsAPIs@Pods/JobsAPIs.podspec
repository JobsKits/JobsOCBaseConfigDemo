require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsAPIs.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsAPIs'
  spec.version          = '0.0.1'
  spec.summary          = 'API request layer built on top of YTKNetwork.'
  spec.description      = <<-DESC
JobsAPIs provides a small set of API request classes, including a base API request,
register request, and image upload request, built on top of YTKNetwork.
  DESC

  spec.homepage         = 'https://example.local/JobsAPIs'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source           = { :path => '.' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true


  JobsPodspecKitForJobsAPIs.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsAPIs.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsAPIs.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsAPIs'


  JobsPodspecKitForJobsAPIs.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'This'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'YTKNetwork'
  spec.dependency 'MJExtension'
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'TXFileOperation'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'YTKNetworkExtra'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForJobsAPIs.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)" "$(PODS_TARGET_SRCROOT)/Core" "$(PODS_TARGET_SRCROOT)/Support"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JobsAPIs"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )


  # 测试单独进入 Stability target，生产包不包含 Tests。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
