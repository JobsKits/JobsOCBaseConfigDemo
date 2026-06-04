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
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsCustomView.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsCustomView.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsCustomView.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = [
      'Core/**/*.{h,m,mm}'
    ]
    ss.public_header_files = [
      'Core/**/*.h'
    ]
    ss.resources           = [
      'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}',
      'JobsCustomView.png'
    ]

    ss.dependency 'Masonry'
    ss.dependency 'Reachability'
    ss.dependency 'TXFileOperation'
    ss.dependency 'YTKNetworkExtra'
    ss.dependency 'XYColorOC'
    ss.dependency 'JobsBaseUI'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDSL'
    ss.dependency 'JobsClass'
    ss.dependency 'JobsLanMgr'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsOCRuntimeKits'
    ss.dependency 'JobsStringUtils'
    ss.dependency 'MJExtension'
    ss.dependency 'MJRefresh'
    ss.dependency 'MJRefreshExtra'
    ss.dependency 'ReactiveObjC'
    ss.dependency 'TABAnimated'
    ss.dependency 'XZMRefresh'
    ss.dependency 'BRPickerView'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'BRPickerViewExtra'
    ss.dependency 'This'
  end

  JobsPodspecKitForJobsCustomView.apply_standard_xcconfig(spec)

end
