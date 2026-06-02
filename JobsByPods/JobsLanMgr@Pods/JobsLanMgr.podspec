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
  spec.source_files        = 'JobsLanMgr.h'
  spec.public_header_files = 'JobsLanMgr.h'
  spec.header_dir          = 'JobsLanMgr'

  spec.default_subspecs = 'Core'

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

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsLanMgr.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir          = 'JobsLanMgr'

    ss.dependency 'JobsLanMgr/Support'

    ss.dependency 'SDWebImage'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsStringUtils'
  end


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
