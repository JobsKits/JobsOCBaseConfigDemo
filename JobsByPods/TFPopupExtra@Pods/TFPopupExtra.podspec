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


  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  JobsPodspecKitForTFPopupExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForTFPopupExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'TFPopupExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'TFPopupExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'TFPopupExtra'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'TFPopup'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsCustomView'
  spec.dependency 'JobsFiltrationView'


  JobsPodspecKitForTFPopupExtra.apply_standard_xcconfig(spec)

end
