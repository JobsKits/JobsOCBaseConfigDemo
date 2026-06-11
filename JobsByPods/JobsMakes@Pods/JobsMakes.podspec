require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsMakes.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name         = 'JobsMakes'
  spec.version      = '1.0.0'
  spec.summary      = 'Utility makers, categories and model helpers for Jobs projects.'
  spec.description  = <<-DESC
JobsMakes is a local Objective-C library providing make-style helpers,
UIKit/Foundation categories, and common model base classes for Jobs projects.
  DESC

  spec.homepage     = 'https://example.local/JobsMakes'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.source       = { :path => '.' }

  # 编译出来的模块名
  spec.module_name  = 'JobsMakes'

  spec.default_subspecs = 'Core'

  JobsPodspecKitForJobsMakes.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore',
    'CoreGraphics',
    'JavaScriptCore',
    'MessageUI',
    'AVFoundation',
    'UserNotifications',
    'MapKit',
    'WebKit',
    'Photos',
    'NetworkExtension'
  ]

  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsMakes.apply_standard_xcconfig(spec)

  JobsPodspecKitForJobsMakes.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForJobsMakes.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.dependency 'JobsMakes/Support/UIKit'
  end
end
