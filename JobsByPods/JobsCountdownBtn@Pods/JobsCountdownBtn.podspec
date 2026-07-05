require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsCountdownBtn.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsCountdownBtn'
  spec.version          = '1.0.0'
  spec.summary          = 'Verification-code countdown button for Jobs Objective-C apps.'
  spec.description      = <<-DESC
JobsCountdownBtn wraps UIButton+JobsTimer into a reusable verification-code countdown button.
  DESC
  spec.homepage         = 'https://example.local/JobsCountdownBtn'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = ['UIKit', 'Foundation']

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForJobsCountdownBtn.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsCountdownBtn.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsCountdownBtn.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsCountdownBtn'


  JobsPodspecKitForJobsCountdownBtn.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsCountdownBtn.apply_standard_xcconfig(spec)
end
