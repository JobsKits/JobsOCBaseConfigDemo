require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCDefs.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCDefs'
  spec.version          = '1.0.0'
  spec.summary          = 'Common definitions for Jobs projects.'
  spec.description      = <<-DESC
JobsOCDefs provides shared macros, constants and base definitions.
It also centralizes system-font construction, including arbitrary UIFontWeight values.
  DESC

  spec.homepage         = 'https://example.local/JobsOCDefs'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  JobsPodspecKitForJobsOCDefs.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'XYColorOC'
  spec.dependency 'YTKNetwork'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsGetWindow'

  JobsPodspecKitForJobsOCDefs.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsDefines.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsDefines.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCDefs'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  JobsPodspecKitForJobsOCDefs.apply_standard_xcconfig(spec)

end
