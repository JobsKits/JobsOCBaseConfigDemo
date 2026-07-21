require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsFuseAnimation.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsFuseAnimation'
  spec.version          = '1.1.0'
  spec.summary          = 'Reusable UIView animations and pluggable refresh renderers for Objective-C.'
  spec.description      = <<-DESC
JobsFuseAnimation provides chainable Objective-C UIView animations and a protocol-driven refresh renderer family covering system, image sequence, GIF, Lottie, Today News style and Douyin style animations.
  DESC
  spec.homepage         = 'https://example.local/JobsFuseAnimation'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = ['UIKit', 'QuartzCore', 'AudioToolbox', 'ImageIO']
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCTimer'
  spec.dependency 'lottie-ios', '~> 2.5.3'

  JobsPodspecKitForJobsFuseAnimation.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsFuseAnimation.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsFuseAnimation.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsFuseAnimation'


  JobsPodspecKitForJobsFuseAnimation.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsFuseAnimation.apply_standard_xcconfig(spec)
end
