require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'MGSwipeTableCellExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'MGSwipeTableCell helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for MGSwipeTableCell convenience APIs.'
  spec.homepage         = 'https://example.local/MGSwipeTableCellExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'MGSwipeTableCellExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'MGSwipeTableCell'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'MGSwipeTableCellExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'MGSwipeTableCellExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'MGSwipeTableCellExtra'


  JobsPodspecKitForMGSwipeTableCellExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForMGSwipeTableCellExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/MGSwipeTableCellExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
