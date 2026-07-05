require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsOCSplash.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCSplash'
  spec.version          = '1.0.0'
  spec.summary          = 'Jobs Objective-C splash screen component.'
  spec.description      = <<-DESC
JobsOCSplash displays local or remote images, GIFs and videos with skip, countdown, tap and shake actions.
  DESC
  spec.homepage         = 'https://example.local/JobsOCSplash'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = ['UIKit', 'AVFoundation', 'ImageIO']
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCTimer'
  spec.resource_bundles = {
    'JobsOCSplashResources' => ['Resource/**/*']
  }

  JobsPodspecKitForJobsOCSplash.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsOCSplash.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCSplash.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCSplash'


  JobsPodspecKitForJobsOCSplash.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCSplash.apply_standard_xcconfig(spec)
end
