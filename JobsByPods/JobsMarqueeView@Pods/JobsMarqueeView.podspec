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

  spec.dependency 'Masonry'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCTimerMgr'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

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

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
