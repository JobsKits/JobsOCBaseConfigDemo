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

  spec.default_subspecs = 'Core'

  if File.exist?(File.join(__dir__, 'JobsOCPatch.h'))
    spec.source_files = 'JobsOCPatch.h'
    spec.public_header_files = 'JobsOCPatch.h'
  end

  spec.header_dir = 'JobsOCPatch'

  spec.frameworks = [
    'Foundation'
  ]

  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCPatch.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsOCPatch.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir = 'JobsOCPatch'
  end

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
