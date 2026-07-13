require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'ZMJCellExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'ZMJGanttChart cell helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for ZMJCell convenience APIs and custom views.'
  spec.homepage         = 'https://example.local/ZMJCellExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'ZMJCellExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'ZMJGanttChart'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'

  spec.source_files = [
    'ZMJCellExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'ZMJCellExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'ZMJCellExtra'


  JobsPodspecKitForZMJCellExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForZMJCellExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ZMJCellExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
