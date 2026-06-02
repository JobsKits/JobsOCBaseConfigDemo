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

  spec.default_subspecs = 'Core'

  # 根目录公共头（关键点：不要放进 Core / Support）
  spec.source_files        = 'JobsDebug.h'
  spec.public_header_files = 'JobsDebug.h'

  JobsPodspecKitForJobsDebug.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLanMgr'
  JobsPodspecKitForJobsDebug.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsDebug.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}'
    ss.dependency 'JobsDebug/Support/UIKit'
  end

  JobsPodspecKitForJobsDebug.apply_standard_pod_target_xcconfig(
    spec,
    {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )
end
