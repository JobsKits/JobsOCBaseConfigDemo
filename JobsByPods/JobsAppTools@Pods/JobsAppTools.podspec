require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsAppTools.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsBlock',
      'JobsClass',
      'JobsLanMgr',
      'JobsMakes',
      'JobsOCDefs',
      'JobsOCProtocols',
      'JobsStringUtils',
      'MJExtension',
      'XYColorOC'
    ]
  )

  spec.name             = 'JobsAppTools'
  spec.version          = '1.0.0'
  spec.summary          = 'App utility tools for Jobs projects.'
  spec.description      = <<-DESC
JobsAppTools is a local Objective-C utility component library for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsAppTools'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsAppTools'

  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsAppTools.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]
  JobsPodspecKitForJobsAppTools.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsAppTools.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}'

    ss.dependency 'JobsAppTools/Support'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsLanMgr'
  end

  JobsPodspecKitForJobsAppTools.apply_standard_xcconfig(
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
