require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsPresentTransitionMgr.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsPresentTransitionMgr'
  spec.version          = '1.0.0'
  spec.summary          = 'Custom present transition manager for Jobs projects.'
  spec.description      = <<-DESC
JobsPresentTransitionMgr is a local Objective-C presentation transition component.
It presents view controllers from top, bottom, left, or right and dismisses them
back to the same direction with configurable duration and visible ratio.
  DESC

  spec.homepage         = 'https://example.local/JobsPresentTransitionMgr'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.source_files = [
    'JobsPresentTransitionMgrHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsPresentTransitionMgrHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsPresentTransitionMgr'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'

  spec.frameworks = [
    'Foundation',
    'QuartzCore',
    'UIKit'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'

  JobsPodspecKitForJobsPresentTransitionMgr.add_support_subspec(spec, support_context)
  JobsPodspecKitForJobsPresentTransitionMgr.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsPresentTransitionMgr.apply_standard_xcconfig(spec)

end
