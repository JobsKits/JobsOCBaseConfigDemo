require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/JobsControlTarget/JobsControlTarget.m'
  ]

  support_context = JobsPodspecKitForJobsSuspend.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsSuspend'
  spec.version          = '1.0.0'
  spec.summary          = 'Suspend UI components for Jobs.'
  spec.description      = <<-DESC
JobsSuspend provides suspend button, label and view components.
  DESC

  spec.homepage         = 'https://example.local/JobsSuspend'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.source_files        = 'JobsSuspend.h'
  spec.public_header_files = 'JobsSuspend.h'

  JobsPodspecKitForJobsSuspend.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]
  JobsPodspecKitForJobsSuspend.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsSuspend.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.dependency 'ReactiveObjC'
    ss.dependency 'XYColorOC'
    ss.dependency 'JobsModel'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsDeviceInfo'
    ss.dependency 'JobsLoadingImage'
    ss.dependency 'JobsOCRuntimeKits'
    ss.dependency 'JobsRichTextUtils'
    ss.dependency 'JobsLanMgr'

    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources = 'Core/**/*.{png,jpg,jpeg,gif,webp,pdf,xcassets,bundle}'
  end

  JobsPodspecKitForJobsSuspend.apply_standard_xcconfig(spec)

end
