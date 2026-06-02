Pod::Spec.new do |spec|
  spec.name         = 'GTCaptcha4'
  spec.version      = '1.8.8'
  spec.summary      = 'GTCaptcha4 wrapper'
  spec.description  = 'GTCaptcha4 XCFramework wrapper'
  spec.homepage     = 'https://git.tigerbrokers.net/ios/GTCaptcha4'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'chenxin' => 'chenxin@tigerbrokers.com' }

  spec.source       = { :path => '.' }
  spec.platform     = :ios, '12.0'
  spec.requires_arc = true

  spec.vendored_frameworks = 'gt4-ios-1.8.8-sec/SDK/XCFramework/GTCaptcha4.xcframework'
  spec.resources = [
    'gt4-ios-1.8.8-sec/SDK/GTCaptcha4.bundle'
  ]
  spec.preserve_paths = [
    'gt4-ios-1.8.8-sec/SDK/XCFramework/GTCaptcha4.xcframework',
    'gt4-ios-1.8.8-sec/SDK/GTCaptcha4.bundle'
  ]

  spec.frameworks = [
    'Foundation',
    'UIKit'
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

  # This pod wraps a prebuilt XCFramework. Do not declare broad source_files/public_header_files,
  # otherwise CocoaPods will also copy headers inside the vendored framework and Xcode will
  # report "Multiple commands produce .../GTCaptcha4.framework/Headers/*.h".

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/GTCaptcha4/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

end
