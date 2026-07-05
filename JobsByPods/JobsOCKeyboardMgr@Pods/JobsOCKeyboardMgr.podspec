require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCKeyboardMgr.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCKeyboardMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Keyboard avoidance manager for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCKeyboardMgr listens to system keyboard notifications, calculates whether a target view is obstructed, and applies an optional keyboard-safe transform through Jobs-style DSL configuration.
  DESC

  spec.homepage         = 'https://example.local/JobsOCKeyboardMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCKeyboardMgr.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsOCKeyboardMgr.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCKeyboardMgr.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCKeyboardMgr'


  JobsPodspecKitForJobsOCKeyboardMgr.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCKeyboardMgr.apply_standard_xcconfig(
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
