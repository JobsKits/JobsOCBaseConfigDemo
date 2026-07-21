require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCRefresher.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCRefresher'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C refresh component library for Jobs projects.'
  spec.description      = <<-DESC
JobsOCRefresher provides UIKit refresh and load-more components for Jobs Objective-C projects,
including vertical and horizontal pull gestures, configurable states, default skins,
and a protocol-driven refresh animator host supplied by JobsFuseAnimation.
  DESC

  spec.homepage         = 'https://example.local/JobsOCRefresher'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = :none

  spec.source_files = [
    'JobsOCRefresher.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCRefresher.h',
    'Core/**/*.h'
  ]
  spec.header_dir          = 'JobsOCRefresher'

  spec.frameworks = [
    'AudioToolbox',
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsFuseAnimation'

  JobsPodspecKitForJobsOCRefresher.add_support_subspec(spec, support_context)

  JobsPodspecKitForJobsOCRefresher.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCRefresher.apply_standard_xcconfig(spec)

end
