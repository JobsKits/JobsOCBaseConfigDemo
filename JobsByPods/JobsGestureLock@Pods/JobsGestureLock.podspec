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

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.module_name         = 'JobsGestureLock'

  JobsPodspecKitForJobsGestureLock.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsGestureLock.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsGestureLock.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsGestureLock'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'

  JobsPodspecKitForJobsGestureLock.apply_standard_xcconfig(spec)

end
