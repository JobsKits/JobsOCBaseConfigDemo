require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsOCVideoRecorder.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCVideoRecorder'
  spec.version          = '1.0.0'
  spec.summary          = 'Jobs Objective-C video recorder component.'
  spec.description      = <<-DESC
JobsOCVideoRecorder provides a full-screen camera preview, long-press AVAssetWriter recording, draggable playback preview, shake/back cancellation, and album saving.
  DESC
  spec.homepage         = 'https://example.local/JobsOCVideoRecorder'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'UIKit',
    'AVFoundation',
    'Photos',
    'QuartzCore',
    'CoreImage',
    'CoreMedia',
    'CoreVideo',
    'AudioToolbox'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'TKPermissionKit'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCVideoRecorder.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsOCVideoRecorder.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCVideoRecorder.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCVideoRecorder'

  JobsPodspecKitForJobsOCVideoRecorder.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCVideoRecorder.apply_standard_xcconfig(spec)
end
