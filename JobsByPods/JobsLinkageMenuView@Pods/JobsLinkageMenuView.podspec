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
      'JobsModelDSL',
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
#import <JobsBaseUI/UIBackgroundConfiguration+Extra.h>
#import <JobsBaseUI/UIGestureRecognizer+Extra.h>
#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif
#import <JobsLinkageMenuView/UIButton+TextView.h>
#import <JobsLinkageMenuView/UIView+Measure.h>
#import <JobsBaseUI/UITextItem+Extra.h>
#import <JobsBaseUI/UITextView+Extra.h>
  PCH

  spec.source           = { :path => '.' }

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
      'JobsModelDSL',
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
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'XYColorOC'

  JobsPodspecKitForJobsLinkageMenuView.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsLinkageMenuViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsLinkageMenuViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsLinkageMenuView'


  JobsPodspecKitForJobsLinkageMenuView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsLinkageMenuView.apply_standard_xcconfig(spec)

end
