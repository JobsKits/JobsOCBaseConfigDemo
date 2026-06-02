Pod::Spec.new do |spec|
  spec.name         = 'TKPermissionKit'
  spec.version      = '1.2.9'
  spec.summary      = 'iOS权限管理工具'
  spec.description  = 'TKPermissionKit local pod for iOS permission management.'
  spec.homepage     = 'https://github.com/RANSAA/TKPermissionKit'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'sayaDev' => '1352892108@qq.com' }

  spec.requires_arc = true
  spec.platform     = :ios, '12.0'
  spec.source       = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.source_files        = 'TKPermissionKit.h'
  spec.public_header_files = 'TKPermissionKit.h'

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
    'Photos',
    'AVFoundation',
    'MediaPlayer',
    'CoreBluetooth',
    'CoreLocation',
    'UserNotifications',
    'Speech',
    'Contacts',
    'EventKit',
    'CoreTelephony',
    'CoreMotion',
    'HomeKit',
    'HealthKit',
    'Intents',
    'AppTrackingTransparency',
    'AdSupport'
  ]

  spec.libraries = [
    'z',
    'c++'
  ]

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsLanMgr'

  spec.subspec 'Core' do |ss|
    ss.source_files = [
      'Bluetooth/**/*.{h,m,mm}',
      'Calendar/**/*.{h,m,mm}',
      'Camera/**/*.{h,m,mm}',
      'Contacts/**/*.{h,m,mm}',
      'FileAndFolders/**/*.{h,m,mm}',
      'Health/**/*.{h,m,mm}',
      'Home/**/*.{h,m,mm}',
      'LocationAlways/**/*.{h,m,mm}',
      'LocationWhen/**/*.{h,m,mm}',
      'Media/**/*.{h,m,mm}',
      'Microphone/**/*.{h,m,mm}',
      'Motion/**/*.{h,m,mm}',
      'NetWork/**/*.{h,m,mm}',
      'Notification/**/*.{h,m,mm}',
      'Photo/**/*.{h,m,mm}',
      'Public/**/*.{h,m,mm}',
      'Reminder/**/*.{h,m,mm}',
      'Siri/**/*.{h,m,mm}',
      'Speech/**/*.{h,m,mm}',
      'Tracking/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Bluetooth/**/*.h',
      'Calendar/**/*.h',
      'Camera/**/*.h',
      'Contacts/**/*.h',
      'FileAndFolders/**/*.h',
      'Health/**/*.h',
      'Home/**/*.h',
      'LocationAlways/**/*.h',
      'LocationWhen/**/*.h',
      'Media/**/*.h',
      'Microphone/**/*.h',
      'Motion/**/*.h',
      'NetWork/**/*.h',
      'Notification/**/*.h',
      'Photo/**/*.h',
      'Public/**/*.h',
      'Reminder/**/*.h',
      'Siri/**/*.h',
      'Speech/**/*.h',
      'Tracking/**/*.h'
    ]

    ss.dependency 'TKPermissionKit/Resource'
  end

  spec.subspec 'Resource' do |ss|
    ss.resources = [
      'Public/TKPermissionKit.bundle/**/*.strings'
    ]
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/TKPermissionKit/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
