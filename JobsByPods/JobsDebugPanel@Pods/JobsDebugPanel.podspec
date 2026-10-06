require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsDebugPanel'
  spec.version          = '1.0.0'
  spec.summary          = 'Debug-only floating tools, environment selection, and ordered custom actions.'
  spec.description      = 'A scene-aware debug UIButton opens a table of environment and custom actions. Release consumers exclude this Pod.'
  spec.homepage         = 'https://example.local/JobsDebugPanel'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files     = ['JobsDebugPanel.h', 'Core/**/*.{h,m}']
  spec.public_header_files = [
    'JobsDebugPanel.h',
    'Core/JobsDebugEnvironment/*.h',
    'Core/JobsDebugAction/*.h',
    'Core/JobsDebugPanelManager/*.h',
    'Core/JobsDebugPanelVC/*.h'
  ]
  spec.private_header_files = [
    'Core/JobsDebugOverlay*/*.h',
    'Core/JobsDebugEnvironmentsVC/*.h',
    'Core/JobsDebugPanelCell/*.h',
    'Core/JobsDebugPanelNavigationController/*.h'
  ]
  spec.header_dir       = 'JobsDebugPanel'
  spec.resource_bundles = { 'JobsDebugPanelResources' => ['Resource/*.png'] }
  spec.frameworks       = ['Foundation', 'UIKit']
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'Masonry'
  spec.dependency 'XYColorOC'
  JobsPodspecKitForJobsDebugPanel.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsDebugPanel.apply_standard_xcconfig(spec)
  spec.resource_bundles = (spec.attributes_hash['resource_bundles'] || {}).merge('JobsDebugPanelPrivacy' => ['Resource/PrivacyInfo.xcprivacy'])

end
