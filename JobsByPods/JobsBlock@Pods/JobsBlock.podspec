require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsBlock.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsBlock'
  spec.version          = '1.0.4'
  spec.summary          = 'Objective-C block type definitions for Jobs projects.'
  spec.description      = <<-DESC
JobsBlock is a header-only Objective-C definitions library containing common block typedefs,
business block typedefs, parameterized block macro helpers, and centralized forward declarations used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsBlock'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'MessageUI',
    'WebKit',
    'QuartzCore',
    'Metal',
    'PDFKit',
    'UserNotifications',
    'Photos',
    'JavaScriptCore',
    'NetworkExtension'
  ]

  spec.dependency 'SDWebImage'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsBlock.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsBlockDef.h',
    'JobsBlockHeader.h',
    'Core/**/*.{h,m,mm}'
  ]

  spec.public_header_files = [
    'JobsBlockDef.h',
    'JobsBlockHeader.h',
    'Core/**/*.h'
  ]

  # 支持 #import <JobsBlock/xxx.h>
  # 不再使用 Core subspec，避免 Pods 工程里出现 JobsBlock/Core/Core 的双层 Core 结构。
  spec.header_dir = 'JobsBlock'

  JobsPodspecKitForJobsBlock.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsBlock.apply_standard_xcconfig(
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
