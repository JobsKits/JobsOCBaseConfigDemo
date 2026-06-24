require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsFuseAnimation.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsFuseAnimation'
  spec.version          = '1.0.0'
  spec.summary          = 'Long press fuse/ring animations for UIView in Objective-C.'
  spec.description      = <<-DESC
JobsFuseAnimation provides chainable Objective-C UIView animations for long-press fuse ring growth, press-scale feedback and tap sound.
  DESC
  spec.homepage         = 'https://example.local/JobsFuseAnimation'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  if File.exist?(File.join(__dir__, 'JobsFuseAnimation.h'))
    spec.source_files = 'JobsFuseAnimation.h'
    spec.public_header_files = 'JobsFuseAnimation.h'
  end

  spec.header_dir = 'JobsFuseAnimation'
  spec.frameworks = ['UIKit', 'QuartzCore', 'AudioToolbox']

  JobsPodspecKitForJobsFuseAnimation.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.subspec 'Core' do |ss|
    JobsPodspecKitForJobsFuseAnimation.add_dynamic_support_dependencies(ss, spec, support_context)
    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}'
    ss.header_dir = 'JobsFuseAnimation'
  end

  JobsPodspecKitForJobsFuseAnimation.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsFuseAnimation.apply_standard_xcconfig(spec)
end
