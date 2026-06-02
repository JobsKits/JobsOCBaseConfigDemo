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

  # 默认安装 Core + Support，让 Pods 工程里能看到 Support 目录。
  # 如果只想装核心源码，可以显式使用：pod 'BRPickerView/Core'
  s.default_subspecs = ['Core', 'Support']

  # 根伞头文件
  s.source_files        = 'BRPickerView.h'
  s.public_header_files = 'BRPickerView.h'

  # iOS App 根目录不能复制名为 Resources 的文件夹，否则 CodeSign 会误判 bundle 结构。
  s.resources = [
    'Resources/BRPickerView.bundle',
    'Resources/PrivacyInfo.xcprivacy'
  ]

  support_context = JobsPodspecKitForBRPickerView.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: ["#{s.name}/Core"]
  )

  s.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m}'
    ss.public_header_files = 'Core/**/*.h'

    ss.dependency 'JobsModel'
  end

  # 动态把 Support 目录按真实目录结构生成为 subspec：
  # BRPickerView/Support/UIKit/NSArray
  JobsPodspecKitForBRPickerView.add_support_subspec(s, support_context)

  JobsPodspecKitForBRPickerView.apply_standard_exclude_files(s)
  JobsPodspecKitForBRPickerView.apply_standard_xcconfig(s)
end
