require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/BaseUI/BaseTextView/BaseTextView.m'
  ]

  support_context = JobsPodspecKitForMJRefreshExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name         = 'MJRefreshExtra'
  spec.version      = '0.0.1'
  spec.summary      = 'MJRefresh extra categories and protocols.'
  spec.description  = 'Local pod for MJRefresh extra categories and helper protocols.'
  spec.homepage     = 'https://example.local/MJRefreshExtra'
  spec.license      = { :type => 'MIT' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source       = { :path => '.' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]


  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff}'

  JobsPodspecKitForMJRefreshExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'MJRefreshExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'MJRefreshExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'MJRefreshExtra'


  spec.dependency 'TABAnimated'
  spec.dependency 'MJRefresh'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'lottie-ios', '~> 2.5.3'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'XZMRefresh'
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'


  JobsPodspecKitForMJRefreshExtra.apply_standard_exclude_files(spec)

  JobsPodspecKitForMJRefreshExtra.apply_standard_xcconfig(spec)


  # 测试单独进入 Stability target，生产包不包含 Tests。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
