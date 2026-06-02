require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
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
  spec.header_dir   = 'JobsLoadingImage'
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsLoadingImage.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  JobsPodspecKitForJobsLoadingImage.apply_standard_xcconfig(spec)

end
