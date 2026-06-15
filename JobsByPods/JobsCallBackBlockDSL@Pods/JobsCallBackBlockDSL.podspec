Pod::Spec.new do |spec|
  spec.name             = 'JobsCallBackBlockDSL'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C chain DSL categories for Jobs callback blocks.'
  spec.description      = 'JobsCallBackBlockDSL wraps JobsBlock NSObject callback storage APIs with by-style dot-syntax chain DSL.'
  spec.homepage         = 'https://example.local/JobsCallBackBlockDSL'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'JobsCallBackBlockDSL'
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'
  spec.source_files        = 'JobsCallBackBlockDSL.h'
  spec.public_header_files = 'JobsCallBackBlockDSL.h'
  spec.header_dir          = 'JobsCallBackBlockDSL'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  spec.exclude_files = [
    '**/.DS_Store',
    '**/.git',
    '**/.svn',
    '**/Pods/**',
    '**/build/**',
    '**/DerivedData/**',
    '**/*.xcuserstate',
    '**/*.log',
    '**/*.tmp',
    '**/*.bak'
  ]

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JobsCallBackBlockDSL/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
