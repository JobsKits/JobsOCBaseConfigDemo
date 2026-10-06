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

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'Security'
  ]

  JobsPodspecKitForJobsCryptography.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsCryptography.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsCryptography.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsCryptography'


  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'

  JobsPodspecKitForJobsCryptography.apply_standard_xcconfig(spec)

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
