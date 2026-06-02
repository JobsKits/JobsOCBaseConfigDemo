require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForFDFullscreenPopGesture.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'FDFullscreenPopGesture'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C fullscreen pop gesture components for Jobs projects.'
  spec.description      = <<-DESC
FDFullscreenPopGesture is a local Objective-C gesture component library that provides
fullscreen pop gesture support for UINavigationController and simultaneous gesture
handling support for UIScrollView.
  DESC

  spec.homepage         = 'https://example.local/FDFullscreenPopGesture'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = {
    :git => 'https://example.local/FDFullscreenPopGesture.git',
    :tag => spec.version.to_s
  }

  spec.frameworks       = ['UIKit']

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  spec.source_files = [
    'FDFullscreenPopGesture.h'
  ]

  spec.public_header_files = [
    'FDFullscreenPopGesture.h'
  ]

  spec.default_subspecs = 'Core'

  JobsPodspecKitForFDFullscreenPopGesture.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForFDFullscreenPopGesture.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.dependency 'FDFullscreenPopGesture/Support/UIKits/NSObject'
    ss.dependency 'FDFullscreenPopGesture/Support/UIKits/UIViewController'

    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]
  end

  JobsPodspecKitForFDFullscreenPopGesture.apply_standard_exclude_files(spec)
  JobsPodspecKitForFDFullscreenPopGesture.apply_standard_xcconfig(spec)
end
