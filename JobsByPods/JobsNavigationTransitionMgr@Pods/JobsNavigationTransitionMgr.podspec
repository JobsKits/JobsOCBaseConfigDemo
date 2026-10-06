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

  spec.source           = { :path => '.' }

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

  spec.source_files = [
    'JobsNavigationTransitionMgrHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsNavigationTransitionMgrHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsNavigationTransitionMgr'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}'


  JobsPodspecKitForJobsNavigationTransitionMgr.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsNavigationTransitionMgr.apply_standard_xcconfig(spec)

  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsNavigationTransitionMgrPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

  spec.exclude_files = Array(spec.attributes_hash['exclude_files']) + ['Resource/icon.png']
  spec.preserve_paths = Array(spec.attributes_hash['preserve_paths']) + ['Resource/icon.png']

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
