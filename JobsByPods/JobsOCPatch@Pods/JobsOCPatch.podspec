require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsOCPatch.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCPatch'
  spec.version          = '1.0.0'
  spec.summary          = 'Runtime payload patch engine for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCPatch provides a small Objective-C runtime patch manager that can temporarily replace a whitelisted method implementation with a local payload provider and roll it back.
  DESC

  spec.homepage         = 'https://example.local/JobsOCPatch'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation'
  ]

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsOCPatch.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsOCPatch.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCPatch.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCPatch'


  JobsPodspecKitForJobsOCPatch.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCPatch.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
