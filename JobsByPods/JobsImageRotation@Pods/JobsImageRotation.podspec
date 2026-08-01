require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsImageRotation.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsImageRotation'
  spec.version          = '1.0.0'
  spec.summary          = 'Timer-driven view rotation and minimal animated clock icons for Jobs projects.'
  spec.description      = 'Rotates any UIKit view or a tick-free clock minute hand with a configurable direction and timer interval.'
  spec.homepage         = 'https://example.local/JobsImageRotation'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsImageRotation.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsImageRotation.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsImageRotation.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsImageRotation'

  JobsPodspecKitForJobsImageRotation.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsImageRotation.apply_standard_xcconfig(spec)
end
