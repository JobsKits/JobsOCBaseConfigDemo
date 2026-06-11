require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForTFPopupExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'TFPopupExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'TFPopup category extensions for Jobs projects.'
  spec.description      = <<-DESC
TFPopupExtra is a local Objective-C category library providing TFPopup helper
methods for popup views, toast presentation, filtration views, and custom views.
  DESC

  spec.homepage         = 'https://example.local/TFPopupExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.source_files = [
    'TFPopupExtra.h'
  ]

  spec.public_header_files = [
    'TFPopupExtra.h'
  ]

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  JobsPodspecKitForTFPopupExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForTFPopupExtra.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForTFPopupExtra.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}'

    ss.dependency 'TFPopup'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'JobsOCDSL'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsByOCPods'
    ss.dependency 'JobsCustomView'
    ss.dependency 'JobsFiltrationView'

  end

  JobsPodspecKitForTFPopupExtra.apply_standard_xcconfig(spec)

end
