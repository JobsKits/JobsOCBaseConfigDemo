require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsTimeUtils.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsTimeUtils'
  spec.version          = '1.0.0'
  spec.summary          = 'Time utilities for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsTimeUtils contains Objective-C time and date helper categories used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsTimeUtils'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation'
  ]

  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'WHToastExtra'
  JobsPodspecKitForJobsTimeUtils.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsTimeUtils.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsTimeUtils.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsTimeUtils'


  JobsPodspecKitForJobsTimeUtils.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsTimeUtils.apply_standard_xcconfig(
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
