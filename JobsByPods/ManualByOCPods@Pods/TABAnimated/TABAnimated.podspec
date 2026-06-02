Pod::Spec.new do |spec|

  spec.name         = "TABAnimated"
  spec.version      = "2.6.6"
  spec.summary      = "TABAnimated是一个ios平台上的网络过渡动画(骨架屏)的封装"

  spec.description  = <<-DESC
  TABAnimated是一个ios平台上的网络过渡动画(骨架屏)的封装，目前仅支持oc
  DESC

  spec.homepage     = "https://github.com/tigerAndBull/TABAnimated"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author       = { "tigerAndBull" => "1429299849@qq.com" }

  spec.platform     = :ios, "12.0"
  spec.requires_arc = true
  spec.source       = { :git => "https://github.com/tigerAndBull/TABAnimated.git", :tag => spec.version.to_s }

  spec.frameworks = [
    "Foundation",
    "UIKit"
  ]

  spec.source_files = [
    "TABAnimatedDemo/TABAnimated/**/*.{h,m,mm}"
  ]

  spec.public_header_files = [
    "TABAnimatedDemo/TABAnimated/**/*.h"
  ]

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

  spec.pod_target_xcconfig = {
    "DEFINES_MODULE" => "YES",
    "HEADER_SEARCH_PATHS" => "$(inherited) \"$(PODS_TARGET_SRCROOT)/TABAnimatedDemo/TABAnimated/**\" \"$(PODS_ROOT)/Headers/Public/TABAnimated/**\"",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES"
  }

  spec.user_target_xcconfig = {
    "HEADER_SEARCH_PATHS" => "$(inherited) \"$(PODS_ROOT)/Headers/Public/TABAnimated/**\"",
    "CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES" => "YES"
  }

end
