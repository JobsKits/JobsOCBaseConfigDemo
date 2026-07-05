require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'RACExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'ReactiveCocoa extension macros for Jobs.'
  spec.description      = 'Local Objective-C pod that exposes RAC metamacros and runtime helpers.'
  spec.homepage         = 'https://example.local/RACExtra'
  spec.license          = { :type => 'MIT', :file => 'README.md' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'RACExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation']

  spec.source_files = [
    'RACExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'RACExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'RACExtra'


  JobsPodspecKitForRACExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForRACExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/RACExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
