require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForBRPickerViewExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'XYColorOC',
      'BRPickerView',
      'JobsBlock',
      'JobsMakes',
      'JobsOCDefs',
      'JobsModelDSL',
      'JobsLanMgr'
    ]
  )

  spec.name             = 'BRPickerViewExtra'
  spec.version          = '1.0.1'
  spec.summary          = 'BRPickerView category extensions for Jobs projects.'
  spec.description      = <<-DESC
BRPickerViewExtra is a local Objective-C category library providing BRPickerView
helper methods, picker style builders, and associated-object convenience APIs.
This version is adapted to the latest BRPickerView where BRStringPickerView and
BRAddressPickerView have been replaced by BRTextPickerView-based APIs.
  DESC

  spec.homepage         = 'https://example.local/BRPickerViewExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForBRPickerViewExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForBRPickerViewExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'BRPickerViewExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'BRPickerViewExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'BRPickerViewExtra'


  spec.dependency 'XYColorOC'
  spec.dependency 'BRPickerView'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForBRPickerViewExtra.apply_standard_xcconfig(spec)

end
