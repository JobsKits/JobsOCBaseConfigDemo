require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/BaseUI/BaseView/BaseView.m',
    'Support/UIKit/UIButton/BaseButton/BaseButton.m',
    'Support/UIKit/NSObject/JobsKeychainHelper/JobsKeychainHelper.m'
  ]

  support_context = JobsPodspecKitForJobsBasePopupView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  spec.name             = 'JobsBasePopupView'
  spec.version          = '1.0.0'
  spec.summary          = 'Base popup view component for Jobs projects.'
  spec.description      = <<-DESC
JobsBasePopupView is a local Objective-C UI component library providing
a reusable popup base view with title, subtitle, action buttons, and
model-driven view rendering support.
  DESC

  spec.homepage         = 'https://example.local/JobsBasePopupView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  # Force public headers to be exposed as <JobsBasePopupView/Header.h>.
  spec.header_dir       = 'JobsBasePopupView'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.default_subspecs = 'Core'
  
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsClass'
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsAppTools'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsRichTextUtils'
  spec.dependency 'JobsOCRuntimeKits'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForJobsBasePopupView.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsBasePopupView.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources           = 'Core/**/*.{png,jpg,jpeg,gif,xib,nib,storyboard,xcassets}'
    ss.dependency 'Masonry'

  end

  JobsPodspecKitForJobsBasePopupView.apply_standard_exclude_files(spec)

  pod_header_search_paths = [
    '$(inherited)',
    '"$(PODS_ROOT)/Headers/Public"',
    '"$(PODS_ROOT)/Headers/Private"',
    '"$(PODS_TARGET_SRCROOT)/**"'
  ].join(' ')

  user_header_search_paths = [
    '$(inherited)',
    '"$(PODS_ROOT)/Headers/Public"'
  ].join(' ')

  JobsPodspecKitForJobsBasePopupView.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
