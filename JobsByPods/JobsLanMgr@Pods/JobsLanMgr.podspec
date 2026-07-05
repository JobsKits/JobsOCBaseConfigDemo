require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsLanMgr.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsLanMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C language utility and block helpers for Jobs projects.'
  spec.description      = <<-DESC
JobsLanMgr provides language utilities and block helpers for Jobs projects,
including NSString, NSBundle, NSObject categories, and other support classes.
  DESC

  spec.homepage         = 'https://example.local/JobsLanMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsLanMgr'

  # Root umbrella header: keep it on the root spec so Xcode/Pods exposes it
  # at Pods/Headers/Public/JobsLanMgr/JobsLanMgr.h, instead of burying it
  # inside only the Core subspec file glob.


  JobsPodspecKitForJobsLanMgr.apply_standard_exclude_files(
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
      'LICENSE*',
      'Docs/**/*',
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
    'UIKit'
  ]
  JobsPodspecKitForJobsLanMgr.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsLanMgr.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsLanMgr.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsLanMgr'


  spec.dependency 'SDWebImage'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'


  JobsPodspecKitForJobsLanMgr.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
