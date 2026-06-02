require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsDeviceInfo.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsDeviceInfo'
  spec.version          = '1.0.0'
  spec.summary          = 'Device information utilities for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsDeviceInfo contains Objective-C device information, identifier, system info, and IP helper categories used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsDeviceInfo'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.header_dir = 'JobsDeviceInfo'

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'AdSupport',
    'Security'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'YTKNetwork'
  spec.dependency 'MJExtension'
  spec.dependency 'AFNetworking'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'TXFileOperation'

  spec.dependency 'JobsModel'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsLanMgr'
  JobsPodspecKitForJobsDeviceInfo.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsDeviceInfo.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = [
      'JobsDeviceInfo.h',
      'Core/**/*.{h,m,mm}'
    ]
    ss.public_header_files = [
      'JobsDeviceInfo.h',
      'Core/**/*.h'
    ]
    ss.resources = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}'
    ss.header_dir = 'JobsDeviceInfo'
  end

  JobsPodspecKitForJobsDeviceInfo.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsDeviceInfo.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
