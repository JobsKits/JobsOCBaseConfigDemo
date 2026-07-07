module JobsPodspecKitForJobsOCSearcher
  STANDARD_EXCLUDE_FILES = [
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
  ].freeze

  module_function

  def apply_standard_exclude_files(spec, exclude_files = nil)
    spec.exclude_files = exclude_files || STANDARD_EXCLUDE_FILES
  end

  def standard_pod_target_xcconfig
    {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  def standard_user_target_xcconfig(spec)
    {
      'HEADER_SEARCH_PATHS' => "$(inherited) \"$(PODS_ROOT)/Headers/Public/#{spec.name}/**\"",
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  end

  def apply_standard_pod_target_xcconfig(spec, pod_target_xcconfig = nil)
    spec.pod_target_xcconfig = pod_target_xcconfig || standard_pod_target_xcconfig
  end

  def apply_standard_user_target_xcconfig(spec, user_target_xcconfig = nil)
    spec.user_target_xcconfig = user_target_xcconfig || standard_user_target_xcconfig(spec)
  end

  def apply_standard_xcconfig(spec, pod_target_xcconfig: nil, user_target_xcconfig: nil)
    apply_standard_pod_target_xcconfig(spec, pod_target_xcconfig)
    apply_standard_user_target_xcconfig(spec, user_target_xcconfig)
  end
end
