require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/Other/JobsLinkageMenuView/JobsLinkageMenuView.m',
    'Support/Other/JobsMenuView/JobsMenuView.m'
  ]

  support_context = JobsPodspecKitForJobsBaseUI.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsBaseUI'
  spec.version          = '1.0.0'
  spec.summary          = 'Base UI component library for Jobs projects.'
  spec.description      = <<-DESC
JobsBaseUI is a local Objective-C UI component library used in Jobs projects.
It contains base views, view controllers, table and collection view cells,
text fields, buttons, labels, navigation components, layouts, helper objects,
UIKit categories, model helpers, and related resource files.
  DESC

  spec.homepage         = 'https://example.local/JobsBaseUI'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  # 根入口头文件

  # 按磁盘顶层目录在 Pods 工程里分组显示
  JobsPodspecKitForJobsBaseUI.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsBaseUI.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsBaseUI.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsBaseUI'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  JobsPodspecKitForJobsBaseUI.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'AudioToolbox',
    'Foundation',
    'UIKit',
    'WebKit'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'MJRefresh'
  spec.dependency 'lottie-ios', '~> 2.5.3'
  spec.dependency 'XYColorOC'
  spec.dependency 'SZTextViewExtra'
  spec.dependency 'XZMRefresh'
  spec.dependency 'MJExtension'
  spec.dependency 'TABAnimated'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsNavBar'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsAppTools'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsRandomUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsBasePopupView'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'This'

  JobsPodspecKitForJobsBaseUI.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: JobsPodspecKitForJobsBaseUI.standard_pod_target_xcconfig.merge(
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**" "$(PODS_ROOT)/../JobsByPods/JobsNavBar@Pods/Core" "$(PODS_ROOT)/../JobsByPods/JobsNavBar@Pods/Core/JobsNavBarConfig"'
    )
  )

end
