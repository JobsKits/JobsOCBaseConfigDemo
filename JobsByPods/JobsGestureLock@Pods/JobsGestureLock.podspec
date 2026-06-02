require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name                = 'JobsGestureLock'
  spec.version             = '1.0.0'
  spec.summary             = 'Objective-C gesture lock components for iOS.'
  spec.description         = <<-DESC
JobsGestureLock is an Objective-C gesture lock component library for iOS.
It provides a reusable lock view, indicator view, password persistence helper,
and an optional ready-to-use view controller for create/validate flows.
  DESC

  spec.homepage            = 'https://example.local/JobsGestureLock'
  spec.license             = { :type => 'MIT', :file => 'LICENSE' }
  spec.author              = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform            = :ios, '12.0'
  spec.requires_arc        = true
  spec.source              = { :path => '.' }
  spec.default_subspecs    = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.module_name         = 'JobsGestureLock'
  spec.header_dir          = 'JobsGestureLock'

  JobsPodspecKitForJobsGestureLock.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/Resources/**/*'

    ss.dependency 'JobsOCDefs'
  end

  JobsPodspecKitForJobsGestureLock.apply_standard_xcconfig(spec)

end
