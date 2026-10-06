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

  spec.source_files = [
    'JobsClass.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsClass.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsClass'

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

  spec.subspec 'Support' do |ss|
    ss.source_files = [
      'Support/**/*.{h,m,mm}'
    ]
    ss.private_header_files = [
      'Support/**/*.h'
    ]
  end

  spec.dependency 'MJExtension'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsClass.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: nil,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/JobsClass/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
