require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsCustomView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )


  spec.name             = 'JobsCustomView'
  spec.version          = '1.0.0'
  spec.summary          = 'Custom date picker view component for Jobs projects.'
  spec.description      = <<-DESC
JobsCustomView is a local Objective-C UI component library providing a custom
date range picker view with Jobs project styling and helper integrations.
  DESC

  spec.homepage         = 'https://example.local/JobsCustomView'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsCustomView.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsCustomView.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsCustomViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsCustomViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsCustomView'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'Masonry'
  spec.dependency 'Reachability'
  spec.dependency 'TXFileOperation'
  spec.dependency 'YTKNetworkExtra'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'MJExtension'
  spec.dependency 'MJRefresh'
  spec.dependency 'MJRefreshExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'TABAnimated'
  spec.dependency 'XZMRefresh'
  spec.dependency 'BRPickerView'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'BRPickerViewExtra'
  spec.dependency 'This'

  JobsPodspecKitForJobsCustomView.apply_standard_xcconfig(spec)

end
