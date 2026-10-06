require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsOCSplash.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCSplash'
  spec.version          = '1.0.0'
  spec.summary          = 'Jobs Objective-C splash screen component.'
  spec.description      = <<-DESC
JobsOCSplash displays local or remote images, GIFs and videos with skip, countdown, tap and shake actions.
  DESC
  spec.homepage         = 'https://example.local/JobsOCSplash'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = ['UIKit', 'AVFoundation', 'ImageIO']
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCTimer'
  spec.resource_bundles = {
    'JobsOCSplashResources' => ['Resource/**/*']
  }

  JobsPodspecKitForJobsOCSplash.add_support_subspec(spec, support_context) if Dir.exist?(File.join(__dir__, 'Support'))

  spec.source_files = [
    'JobsOCSplash.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCSplash.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCSplash'


  JobsPodspecKitForJobsOCSplash.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCSplash.apply_standard_xcconfig(spec)
  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsOCSplashPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])


  # 测试单独进入 Stability target，生产包不包含 Tests。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
