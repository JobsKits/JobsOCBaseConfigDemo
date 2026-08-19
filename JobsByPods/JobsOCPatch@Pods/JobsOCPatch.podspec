require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCPatch.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCPatch'
  spec.version          = '1.0.0'
  spec.summary          = 'Runtime payload patch engine for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCPatch provides a small Objective-C runtime patch manager that can temporarily replace a whitelisted method implementation with a local payload provider and roll it back.
  DESC

  spec.homepage         = 'https://example.local/JobsOCPatch'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation'
  ]

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsOCPatch.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsOCPatch.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCPatch.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCPatch'


  JobsPodspecKitForJobsOCPatch.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCPatch.apply_standard_xcconfig(
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
