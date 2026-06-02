require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCTimer.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCTimer'
  spec.version          = '1.0.0'
  spec.summary          = 'Timer utilities for Jobs.'
  spec.description      = <<-DESC
JobsOCTimer provides timer utilities and related helpers.
  DESC

  spec.homepage         = 'https://example.local/JobsOCTimer'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsOCTimer.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'WHToast'
  spec.dependency 'SDWebImage'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'WHToastExtra'
  JobsPodspecKitForJobsOCTimer.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsOCTimer.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsOCTimer/Support/UIKit'
  end

  JobsPodspecKitForJobsOCTimer.apply_standard_xcconfig(spec)

end
