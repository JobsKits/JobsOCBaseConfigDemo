require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsScreenCapture.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsScreenCapture'
  spec.version          = '1.0.0'
  spec.summary          = 'Screenshot capture, observation, saving, and sensitive-content protection for Jobs projects.'
  spec.description      = <<-DESC
JobsScreenCapture captures and saves screens, observes completed system screenshots, and hosts sensitive UIKit content in a secure rendering container.
  DESC
  spec.homepage         = 'https://example.local/JobsScreenCapture'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files     = [
    'JobsScreenCapture.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsScreenCapture.h',
    'Core/**/*.h'
  ]
  spec.header_dir       = 'JobsScreenCapture'
  spec.frameworks       = ['Foundation', 'Photos', 'UIKit']

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'Masonry'

  JobsPodspecKitForJobsScreenCapture.add_support_subspec(spec, support_context)
  JobsPodspecKitForJobsScreenCapture.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsScreenCapture.apply_standard_xcconfig(spec)
end
