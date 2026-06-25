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

  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsOCCountryCodeCtrl.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsOCCountryCodeCtrl.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp4,aiff}'

    ss.dependency 'JobsBlock'
    ss.dependency 'JobsByOCPods'
    ss.dependency 'JobsOCDSL'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsLanMgr'
    ss.dependency 'XYColorOC'
  end

  JobsPodspecKitForJobsOCCountryCodeCtrl.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCCountryCodeCtrl.apply_standard_xcconfig(spec)

end
