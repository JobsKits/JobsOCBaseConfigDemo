require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/BaseUI/BaseButton/BaseButton.m',
    'Support/BaseUI/BaseImageView/BaseImageView.m',
    'Support/BaseUI/BaseTextView/BaseTextView.m'
  ]

  support_context = JobsPodspecKitForJobsNavBar.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name                  = 'JobsNavBar'
  spec.version               = '1.0.0'
  spec.summary               = 'Objective-C navigation bar components for Jobs projects.'
  spec.description           = <<-DESC
JobsNavBar is a local Objective-C navigation bar component library that provides
navigation bar view support and related configuration models for Jobs projects.
  DESC

  spec.homepage              = 'https://example.local/JobsNavBar'
  spec.license               = { :type => 'MIT' }
  spec.author                = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform              = :ios, '12.0'
  spec.requires_arc          = true
  spec.source                = { :path => '.' }

  JobsPodspecKitForJobsNavBar.apply_standard_exclude_files(spec)

  # 编译出来的模块名
  spec.module_name           = 'JobsNavBar'
  spec.static_framework      = true

  spec.frameworks = [
    'AudioToolbox',
    'CoreText',
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJExtension'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsAppTools'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'TABAnimated'
  spec.dependency 'WHToastExtra'
  spec.dependency 'XYColorOC'
  spec.dependency 'XZMRefresh'
  spec.dependency 'lottie-ios', '~> 2.5.3'

  JobsPodspecKitForJobsNavBar.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsNavBarHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsNavBarHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsNavBar'


  JobsPodspecKitForJobsNavBar.apply_standard_xcconfig(spec)

end
