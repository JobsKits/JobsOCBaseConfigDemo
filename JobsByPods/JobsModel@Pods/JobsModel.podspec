require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsModel.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsModel'
  spec.version          = '1.0.0'
  spec.summary          = 'Shared model aggregation library for Jobs projects.'
  spec.description      = <<-DESC
JobsModel is a local Objective-C model aggregation library that provides DAO models,
JSON models, UIKit view models, rich text models, third-party config models and
other business models used across Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsModel'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsModel.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'UIKit',
    'Foundation',
    'AVFoundation',
    'CoreLocation',
    'UserNotifications'
  ]
  JobsPodspecKitForJobsModel.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsModel.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsModel.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsModel'


  spec.pod_target_xcconfig = {
    'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/HXPhotoPickerObjC/HXPhotoPicker/**"'
  }


  spec.dependency 'GTCaptcha4'
  spec.dependency 'HXPhotoPickerObjC'
  spec.dependency 'Masonry'
  spec.dependency 'MJExtension'
  spec.dependency 'XYColorOC'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'SDWebImage'
  spec.dependency 'SPAlertController'

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsClass'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLoadingImage'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForJobsModel.apply_standard_xcconfig(spec)

  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsModelPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])


  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
