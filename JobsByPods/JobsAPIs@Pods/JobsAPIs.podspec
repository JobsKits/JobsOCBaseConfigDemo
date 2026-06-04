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

  spec.homepage         = 'https://github.com/yourname/JobsAPIs'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'jobs@example.com' }
  spec.source           = { :git => 'https://github.com/yourname/JobsAPIs.git', :tag => spec.version.to_s }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  spec.default_subspecs = 'Core'

  spec.source_files = [
    'JobsAPIs.h'
  ]

  spec.public_header_files = [
    'JobsAPIs.h'
  ]
  JobsPodspecKitForJobsAPIs.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsAPIs.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]
  end

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

end
