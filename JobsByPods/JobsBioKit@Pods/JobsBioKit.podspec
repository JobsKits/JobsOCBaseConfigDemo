require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsBioKit'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C biometric authentication wrapper for LocalAuthentication.'
  spec.description      = <<-DESC
A standalone CocoaPods component for Touch ID, Face ID, Optic ID and passcode fallback.
  DESC
  spec.homepage         = 'https://example.local/JobsBioKit'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source           = { :path => '.' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.frameworks       = 'Foundation', 'LocalAuthentication'
  spec.source_files = [
    'JobsBioKitHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsBioKitHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsBioKit'

  JobsPodspecKitForJobsBioKit.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsBioKit.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/Core"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JobsBioKit"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
