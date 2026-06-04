require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCTools.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name         = 'JobsOCTools'
  spec.version      = '0.0.1'
  spec.summary      = 'Objective-C UI and utility components by Jobspec.'
  spec.description  = <<-DESC
    JobsOCTools is an Objective-C component collection containing UI widgets,
    app-door/login views, crypto helpers, tab bar utilities, WebSocket helpers,
    animation resources, and other reusable iOS toolspec.
  DESC

  spec.homepage     = 'https://github.com/Jobs/JobsOCTools'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'jobs@example.com' }
  spec.source       = { :git => 'https://github.com/Jobs/JobsOCToolspec.git', :tag => spec.version.to_s }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.prefix_header_contents = <<-PCH
#import <JobsOCDefs/JobsDefines.h>
#import <JobsMakes/JobsMakes.h>
#import <JobsStringUtils/JobsStringUtils.h>
#import <JobsByOCPods/JobsByOCPods.h>
#import <SRWebSocketExtra/SRWebSocketExtra.h>
#import <XYColorOC/XYColorOC.h>
  PCH
  spec.static_framework = true
  spec.module_name      = 'JobsOCTools'

  # 根目录头文件单独放在顶层，避免把 Core/Support 子目录提升到 Pods 工程根分组。
  spec.source_files = 'JobsOCTools.h'
  spec.public_header_files = 'JobsOCTools.h'

  # 默认安装 Core；Core 会显式依赖 Support。
  spec.default_subspecs = 'Core'

  # Support 按磁盘目录继续拆 subspec，避免 CocoaPods 在 Pods 工程里把中间目录压平。
  # 目标展示结构：Support/UIKit/UIViewController/UIViewController+Lottie
  JobsPodspecKitForJobsOCTools.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |core|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsOCTools.add_dynamic_support_dependencies(core, spec, support_context)

    core.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    core.public_header_files = [
      'Core/**/*.h'
    ]

    core.resource_bundles = {
      'JobsOCToolsCore' => [
        'Core/**/*.{bundle,png,jpg,jpeg,gif,webp,svg,pdf,json,plist,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}'
      ]
    }

    core.dependency 'JobsOCTools/Support'
  end

  spec.frameworks = [
    'UIKit',
    'Foundation',
    'QuartzCore',
    'CoreText',
    'EventKit',
    'UserNotifications',
    'NetworkExtension'
  ]

  spec.dependency 'FDFullscreenPopGesture'
  spec.dependency 'FSCalendar'
  spec.dependency 'Masonry'
  spec.dependency 'PPBadgeView'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'SocketRocket'
  spec.dependency 'ZFPlayer'
  spec.dependency 'lottie-ios'

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsCryptography'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsSuspend'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsAppTools'
  spec.dependency 'TFPopupExtra'
  spec.dependency 'JobsHotLabel'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'AFSecurityPolicyExtra'
  spec.dependency 'HTMLDocumentExtra'
  spec.dependency 'FMDatabaseExtra'
  spec.dependency 'FSCalendarExtra'
  spec.dependency 'GKCustomNavigationBarExtra'
  spec.dependency 'HXPhotoManagerExtra'
  spec.dependency 'HXPhotoViewExtra'
  spec.dependency 'IQKeyboardManagerExtra'
  spec.dependency 'JXCategoryViewExtra'
  spec.dependency 'LMJDropdownMenuExtra'
  spec.dependency 'MGSwipeTableCellExtra'
  spec.dependency 'RACExtra'
  spec.dependency 'ReachabilityExtra'
  spec.dependency 'SRWebSocketExtra'
  spec.dependency 'SZTextViewExtra'
  spec.dependency 'TextureExtra'
  spec.dependency 'ZFPlayerExtra'
  spec.dependency 'ZMJCellExtra'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'XYColorOC'

  JobsPodspecKitForJobsOCTools.apply_standard_exclude_files(
    spec,
    [
      '**/.DS_Store',
      '**/._*',
      '__MACOSX/**/*',
      '.git/**/*',
      '.svn/**/*',
      'Pods/**/*',
      'Podfile',
      'Podfile.lock',
      '*.podspec',
      '*.xcodeproj/**/*',
      '*.xcworkspace/**/*',
      'DerivedData/**/*',
      'build/**/*',
      'Demo/**/*',
      'Demos/**/*',
      'Example/**/*',
      'Examples/**/*',
      'Sample/**/*',
      'Samples/**/*',
      'Test/**/*',
      'Tests/**/*',
      'UnitTests/**/*',
      'UITests/**/*',
      'README*',
      'CHANGELOG*',
      'Docs/**/*',
      'doc/**/*',
      'Documentation/**/*',
      'Screenshots/**/*',
      'Images/**/*',
      'fastlane/**/*',
      '.github/**/*',
      '.gitlab/**/*',
      '.circleci/**/*',
      '.travis.yml',
      'Jenkinsfile',
      'tmp/**/*',
      'temp/**/*',
      '.tmp/**/*',
      '.temp/**/*',
      '*.log',
      '*.bak',
      '*.swp',
      '*.zip',
      '*.tar',
      '*.tar.gz',
      '*.tgz',
      '*.rar',
      '*.7z'
    ]
  )

  JobsPodspecKitForJobsOCTools.apply_standard_xcconfig(spec)

end
