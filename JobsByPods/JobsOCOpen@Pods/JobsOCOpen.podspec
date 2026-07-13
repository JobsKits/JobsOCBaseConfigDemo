require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCOpen.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsBlock'
    ]
  )

  spec.name             = 'JobsOCOpen'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C URL opening component for Jobs projects.'
  spec.description      = <<-DESC
JobsOCOpen ports JobsSwiftOpen to Objective-C and provides in-app web opening, external URL opening, phone dialing, and mail launching helpers.
  DESC

  spec.homepage         = 'https://example.local/JobsOCOpen'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit',
    'WebKit',
    'MessageUI'
  ]

  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsGetWindow'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsStringUtils'

  spec.source_files = [
    'JobsOCOpen.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCOpen.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCOpen'


  JobsPodspecKitForJobsOCOpen.add_support_subspec(spec, support_context)

  JobsPodspecKitForJobsOCOpen.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCOpen.apply_standard_xcconfig(
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
