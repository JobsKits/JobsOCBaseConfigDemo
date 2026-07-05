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

end
