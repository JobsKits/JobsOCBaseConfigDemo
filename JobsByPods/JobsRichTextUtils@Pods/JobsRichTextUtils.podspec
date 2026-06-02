require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsRichTextUtils.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsRichTextUtils'
  spec.version          = '1.0.0'
  spec.summary          = 'Rich text utilities for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsRichTextUtils contains Objective-C rich text helper categories and attributed string utilities used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsRichTextUtils'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.source_files = 'JobsRichTextUtils.h'
  spec.public_header_files = 'JobsRichTextUtils.h'
  spec.header_dir = 'JobsRichTextUtils'

  spec.frameworks = [
    'Foundation',
    'CoreText',
    'UIKit'
  ]

  spec.dependency 'XYColorOC'
  spec.dependency 'JobsModel'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLanMgr'
  JobsPodspecKitForJobsRichTextUtils.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsRichTextUtils.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}'
    ss.header_dir = 'JobsRichTextUtils'
  end

  JobsPodspecKitForJobsRichTextUtils.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsRichTextUtils.apply_standard_xcconfig(
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
