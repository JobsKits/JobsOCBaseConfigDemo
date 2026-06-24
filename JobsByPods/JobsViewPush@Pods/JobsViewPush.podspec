require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  spec.name             = 'JobsViewPush'
  spec.version          = '1.0.0'
  spec.summary          = 'UIView-level push transitions with directional interactive dismissal.'
  spec.description      = <<-DESC
JobsViewPush lets one UIView push another from any edge, with configurable coverage,
system-like timing, interactive dismissal and background-tap dismissal.
  DESC
  spec.homepage         = 'https://example.local/JobsViewPush'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.source_files        = 'JobsViewPush.h'
  spec.public_header_files = 'JobsViewPush.h'
  spec.header_dir          = 'JobsViewPush'

  spec.frameworks = [
    'UIKit'
  ]
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.header_dir          = 'JobsViewPush'
  end

  JobsPodspecKitForJobsViewPush.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsViewPush.apply_standard_xcconfig(spec)

end
