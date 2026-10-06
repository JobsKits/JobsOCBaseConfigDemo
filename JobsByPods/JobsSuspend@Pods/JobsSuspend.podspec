require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/JobsControlTarget/JobsControlTarget.m'
  ]

  support_context = JobsPodspecKitForJobsSuspend.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [
      'JobsOCDSL'
    ],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsSuspend'
  spec.version          = '1.0.0'
  spec.summary          = 'Suspend UI components for Jobs.'
  spec.description      = <<-DESC
JobsSuspend provides suspend button, label and view components.
  DESC

  spec.homepage         = 'https://example.local/JobsSuspend'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  JobsPodspecKitForJobsSuspend.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]
  JobsPodspecKitForJobsSuspend.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsSuspend.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsSuspend.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsSuspend'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'


  spec.dependency 'ReactiveObjC'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsRichTextUtils'


  JobsPodspecKitForJobsSuspend.apply_standard_xcconfig(spec)

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
