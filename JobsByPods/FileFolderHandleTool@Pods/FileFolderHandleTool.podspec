require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'FileFolderHandleTool'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C file and folder handle tool for Jobs projects.'
  spec.description      = <<-DESC
FileFolderHandleTool is a local Objective-C utility component used to handle
file and folder related operations in Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/FileFolderHandleTool'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit',
    'Photos',
    'AVFoundation'
  ]

  JobsPodspecKitForFileFolderHandleTool.apply_standard_exclude_files(spec)

  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'TXFileOperation'

  spec.source_files = [
    'FileFolderHandleToolHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'FileFolderHandleToolHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'FileFolderHandleTool'

  JobsPodspecKitForFileFolderHandleTool.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/Core"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public" "$(PODS_ROOT)/Headers/Public/FileFolderHandleTool"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
