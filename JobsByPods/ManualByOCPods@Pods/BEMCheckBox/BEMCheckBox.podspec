Pod::Spec.new do |spec|
  spec.name         = 'BEMCheckBox'
  spec.version      = '1.4.1'
  spec.summary      = 'Tastefully crafted Checkbox for iOS.'
  spec.description  = <<-DESC
BEMCheckBox is an open source checkbox UIControl for iOS, written in Objective-C.
  DESC

  spec.homepage     = 'https://github.com/Boris-Em/BEMCheckBox'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Boris Emorine' => 'boris.emorine@gmail.com' }
  spec.source       = { :git => 'https://github.com/Boris-Em/BEMCheckBox.git', :tag => spec.version.to_s }

  spec.platform     = :ios, '9.0'
  spec.requires_arc = true

  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'QuartzCore',
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

  spec.subspec 'Core' do |ss|
    ss.source_files = 'Core/**/*.{h,m}'

    ss.public_header_files = [
      'Core/BEMCheckBox/BEMCheckBox.h',
      'Core/BEMCheckBoxGroup/BEMCheckBoxGroup.h'
    ]

    ss.private_header_files = [
      'Core/BEMAnimationManager/*.h',
      'Core/BEMPathManager/*.h'
    ]
  end
end
