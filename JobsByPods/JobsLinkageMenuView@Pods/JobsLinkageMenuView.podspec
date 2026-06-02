require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsLinkageMenuView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'Masonry',
      'MJExtension',
      'MJRefresh',
      'MJRefreshExtra',
      'ReactiveObjC',
      'TABAnimated',
      'TXFileOperation',
      'XZMRefresh',
      'YTKNetworkExtra',
      'JobsAppTools',
      'JobsBaseUI',
      'JobsBlock',
      'JobsClass',
      'JobsDeviceInfo',
      'JobsLanMgr',
      'JobsMakes',
      'JobsModel',
      'JobsOCDefs',
      'JobsOCProtocols',
      'JobsOCRuntimeKits',
      'JobsRichTextUtils',
      'JobsStringUtils',
      'JobsTimeUtils',
      'XYColorOC'
    ]
  )

  spec.name             = 'JobsLinkageMenuView'
  spec.version          = '1.0.0'
  spec.summary          = 'Linkage menu view component for Jobs projects.'
  spec.description      = <<-DESC
JobsLinkageMenuView is a local Objective-C UI component library providing
a linkage menu view with configurable menu width, slider view, text styles,
and linked content switching support.
  DESC

  spec.homepage         = 'https://example.local/JobsLinkageMenuView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.prefix_header_contents = <<-PCH
#import <JobsOCDefs/JobsDefines.h>
#import <JobsLinkageMenuView/UIButton+SimplyMake.h>
#import <JobsLinkageMenuView/UIView+Extra.h>
#import <JobsLinkageMenuView/UIBackgroundConfiguration+Extra.h>
#import <JobsLinkageMenuView/UIGestureRecognizer+Extra.h>
#import <JobsLinkageMenuView/UILabel+DSL.h>
#import <JobsLinkageMenuView/UIButton+TextView.h>
#import <JobsLinkageMenuView/UIView+Measure.h>
#import <JobsLinkageMenuView/UITextItem+Extra.h>
#import <JobsBaseUI/UITextView+Extra.h>
  PCH

  # CocoaPods 的 source 只接受 :git、:hg、:http、:svn。
  # 这是本地开发 Pod 时用于通过校验的占位写法；发布时请替换成真实 git 仓库地址。
  spec.source           = { :git => 'https://example.local/JobsLinkageMenuView.git', :tag => spec.version.to_s }

  spec.default_subspecs = 'Core'
  file_support_context = JobsPodspecKitForJobsLinkageMenuView.build_file_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'Masonry',
      'MJExtension',
      'MJRefresh',
      'MJRefreshExtra',
      'ReactiveObjC',
      'TABAnimated',
      'TXFileOperation',
      'XZMRefresh',
      'YTKNetworkExtra',
      'JobsAppTools',
      'JobsBaseUI',
      'JobsBlock',
      'JobsClass',
      'JobsDeviceInfo',
      'JobsLanMgr',
      'JobsMakes',
      'JobsModel',
      'JobsOCDefs',
      'JobsOCProtocols',
      'JobsOCRuntimeKits',
      'JobsRichTextUtils',
      'JobsStringUtils',
      'JobsTimeUtils',
      'XYColorOC'
    ]
  )

  spec.dependency 'Masonry'
  spec.dependency 'MJExtension'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'TABAnimated'
  spec.dependency 'TXFileOperation'
  spec.dependency 'XZMRefresh'
  spec.dependency 'YTKNetworkExtra'
  spec.dependency 'JobsAppTools'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModel'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'XYColorOC'

  JobsPodspecKitForJobsLinkageMenuView.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsLinkageMenuView.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle,xcassets}'
    JobsPodspecKitForJobsLinkageMenuView.add_file_support_dependencies(ss, spec, file_support_context)
  end

  JobsPodspecKitForJobsLinkageMenuView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsLinkageMenuView.apply_standard_xcconfig(spec)

end
