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
  DESC

  spec.homepage         = 'https://example.local/JobsOCDefs'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.source_files        = 'JobsDefines.h'
  spec.public_header_files = 'JobsDefines.h'

  JobsPodspecKitForJobsOCDefs.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'XYColorOC'
  spec.dependency 'YTKNetwork'
  spec.dependency 'GKNavigationBar'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsGetWindow'

  JobsPodspecKitForJobsOCDefs.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsOCDefs.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,webp,xcassets,bundle,json,plist}'
    ss.dependency 'JobsOCDefs/Support/UIKit'
  end

  JobsPodspecKitForJobsOCDefs.apply_standard_xcconfig(spec)

end
