require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsCryptography'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C cryptography, digest, encoding, and data conversion helpers.'
  spec.description      = <<-DESC
JobsCryptography is a lightweight Objective-C utility collection for AES, DES, RSA, MD5, SHA, Base16/32/64/85, MIME, and hexadecimal conversions.
  DESC

  spec.homepage         = 'https://example.local/JobsCryptography'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'
  spec.source_files        = 'JobsCryptography.h'
  spec.public_header_files = 'JobsCryptography.h'

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'Security'
  ]

  JobsPodspecKitForJobsCryptography.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsBlock'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsByOCPods'
  end

  JobsPodspecKitForJobsCryptography.apply_standard_xcconfig(spec)

end
