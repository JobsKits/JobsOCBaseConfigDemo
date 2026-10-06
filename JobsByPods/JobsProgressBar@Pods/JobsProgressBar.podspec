require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsProgressBar'
  spec.version          = '1.0.0'
  spec.summary          = 'Custom Objective-C progress bar with value labels, directions and dragging.'
  spec.description      = <<-DESC
JobsProgressBar provides a chainable Objective-C progress bar component with system-like progress display, direction switching, value labels, thumb dragging and auto progress.
  DESC

  spec.homepage         = 'https://example.local/JobsProgressBar'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsProgressBar.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'JobsProgressBarHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsProgressBarHeader.h',
    'Core/JobsProgressBar/**/*.h'
  ]
  spec.private_header_files = 'Core/JobsProgressBarDisplayLinkTarget/*.h'
  spec.header_dir = 'JobsProgressBar'

  JobsPodspecKitForJobsProgressBar.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
