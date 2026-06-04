require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/FileFolderHandleTool/FileFolderHandleTool.m',
    'Support/UIKit/UIView/UIView+Refresh/**/*'
  ]

  support_context = JobsPodspecKitForJobsNavigationTransitionMgr.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsNavigationTransitionMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Navigation transition manager for Jobs projects.'
  spec.description      = <<-DESC
JobsNavigationTransitionMgr is a local Objective-C navigation transition
component for Jobs projects. It provides custom push and pop transition
animation support with configurable transition directions and interactive
pan gesture handling.
  DESC

  spec.homepage         = 'https://example.local/JobsNavigationTransitionMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  spec.source           = {
    :git => 'https://example.local/JobsNavigationTransitionMgr.git',
    :tag => spec.version.to_s
  }

  spec.frameworks = [
    'AdSupport',
    'AVFoundation',
    'CoreImage',
    'CoreText',
    'Foundation',
    'ImageIO',
    'Photos',
    'QuartzCore',
    'Security',
    'UIKit',
    'WebKit'
  ]

  spec.default_subspecs = 'Core'

  # Third-party / external pods
  spec.dependency 'FDFullscreenPopGesture'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'GKPhotoBrowser'
  spec.dependency 'Masonry'
  spec.dependency 'MJExtension'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'SDWebImage'
  spec.dependency 'TABAnimated'
  spec.dependency 'TFPopup'
  spec.dependency 'WHToast'
  spec.dependency 'XZMRefresh'
  spec.dependency 'YYImage'
  # Jobs pods
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsNavBar'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsDebug'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsAppTools'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCSnowflake'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsViewNavigator'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForJobsNavigationTransitionMgr.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |core|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsNavigationTransitionMgr.add_dynamic_support_dependencies(core, spec, support_context)

    core.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    core.public_header_files = [
      'Core/**/*.h'
    ]

    core.resources = [
      'Core/**/*.{bundle,png,jpg,jpeg,gif,webp,svg,pdf,json,plist,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav}'
    ]

  end

  JobsPodspecKitForJobsNavigationTransitionMgr.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsNavigationTransitionMgr.apply_standard_xcconfig(spec)

end
