require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsLuckyEnvelopeRain.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsLuckyEnvelopeRain'
  spec.version          = '1.0.0'
  spec.summary          = 'Red packet rain component powered by JobsOCTimer.'
  spec.description      = <<-DESC
JobsLuckyEnvelopeRain wraps JobsOCTimer into a reusable red packet rain view for Jobs Objective-C apps.
  DESC
  spec.homepage         = 'https://example.local/JobsLuckyEnvelopeRain'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = ['UIKit', 'Foundation', 'QuartzCore']

  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCTimer'

  JobsPodspecKitForJobsLuckyEnvelopeRain.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsLuckyEnvelopeRain.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsLuckyEnvelopeRain.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsLuckyEnvelopeRain'

  JobsPodspecKitForJobsLuckyEnvelopeRain.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsLuckyEnvelopeRain.apply_standard_xcconfig(spec)
end
