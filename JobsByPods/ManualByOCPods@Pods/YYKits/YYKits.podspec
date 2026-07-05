Pod::Spec.new do |spec|
  spec.name             = 'YYKits'
  spec.version          = '0.1.0'
  spec.summary          = 'Local Objective-C pod that provides YYFPSLabel and YYWeakProxy.'
  spec.description      = <<-DESC
YYKits is a lightweight local Objective-C pod that packages YYFPSLabel
and YYWeakProxy for convenient integration through CocoaPods.
  DESC

  spec.homepage         = 'https://github.com/Jobs/YYKits'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.source           = { :path => '.' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.static_framework = true
  spec.module_name      = 'YYKits'

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
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.source_files = [
    'YYKits.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'YYKits.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'YYKits'

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/YYKits/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
