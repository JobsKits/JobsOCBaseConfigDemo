require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/BaseUI/BaseTextView/BaseTextView.m'
  ]

  support_context = JobsPodspecKitForMJRefreshExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name         = 'MJRefreshExtra'
  spec.version      = '0.0.1'
  spec.summary      = 'MJRefresh extra categories and protocols.'
  spec.description  = 'Local pod for MJRefresh extra categories and helper protocols.'
  spec.homepage     = 'https://example.local/MJRefreshExtra'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source       = { :path => '.' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.default_subspecs = 'Core'

  spec.source_files        = 'MJRefreshExtra.h'
  spec.public_header_files = 'MJRefreshExtra.h'
  JobsPodspecKitForMJRefreshExtra.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForMJRefreshExtra.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'MJRefreshExtra/Support'
    ss.dependency 'TABAnimated'
    ss.dependency 'MJRefresh'
    ss.dependency 'JobsModel'
    ss.dependency 'XYColorOC'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDSL'
    ss.dependency 'lottie-ios', '~> 2.5.3'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'XZMRefresh'
    ss.dependency 'WHToastExtra'
    ss.dependency 'JobsDeviceInfo'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsStringUtils'
    ss.dependency 'JobsLoadingImage'
    ss.dependency 'JobsRichTextUtils'
    ss.dependency 'JobsOCRuntimeKits'
    ss.dependency 'JobsLanMgr'

  end

  JobsPodspecKitForMJRefreshExtra.apply_standard_exclude_files(spec)

  JobsPodspecKitForMJRefreshExtra.apply_standard_xcconfig(spec)

end
