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
  spec.default_subspecs = 'Core'
  spec.source_files        = 'RACExtra.h'
  spec.public_header_files = 'RACExtra.h'
  spec.frameworks = ['Foundation']

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/RACExtra/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
