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
  spec.default_subspecs = 'Core'

  spec.source_files = 'BRPickerViewExtra.h'
  spec.public_header_files = 'BRPickerViewExtra.h'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForBRPickerViewExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForBRPickerViewExtra.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForBRPickerViewExtra.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets,json,plist}'

    ss.dependency 'XYColorOC'
    ss.dependency 'BRPickerView'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsLanMgr'
  end

  JobsPodspecKitForBRPickerViewExtra.apply_standard_xcconfig(spec)

end
