Pod::Spec.new do |spec|
  spec.name             = 'DeviceKit'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C port scaffold of DeviceKit.'
  spec.description      = <<-DESC
DeviceKit is a local Objective-C device information library.
It provides device type mapping, battery state, disk space and Apple Pencil support helpers.
  DESC

  spec.homepage         = 'LOCAL'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'local' }
  spec.source           = { :path => '.' }

  spec.ios.deployment_target      = '12.0'
  spec.tvos.deployment_target     = '12.0'
  spec.watchos.deployment_target  = '6.0'
  spec.osx.deployment_target      = '10.15'
  spec.visionos.deployment_target = '1.0'

  spec.requires_arc     = true

  spec.source_files = [
    'DeviceKitObjc.h'
  ]

  spec.public_header_files = [
    'DeviceKitObjc.h'
  ]

  spec.resource_bundles = {
    'DeviceKitResources' => [
      'PrivacyInfo.xcprivacy'
    ]
  }

  spec.default_subspecs = 'Core'

  spec.subspec 'Core' do |ss|
    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]

    ss.ios.frameworks      = ['Foundation', 'UIKit']
    ss.tvos.frameworks     = ['Foundation', 'UIKit']
    ss.visionos.frameworks = ['Foundation', 'UIKit']
    ss.watchos.frameworks  = ['Foundation']
    ss.osx.frameworks      = ['Foundation']
  end

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
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/DeviceKit/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
