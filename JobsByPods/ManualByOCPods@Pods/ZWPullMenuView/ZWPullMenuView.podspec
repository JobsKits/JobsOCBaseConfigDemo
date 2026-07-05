Pod::Spec.new do |spec|
  spec.name             = 'ZWPullMenuView'
  spec.version          = '0.1.0'
  spec.summary          = 'Pull menu view for iOS.'
  spec.description      = <<-DESC
ZWPullMenuView provides pull menu view components.
  DESC

  spec.homepage         = 'https://github.com/Jobs/ZWPullMenuView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.source           = { :path => '.' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

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
    'UIKit'
  ]

  spec.dependency 'JobsByOCPods'

  spec.source_files = [
    'ZWPullMenuViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'ZWPullMenuViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'ZWPullMenuView'

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/ZWPullMenuView/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
