require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsStringUtils'
  spec.version          = '1.0.0'
  spec.summary          = 'String utilities for Jobs.'
  spec.description      = <<-DESC
JobsStringUtils provides NSString related utility methods.
  DESC

  spec.homepage         = 'https://example.local/JobsStringUtils'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsStringUtils'


  JobsPodspecKitForJobsStringUtils.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.source_files = [
    'JobsStringUtilsHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsStringUtilsHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsStringUtils'


  JobsPodspecKitForJobsStringUtils.apply_standard_xcconfig(
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
