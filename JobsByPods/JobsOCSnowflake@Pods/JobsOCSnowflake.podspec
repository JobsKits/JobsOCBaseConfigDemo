require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCSnowflake'
  spec.version          = '1.0.0'
  spec.summary          = 'Snowflake ID generator for Jobs.'
  spec.description      = <<-DESC
JobsOCSnowflake provides Snowflake ID generation utilities.
  DESC

  spec.homepage         = 'https://example.local/JobsOCSnowflake'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCSnowflake.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  JobsPodspecKitForJobsOCSnowflake.apply_standard_xcconfig(spec)

end
