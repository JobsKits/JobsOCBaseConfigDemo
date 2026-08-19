require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'ReachabilityExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'Reachability helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for Reachability convenience APIs.'
  spec.homepage         = 'https://example.local/ReachabilityExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'ReachabilityExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation']
  spec.dependency 'Reachability'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'ReachabilityExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'ReachabilityExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'ReachabilityExtra'


  JobsPodspecKitForReachabilityExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForReachabilityExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ReachabilityExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
