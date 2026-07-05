require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForGKCustomNavigationBarExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name                  = 'GKCustomNavigationBarExtra'
  spec.version               = '1.0.0'
  spec.summary               = 'GKNavigationBar custom title helpers for Jobs.'
  spec.description           = 'Local Objective-C helper pod for GKNavigationBar custom title button convenience APIs.'
  spec.homepage              = 'https://example.local/GKCustomNavigationBarExtra'
  spec.license               = { :type => 'MIT', :file => 'LICENSE' }
  spec.author                = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform              = :ios, '12.0'
  spec.requires_arc          = true
  spec.module_name           = 'GKCustomNavigationBarExtra'
  spec.source                = { :path => '.' }


  spec.frameworks = [
    'AudioToolbox',
    'CoreText',
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'MJExtension'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'TABAnimated'
  spec.dependency 'XZMRefresh'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsStringUtils'

  JobsPodspecKitForGKCustomNavigationBarExtra.apply_standard_exclude_files(spec)

  JobsPodspecKitForGKCustomNavigationBarExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'GKCustomNavigationBarExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'GKCustomNavigationBarExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'GKCustomNavigationBarExtra'


  JobsPodspecKitForGKCustomNavigationBarExtra.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: JobsPodspecKitForGKCustomNavigationBarExtra.standard_user_target_xcconfig(spec).merge(
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    )
  )

end
