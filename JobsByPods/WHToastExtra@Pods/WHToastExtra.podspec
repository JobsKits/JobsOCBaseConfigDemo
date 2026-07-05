require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForWHToastExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'WHToastExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'WHToast category extensions for Jobs.'
  spec.description      = <<-DESC
WHToastExtra provides lightweight Objective-C category extensions around WHToast,
including toast display helpers and local image path helpers.
  DESC

  spec.homepage         = 'https://example.local/WHToastExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.static_framework = false
  spec.source           = { :path => '.' }


  # 根目录公共入口头文件
  # 磁盘真实路径：
  # WHToastExtra.h


  JobsPodspecKitForWHToastExtra.apply_standard_exclude_files(
    spec,
    [
      '**/.DS_Store',
      '**/._*',
      '__MACOSX/**/*',
      '.git/**/*',
      '.svn/**/*',
      'Pods/**/*',
      'Podfile',
      'Podfile.lock',
      '*.podspec',
      '*.xcodeproj/**/*',
      '*.xcworkspace/**/*',
      'DerivedData/**/*',
      'build/**/*',
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
      'README*',
      'CHANGELOG*',
      'Docs/**/*',
      'doc/**/*',
      'Documentation/**/*',
      'Screenshots/**/*',
      'Images/**/*',
      'fastlane/**/*',
      '.github/**/*',
      '.gitlab/**/*',
      '.circleci/**/*',
      '.travis.yml',
      'Jenkinsfile',
      'tmp/**/*',
      'temp/**/*',
      '.tmp/**/*',
      '.temp/**/*',
      '*.log',
      '*.bak',
      '*.swp',
      '*.zip',
      '*.tar',
      '*.tar.gz',
      '*.tgz',
      '*.rar',
      '*.7z'
    ]
  )

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'AudioToolbox'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'WHToast'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'SDWebImage'
  spec.dependency 'MJExtension'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForWHToastExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'WHToastExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'WHToastExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'WHToastExtra'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  JobsPodspecKitForWHToastExtra.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: nil,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/WHToastExtra/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
