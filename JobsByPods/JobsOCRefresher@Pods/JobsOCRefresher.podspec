require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCRefresher.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCRefresher'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C refresh component library for Jobs projects.'
  spec.description      = <<-DESC
JobsOCRefresher provides UIKit refresh and load-more components for Jobs Objective-C projects,
including vertical and horizontal pull gestures, configurable states, default skins,
and extension points for Lottie, GIF, frame images, and network images.
  DESC

  spec.homepage         = 'https://example.local/JobsOCRefresher'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.source_files        = 'JobsOCRefresher.h'
  spec.public_header_files = 'JobsOCRefresher.h'
  spec.header_dir          = 'JobsOCRefresher'

  spec.frameworks = [
    'AudioToolbox',
    'Foundation',
    'ImageIO',
    'UIKit'
  ]

  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCRefresher.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsOCRefresher.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = ['JobsOCRefresher.h', 'Core/**/*.{h,m,mm}']
    ss.public_header_files = ['JobsOCRefresher.h', 'Core/**/*.h']
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle,xcassets,strings,stringsdict}'
    ss.header_dir          = 'JobsOCRefresher'
  end

  spec.subspec 'Lottie' do |ss|
    ss.dependency 'JobsOCRefresher/Core'
    ss.dependency 'lottie-ios', '~> 2.5.3'
  end

  spec.subspec 'SDWebImage' do |ss|
    ss.dependency 'JobsOCRefresher/Core'
    ss.dependency 'SDWebImage'
  end

  spec.subspec 'FrameAnimation' do |ss|
    ss.dependency 'JobsOCRefresher/Core'
    ss.dependency 'JobsOCTimer/Core'
    ss.dependency 'JobsOCTimerMgr/Core'
  end

  JobsPodspecKitForJobsOCRefresher.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCRefresher.apply_standard_xcconfig(spec)

end
