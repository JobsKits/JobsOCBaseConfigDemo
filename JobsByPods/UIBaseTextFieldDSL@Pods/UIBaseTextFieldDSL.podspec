require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'UIBaseTextFieldDSL'
  spec.version          = '1.0.0'
  spec.summary          = 'Jobs chain DSL categories for JobsBaseUI text field classes.'
  spec.description      = 'Local Objective-C DSL pod for JobsBaseUI text field families, split from JobsOCDSL to keep JobsBaseUI-specific DSL isolated.'
  spec.homepage         = 'https://example.local/UIBaseTextFieldDSL'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'UIBaseTextFieldDSL'
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'

  spec.source_files = [
    'UIBaseTextFieldDSL.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'UIBaseTextFieldDSL.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'UIBaseTextFieldDSL'


  JobsPodspecKitForUIBaseTextFieldDSL.apply_standard_exclude_files(spec)
  JobsPodspecKitForUIBaseTextFieldDSL.apply_standard_xcconfig(
    spec,
    user_target_xcconfig: {
      'HEADER_SEARCH_PATHS' => '$(inherited) "$(PODS_ROOT)/Headers/Public/UIBaseTextFieldDSL/**"',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES',
      'OTHER_LDFLAGS' => '$(inherited) -ObjC'
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
