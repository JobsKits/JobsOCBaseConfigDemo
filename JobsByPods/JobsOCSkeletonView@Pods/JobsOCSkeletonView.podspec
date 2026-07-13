require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCSkeletonView'
  spec.version          = '1.0.0'
  spec.summary          = 'Skeleton and shimmer placeholder view utilities for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCSkeletonView provides lightweight UIKit skeleton placeholders, shimmer
and pulse animation modes, plus UIImageView loading placeholder helpers.
  DESC

  spec.homepage         = 'https://example.local/JobsOCSkeletonView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsOCSkeletonView'

  spec.source_files = [
    'JobsOCSkeletonView.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCSkeletonView.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCSkeletonView'

  JobsPodspecKitForJobsOCSkeletonView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCSkeletonView.apply_standard_xcconfig(spec)

end
