require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsBlock.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsBlock'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C block type definitions for Jobs projects.'
  spec.description      = <<-DESC
JobsBlock is a header-only Objective-C definitions library containing common block typedefs,
business block typedefs, and parameterized block macro helpers used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsBlock'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'MessageUI'
  ]

  spec.dependency 'SDWebImage'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsBlock.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsBlock.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    # 支持 #import <JobsBlock/xxx.h>
    # 注意：这里故意不写 header_mappings_dir，避免保留 Core 下面的子目录层级
    ss.header_dir = 'JobsBlock'
  end

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
