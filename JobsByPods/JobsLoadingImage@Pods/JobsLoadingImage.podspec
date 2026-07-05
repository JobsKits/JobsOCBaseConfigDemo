require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsLoadingImage.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsBlock'
    ]
  )

  spec.name         = 'JobsLoadingImage'
  spec.version      = '0.0.1'
  spec.summary      = 'Bundle image loading helpers extracted into a standalone local pod.'
  spec.description  = 'Standalone local pod for bundle image path lookup, image loading, image data loading, and compatibility wrappers. Header-only inline helpers were migrated to extern declarations and .m implementations to avoid cross-module conflicts.'
  spec.homepage     = 'https://example.local/JobsLoadingImage'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source       = { :path => '.' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.module_name  = 'JobsLoadingImage'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsLoadingImage.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsLoadingImageHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsLoadingImageHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsLoadingImage'


  JobsPodspecKitForJobsLoadingImage.add_support_subspec(spec, support_context)

  JobsPodspecKitForJobsLoadingImage.apply_standard_xcconfig(spec)

end
