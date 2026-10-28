require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCDeviceGuard'
  spec.version          = '1.0.0'
  spec.summary          = 'Evidence-based Objective-C iOS jailbreak detection.'
  spec.description      = 'Combines observable filesystem, loaded-image and opt-in sandbox-write signals with explicit unavailable and unsupported results.'
  spec.homepage         = 'https://example.local/JobsOCDeviceGuard'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files     = ['JobsOCDeviceGuard.h', 'Core/**/*.{h,m,mm}']
  spec.public_header_files = ['JobsOCDeviceGuard.h', 'Core/**/*.h']
  spec.header_dir       = 'JobsOCDeviceGuard'
  spec.frameworks       = ['Foundation']
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsOCDeviceGuard.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCDeviceGuard.apply_standard_xcconfig(spec)

  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
