Pod::Spec.new do |spec|
  spec.name         = 'WMZCode'
  spec.version      = '1.0.2'
  spec.summary      = '滑块验证'
  spec.description  = <<-DESC
支持多种验证码/滑块验证视图。
  DESC

  spec.homepage     = 'https://github.com/wwmz/WMZCode'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'wmz' => '925457662@qq.com' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.source       = { :path => '.' }

  spec.default_subspecs = 'Core'

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

  spec.frameworks = ['Foundation', 'UIKit']

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCProtocols'

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'WMZCodeViewDefine.h'
    ss.public_header_files = 'WMZCodeViewDefine.h'

    ss.subspec 'WMZBannerView' do |sss|
      sss.source_files        = 'WMZBannerView/WMZCodeView.{h,m}'
      sss.public_header_files = 'WMZBannerView/WMZCodeView.h'
    end
  end

  spec.pod_target_xcconfig = {
    'DEFINES_MODULE' => 'YES',
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  spec.user_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/WMZCode/**"',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
end
