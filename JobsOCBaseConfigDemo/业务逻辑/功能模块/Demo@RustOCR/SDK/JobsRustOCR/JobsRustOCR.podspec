require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsRustOCR.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name = 'JobsRustOCR'
  spec.version = '0.1.0'
  spec.summary = 'Offline Indra OCR pipeline rewritten in Rust with a shared C ABI.'
  spec.description = 'Apple image bridge for the shared Jobs Rust OCR core. Models and sample resources run locally.'
  spec.homepage = 'https://github.com/datalab-to/indra'
  spec.license = { :type => 'Apache-2.0', :file => 'LICENSE' }
  spec.author = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source = { :path => '.' }
  spec.ios.deployment_target = '15.1'
  spec.osx.deployment_target = '14.0'
  spec.requires_arc = true
  spec.static_framework = true

  JobsPodspecKitForJobsRustOCR.add_support_subspec(spec, support_context)

  spec.source_files = 'Core/**/*.{h,m,mm}'
  spec.public_header_files = 'Core/**/*.h'
  spec.header_dir = 'JobsRustOCR'
  spec.vendored_frameworks = 'Frameworks/JobsOCRCore.xcframework'
  spec.resources = 'Resource/JobsRustOCRResources.bundle'
  spec.ios.frameworks = ['UIKit', 'ImageIO', 'CoreGraphics']
  spec.osx.frameworks = ['AppKit', 'ImageIO', 'CoreGraphics']
  spec.weak_frameworks = ['CoreML']
  spec.libraries = ['c++']

  JobsPodspecKitForJobsRustOCR.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsRustOCR.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: JobsPodspecKitForJobsRustOCR.standard_pod_target_xcconfig.merge(
      'CLANG_CXX_LANGUAGE_STANDARD' => 'c++17',
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_TARGET_SRCROOT)/**" "$(PODS_TARGET_SRCROOT)/Support/**"'
    )
  )
end
