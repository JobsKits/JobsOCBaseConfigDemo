require_relative 'JobsPodspecKit'

Pod::Spec.new do |s|
  s.name         = 'BRPickerView'
  s.version      = '3.0.0'
  s.summary      = 'A custom picker view for iOS.'

  s.description  = <<-DESC
                    A custom picker view for iOS, Include "日期选择器，时间选择器，地址选择器，自定义字符串选择器，支持自定义样式，适配深色模式", Support the Objective - C language.
                   DESC

  s.homepage     = 'https://github.com/agiapp/BRPickerView'
  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  s.author       = { '任波' => 'developer@irenb.com' }
  s.social_media_url = 'https://www.irenb.com'

  s.platform     = :ios, '11.0'
  s.source       = { :git => 'https://github.com/agiapp/BRPickerView.git', :tag => s.version.to_s }
  s.requires_arc = true

  s.source_files = [
    'BRPickerView.h',
    'Core/**/*.{h,m,mm}'
  ]
  s.public_header_files = [
    'BRPickerView.h',
    'Core/**/*.h'
  ]
  s.header_dir = 'BRPickerView'

  s.resources = [
    'Resource/BRPickerView.bundle',
    'Resource/PrivacyInfo.xcprivacy'
  ]

  support_context = JobsPodspecKitForBRPickerView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  s.dependency 'JobsModelDSL'

  JobsPodspecKitForBRPickerView.add_support_subspec(s, support_context)

  JobsPodspecKitForBRPickerView.apply_standard_exclude_files(s)
  JobsPodspecKitForBRPickerView.apply_standard_xcconfig(s)
end
