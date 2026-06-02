Pod::Spec.new do |spec|
  spec.name             = 'FSCalendar'
  spec.version          = '2.8.4'
  spec.summary          = 'A superior calendar for iOS with excellent performance.'
  spec.description      = <<-DESC
FSCalendar is a fully customizable iOS calendar library, compatible with Objective-C and Swift.
  DESC

  spec.homepage         = 'https://github.com/WenchaoD/FSCalendar'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Wenchao Ding' => 'wenchao.d@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  # 本地 pod
  spec.source           = { :path => '.' }

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  spec.exclude_files = [
    # macOS
    '**/.DS_Store',
    '**/._*',
    '__MACOSX/**/*',

    # Git / SVN
    '.git/**/*',
    '.svn/**/*',

    # CocoaPods
    'Pods/**/*',
    'Podfile',
    'Podfile.lock',
    '*.podspec',

    # Xcode 工程/工作区
    '*.xcodeproj/**/*',
    '*.xcworkspace/**/*',
    'DerivedData/**/*',
    'build/**/*',

    # Demo / Example / Test
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

    # 文档/截图
    'README*',
    'CHANGELOG*',
    'LICENSE*',
    'Docs/**/*',
    'doc/**/*',
    'Documentation/**/*',
    'Screenshots/**/*',
    'Images/**/*',

    # 脚本/CI
    'fastlane/**/*',
    '.github/**/*',
    '.gitlab/**/*',
    '.circleci/**/*',
    '.travis.yml',
    'Jenkinsfile',

    # 临时/缓存
    'tmp/**/*',
    'temp/**/*',
    '.tmp/**/*',
    '.temp/**/*',
    '*.log',
    '*.bak',
    '*.swp',

    # 压缩包
    '*.zip',
    '*.tar',
    '*.tar.gz',
    '*.tgz',
    '*.rar',
    '*.7z'
  ]

  spec.frameworks = [
    'UIKit',
    'Foundation',
    'CoreGraphics',
    'QuartzCore'
  ]

  # 按最新目录结构匹配源码：根目录聚合头 + Core 下各模块源码
  spec.source_files = [
    'FSCalendarDynamicHeader.h',
    'Core/**/*.{h,m,mm}'
  ]

  spec.public_header_files = [
    'FSCalendarDynamicHeader.h',
    'Core/**/*.h'
  ]

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)" "$(PODS_TARGET_SRCROOT)/Core/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/FSCalendar/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
