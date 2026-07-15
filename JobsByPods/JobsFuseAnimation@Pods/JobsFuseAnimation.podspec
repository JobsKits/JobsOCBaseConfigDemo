require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsFuseAnimation.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsFuseAnimation'
  spec.version          = '1.1.0'
  spec.summary          = 'Long press fuse/ring animations for UIView in Objective-C.'
  spec.description      = <<-DESC
JobsFuseAnimation provides chainable Objective-C UIView animations for long-press fuse ring growth, press-scale feedback, reusable bubble emission and tap sound.
  DESC
  spec.homepage         = 'https://example.local/JobsFuseAnimation'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = ['UIKit', 'QuartzCore', 'AudioToolbox']
  spec.dependency 'JobsOCDefs'

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
