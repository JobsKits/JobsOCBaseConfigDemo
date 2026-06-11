require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_exclude_files = [
    'Support/FileFolderHandleTool/FileFolderHandleTool.m'
  ]

  support_context = JobsPodspecKitForJobsByOCPods.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: [],
    support_exclude_files: support_exclude_files
  )

  source_file_extensions = 'h,m,mm'
  resource_file_extensions = 'png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict'

  glob_pattern = lambda do |relative_path, recursive, extensions|
    recursive ? "#{relative_path}/**/*.{#{extensions}}" : "#{relative_path}/*.{#{extensions}}"
  end

  glob_exists = lambda do |pattern|
    Dir.glob(File.join(__dir__, pattern)).any?
  end

  has_pod_content = lambda do |relative_path, recursive|
    [
      glob_pattern.call(relative_path, recursive, source_file_extensions),
      glob_pattern.call(relative_path, recursive, resource_file_extensions)
    ].any? { |pattern| glob_exists.call(pattern) }
  end

  folder_subspec_names = lambda do |relative_path|
    absolute_path = File.join(__dir__, relative_path)

    next [] unless Dir.exist?(absolute_path)

    Dir.children(absolute_path).select do |name|
      child_path = File.join(absolute_path, name)
      next false unless File.directory?(child_path)
      next false if name.start_with?('.') || name.start_with?('__')

      has_pod_content.call("#{relative_path}/#{name}", true)
    end.sort
  end

  configure_files = lambda do |ss, relative_path, recursive|
    source_files = glob_pattern.call(relative_path, recursive, source_file_extensions)
    public_header_files = recursive ? "#{relative_path}/**/*.h" : "#{relative_path}/*.h"
    resources = glob_pattern.call(relative_path, recursive, resource_file_extensions)

    ss.source_files = source_files if glob_exists.call(source_files)
    ss.public_header_files = public_header_files if glob_exists.call(public_header_files)
    ss.resources = resources if glob_exists.call(resources)
  end

  core_subspec_names = folder_subspec_names.call('Core')
  support_subspec_names = folder_subspec_names.call('Support')

  spec.name         = 'JobsByOCPods'
  spec.version      = '0.0.2'
  spec.summary      = 'Jobs OC Base Customize UIKit Core (local pod)'
  spec.description  = 'Local pod wrapper for JobsOCBaseCustomizeUIKitCore categories/base components.'
  spec.homepage     = 'https://example.local/JobsOCBaseCustomizeUIKitCore'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.source       = { :git => "file://#{__dir__}", :tag => spec.version.to_s }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true

  spec.frameworks = [
    'Foundation',
    'QuartzCore',
    'CoreFoundation',
    'MessageUI',
    'JavaScriptCore',
    'WebKit',
    'UIKit'
  ]

  spec.source_files = [
    'JobsByOCPods.h',
    'Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h'
  ]

  spec.public_header_files = [
    'JobsByOCPods.h',
    'Support/播放器控制层/ZFCustomControlView/ZFCustomControlView.h'
  ]

  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsByOCPods.apply_standard_exclude_files(spec)

  common_dependencies = [
    'DeviceKit',
    'FMDB',
    'FSCalendar',
    'GKCustomNavigationBarExtra',
    'GKNavigationBar',
    'GKPhotoBrowser',
    'IQKeyboardManager',
    'JPImageresizerView',
    'JXCategoryView',
    'JXPagingView/Pager',
    'ReactiveObjC',
    ['lottie-ios', '~> 2.5.3'],
    'Masonry',
    'MGSwipeTableCell',
    'MJExtension',
    'MJRefresh',
    'PPBadgeView',
    'Reachability',
    'SDWebImage',
    'SocketRocket',
    'SZTextView',
    'TABAnimated',
    'TXFileOperation',
    'UITextView+Placeholder',
    'WHToast',
    'XYColorOC',
    'XZMRefresh',
    'YYImage',
    'ZBNetworking',
    'ZFPlayer',
    'ZFPlayer/AVPlayer',
    'ZFPlayer/ControlView',
    'ZFPlayer/ijkplayer',
    'ZMJGanttChart',
    'TFPopup',
    'BRPickerView',

    'JobsAPIs',
    'JobsModelDSL',
    'JobsBlock',
    'JobsOCDSL',
    'JobsMakes',
    'JobsDebug',
    'JobsClass',
    'JobsOCDefs',
    'JobsOCProtocols',
    'JobsBaseUI',
    'JobsOCTimer',
    'JobsAppTools',
    'JobsTimeUtils',
    'JobsDeviceInfo',
    'JobsOCSnowflake',
    'JobsRandomUtils',
    'JobsStringUtils',
    'JobsRichTextUtils',
    'JobsViewNavigator',
    'JobsOCRuntimeKits',
    'JobsLanMgr',
    'JobsDropDownListView',
    'JobsNavigationTransitionMgr',
    'WHToastExtra/Core',
    'ZFPlayerExtra',
    'YTKNetworkExtra',
    'BRPickerViewExtra',
    'This'
  ]

  add_common_dependencies = lambda do |ss|
    if support_subspec_names.include?('JobsSEL_IMP')
      ss.dependency 'JobsByOCPods/Support/JobsSEL_IMP'
    end

    common_dependencies.each do |dependency|
      if dependency.is_a?(Array)
        ss.dependency dependency[0], dependency[1]
      else
        ss.dependency dependency
      end
    end
  end
  JobsPodspecKitForJobsByOCPods.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsByOCPods.add_dynamic_support_dependencies(ss, spec, support_context)
    add_common_dependencies.call(ss)

    configure_files.call(ss, 'Core', false)

    core_subspec_names.each do |subspec_name|
      ss.subspec subspec_name do |sss|
        configure_files.call(sss, "Core/#{subspec_name}", true)
        add_common_dependencies.call(sss)
      end
    end
  end

  JobsPodspecKitForJobsByOCPods.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsByOCPods.apply_standard_xcconfig(spec)

end
