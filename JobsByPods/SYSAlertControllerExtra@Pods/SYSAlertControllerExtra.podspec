require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForSYSAlertControllerExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'SYSAlertControllerExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'UIAlertController category extensions for Jobs projects.'
  spec.description      = <<-DESC
SYSAlertControllerExtra is a local Objective-C category library providing
UIAlertController helper APIs, alert configuration models, and action sheet
presentation helpers for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/SYSAlertControllerExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForSYSAlertControllerExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForSYSAlertControllerExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'SYSAlertControllerExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'SYSAlertControllerExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'SYSAlertControllerExtra'


  spec.dependency 'WHToast'
  spec.dependency 'WHToastExtra'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'


  JobsPodspecKitForSYSAlertControllerExtra.apply_standard_xcconfig(spec)

end
