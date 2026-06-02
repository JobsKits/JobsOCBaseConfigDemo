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
  spec.source_files        = 'JobsModel.h'
  spec.public_header_files = 'JobsModel.h'
  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsModel.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'UIKit',
    'Foundation',
    'AVFoundation',
    'CoreLocation',
    'UserNotifications'
  ]
  JobsPodspecKitForJobsModel.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsModel.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.pod_target_xcconfig = {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/HXPhotoPickerObjC/HXPhotoPicker/**"'
    }

    ss.dependency 'JobsModel/Support/UIKit'

    ss.dependency 'GTCaptcha4'
    ss.dependency 'HXPhotoPickerObjC'
    ss.dependency 'Masonry'
    ss.dependency 'MJExtension'
    ss.dependency 'XYColorOC'
    ss.dependency 'ReactiveObjC'
    ss.dependency 'SDWebImage'
    ss.dependency 'SPAlertController'

    ss.dependency 'JobsMakes'
    ss.dependency 'JobsClass'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsStringUtils'
    ss.dependency 'JobsLoadingImage'
    ss.dependency 'JobsLanMgr'
  end

  JobsPodspecKitForJobsModel.apply_standard_xcconfig(spec)

end
