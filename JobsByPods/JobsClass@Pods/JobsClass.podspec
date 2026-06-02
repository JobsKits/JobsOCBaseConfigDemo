require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsClass'
  spec.version          = '1.0.0'
  spec.summary          = 'NSObject class/runtime helpers for Jobs.'
  spec.description      = <<-DESC
JobsClass provides lightweight Objective-C NSObject category helpers around
class/runtime inspection, ordered model value reading, and class membership checks.
  DESC

  spec.homepage         = 'https://example.local/JobsClass'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.static_framework = false
  spec.module_name      = 'JobsClass'
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  # 根目录公共入口头文件
  # 磁盘真实路径：
  # JobsClass.h
  spec.source_files = [
    'JobsClass.h'
  ]

  spec.public_header_files = [
    'JobsClass.h'
  ]

  JobsPodspecKitForJobsClass.apply_standard_exclude_files(
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
    'Foundation'
  ]

  spec.subspec 'Core' do |ss|
    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]

    ss.resources = [
      'Core/**/*.{bundle,xib,storyboard,xcassets,json,plist,png,jpg,jpeg,gif,webp,strings,stringsdict}'
    ]

    ss.dependency 'JobsClass/Support'
    ss.dependency 'MJExtension'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
  end

  spec.subspec 'Support' do |ss|
    ss.source_files = [
      'Support/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Support/**/*.h'
    ]

    ss.resources = [
      'Support/**/*.{bundle,xib,storyboard,xcassets,json,plist,png,jpg,jpeg,gif,webp,strings,stringsdict}'
    ]
  end

  JobsPodspecKitForJobsClass.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: nil,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JobsClass/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
