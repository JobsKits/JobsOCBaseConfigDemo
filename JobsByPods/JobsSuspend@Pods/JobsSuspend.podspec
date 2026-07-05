require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/JobsControlTarget/JobsControlTarget.m'
  ]

  support_context = JobsPodspecKitForJobsSuspend.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsOCDSL'
    ],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsSuspend'
  spec.version          = '1.0.0'
  spec.summary          = 'Suspend UI components for Jobs.'
  spec.description      = <<-DESC
JobsSuspend provides suspend button, label and view components.
  DESC

  spec.homepage         = 'https://example.local/JobsSuspend'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  JobsPodspecKitForJobsSuspend.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]
  JobsPodspecKitForJobsSuspend.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsSuspend.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsSuspend.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsSuspend'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'ReactiveObjC'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'


  JobsPodspecKitForJobsSuspend.apply_standard_xcconfig(spec)

end
