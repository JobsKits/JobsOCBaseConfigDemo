require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  spec.name             = 'JobsMarqueeView'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C marquee and carousel view powered by JobsOCTimerMgr.'
  spec.description      = <<-DESC
JobsMarqueeView unifies marquee and carousel scenes with UIButton data sources,
UIScrollView layout, PageControl support, manual drag handling, and centralized
timer lifecycle management through JobsOCTimerMgr.
  DESC
  spec.homepage         = 'https://example.local/JobsMarqueeView'
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

  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCTimerMgr'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'JobsMarqueeView.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsMarqueeView.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsMarqueeView'

  JobsPodspecKitForJobsMarqueeView.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsMarqueeView.apply_standard_xcconfig(spec)

end
