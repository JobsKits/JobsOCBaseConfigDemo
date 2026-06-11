Pod::Spec.new do |spec|
  spec.name             = 'JXCategoryViewExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'JXCategoryView helpers for Jobs.'
  spec.description      = 'Local Objective-C helper pod for JXCategoryView convenience APIs and custom views.'
  spec.homepage         = 'https://example.local/JXCategoryViewExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'JXCategoryViewExtra'
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'
  spec.source_files        = 'JXCategoryViewExtra.h'
  spec.public_header_files = 'JXCategoryViewExtra.h'
  spec.frameworks = ['Foundation', 'UIKit']
  spec.dependency 'JXCategoryView'
  spec.dependency 'JXPagingView/Pager'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

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
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JXCategoryViewExtra/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
    'OTHER_LDFLAGS' => '$(inherited) -ObjC'
  }
end
