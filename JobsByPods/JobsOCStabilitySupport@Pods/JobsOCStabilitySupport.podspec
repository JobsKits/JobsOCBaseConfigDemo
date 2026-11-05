require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCStabilitySupport'
  spec.version          = '1.0.0'
  spec.summary          = 'UIKit scene support for isolated Objective-C stability test hosts.'
  spec.description      = 'Provides a blank scene delegate without starting business services.'
  spec.homepage         = 'https://example.local/JobsOCStabilitySupport'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '13.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files     = ['JobsOCStabilitySupport.h', 'Core/**/*.{h,m,mm}']
  spec.public_header_files = ['JobsOCStabilitySupport.h', 'Core/**/*.h']
  spec.header_dir       = 'JobsOCStabilitySupport'
  spec.frameworks       = ['UIKit']

  JobsPodspecKitForJobsOCStabilitySupport.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCStabilitySupport.apply_standard_xcconfig(spec)
end
