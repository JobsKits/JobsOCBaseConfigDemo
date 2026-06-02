Pod::Spec.new do |spec|
  spec.name             = 'DeviceKitByObjc'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C port scaffold of DeviceKit.'
  spec.description      = <<-DESC
DeviceKitByObjc is a local Objective-C CocoaPods scaffold generated from DeviceKit source data.
It exposes device model mapping, battery state, disk space, and Apple Pencil support helpers.
  DESC
  spec.homepage         = 'https://example.local/DeviceKitByObjc'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.ios.deployment_target      = '12.0'
  spec.tvos.deployment_target     = '12.0'
  spec.watchos.deployment_target  = '6.0'
  spec.osx.deployment_target      = '10.15'
  spec.visionos.deployment_target = '1.0'

  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'DeviceKitByObjc'
  spec.header_dir       = 'DeviceKitByObjc'
  spec.default_subspecs = 'Core'

  # 根入口头只暴露当前真实存在的聚合头。
  spec.source_files        = 'DeviceKitByObjc.h'
  spec.public_header_files = 'DeviceKitByObjc.h'

  spec.resource_bundles = {
    'DeviceKitByObjcResources' => [
      'Resources/**/*.xcprivacy'
    ]
  }

  # Support 目录当前存放生成器和上游 Swift 数据源，不参与 Objective-C 编译。
  spec.preserve_paths = [
    'Support/**/*'
  ]

  spec.exclude_files = [
    '**/.DS_Store',
    '__MACOSX/**/*',
    'Pods/**/*',
    'Example/**/*',
    'Examples/**/*',
    'Demo/**/*',
    'Tests/**/*',
    'Test/**/*',
    '*.xcodeproj/**/*',
    '*.xcworkspace/**/*'
  ]

  spec.frameworks = [
    'Foundation'
  ]

  spec.ios.frameworks      = ['UIKit']
  spec.tvos.frameworks     = ['UIKit']
  spec.visionos.frameworks = ['UIKit']

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)" "$(PODS_TARGET_SRCROOT)/Core/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/DeviceKitByObjc/**"'
  }
end
