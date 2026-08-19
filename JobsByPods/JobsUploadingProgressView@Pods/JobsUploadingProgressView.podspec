require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsUploadingProgressView'
  spec.version          = '1.0.0'
  spec.summary          = 'Uploading progress view for Jobs.'
  spec.description      = <<-DESC
JobsUploadingProgressView provides an uploading progress view component.
  DESC

  spec.homepage         = 'https://example.local/JobsUploadingProgressView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  JobsPodspecKitForJobsUploadingProgressView.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsLanMgr'

  spec.source_files = [
    'JobsUploadingProgressViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsUploadingProgressViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsUploadingProgressView'


  JobsPodspecKitForJobsUploadingProgressView.apply_standard_xcconfig(spec)

end
