require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsDropDownListView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsDropDownListView'
  spec.version          = '1.0.0'
  spec.summary          = 'JobsDropDownListView'
  spec.description      = 'JobsDropDownListView'
  spec.homepage         = 'https://example.local/JobsDropDownListView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source           = { :path => '.' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true

  spec.frameworks = [
    'QuartzCore',
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'MJRefresh'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'


  JobsPodspecKitForJobsDropDownListView.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsDropDownListViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsDropDownListViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsDropDownListView'


  JobsPodspecKitForJobsDropDownListView.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsDropDownListView.apply_standard_xcconfig(spec)

end
