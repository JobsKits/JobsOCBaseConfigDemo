require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCDSL.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsBlock',
      'JobsOCDefs',
      'JobsOCProtocols',
      'JobsMakes',
      'JobsOCRuntimeKits'
    ]
  )

  spec.name             = 'JobsOCDSL'
  spec.version          = '1.0.4'
  spec.summary          = 'Objective-C chain DSL categories for Jobs projects.'
  spec.description      = 'JobsOCDSL centralizes Objective-C dot-syntax DSL category wrappers for system and selected third-party UI classes.'
  spec.homepage         = 'https://example.local/JobsOCDSL'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit',
    'CoreText',
    'QuartzCore',
    'Metal',
    'MessageUI',
    'PDFKit',
    'UserNotifications'
  ]

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'Masonry'
  spec.dependency 'Texture'
  spec.dependency 'ZFPlayer'
  spec.dependency 'MJRefresh'
  spec.dependency 'YTKNetwork'
  spec.dependency 'FSCalendar'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'HXPhotoPickerObjC'
  spec.dependency 'SDWebImage'

  JobsPodspecKitForJobsOCDSL.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsOCDSL.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCDSL.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCDSL'


  JobsPodspecKitForJobsOCDSL.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCDSL.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
    }
  )

end
