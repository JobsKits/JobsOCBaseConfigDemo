require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCCountryCodeCtrl.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCCountryCodeCtrl'
  spec.version          = '1.0.0'
  spec.summary          = 'Country code selector controller for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCCountryCodeCtrl provides an independent country-code selector controller, including country-code list resources, JobsBlock callback types, JobsLanMgr language selection, and Jobs DSL integration.
  DESC

  spec.homepage         = 'https://example.local/JobsOCCountryCodeCtrl'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCCountryCodeCtrl.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsOCCountryCodeCtrlHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCCountryCodeCtrlHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCCountryCodeCtrl'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'JobsBlock'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'XYColorOC'

  JobsPodspecKitForJobsOCCountryCodeCtrl.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCCountryCodeCtrl.apply_standard_xcconfig(spec)

end
