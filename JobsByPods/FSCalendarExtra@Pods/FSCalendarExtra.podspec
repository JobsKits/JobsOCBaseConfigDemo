require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'FSCalendarExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'FSCalendar helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for FSCalendar convenience APIs.'
  spec.homepage         = 'https://example.local/FSCalendarExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'FSCalendarExtra'
  spec.source           = { :path => '.' }
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'FSCalendar'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'FSCalendarExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'FSCalendarExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'FSCalendarExtra'


  JobsPodspecKitForFSCalendarExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForFSCalendarExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/FSCalendarExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
