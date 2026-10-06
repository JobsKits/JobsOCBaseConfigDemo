require_relative 'JobsPodspecKit'

Pod::Spec.new do |s|
  s.name = 'JobsOCAudioRecorder'
  s.version = '0.1.0'
  s.summary = 'Decoupled Objective-C audio recording and local audio management.'
  s.homepage = 'https://github.com/JobsKits/JobsOCAudioRecorder'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Jobs' => 'lg295060456@gmail.com' }
  s.platform = :ios, '12.0'
  s.source = { :git => 'https://github.com/JobsKits/JobsOCAudioRecorder.git', :tag => s.version.to_s }
  s.source_files = 'Core/**/*.{h,m}'
  s.public_header_files = 'Core/**/*.h'
  s.frameworks = 'AVFoundation', 'UIKit'
  s.dependency 'JobsOCTimer'
  s.dependency 'JobsOCDSL'
  s.dependency 'JobsBlock'
  s.dependency 'JobsOCDefs'
  JobsPodspecKitForJobsOCAudioRecorder.apply_standard_exclude_files(s)
  JobsPodspecKitForJobsOCAudioRecorder.apply_standard_xcconfig(s)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  s.exclude_files = Array(s.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  s.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

  s.resource_bundles = (s.attributes_hash['resource_bundles'] || {}).merge('JobsOCAudioRecorderPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])
end
