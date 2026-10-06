require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsBluetooth.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name = 'JobsBluetooth'
  spec.version = '1.0.0'
  spec.summary = '面向多设备、多协议并支持 DSL 的通用 BLE 基础设施。'
  spec.description = 'JobsBluetooth 封装扫描、连接、服务发现、读写、通知、Mock、设备 Profile 与命令模型。'
  spec.homepage = 'https://github.com/JobsKits'
  spec.license = { :type => 'MIT', :file => 'LICENSE' }
  spec.author = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform = :ios, '12.0'
  spec.requires_arc = true
  spec.source = { :path => '.' }
  spec.frameworks = ['Foundation', 'CoreBluetooth']
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.source_files = ['JobsBluetooth.h', 'Core/**/*.{h,m,mm}']
  spec.public_header_files = ['JobsBluetooth.h', 'Core/**/*.h']
  spec.header_dir = 'JobsBluetooth'
  spec.resource_bundles = { 'JobsBluetoothPrivacy' => ['Resource/*.xcprivacy'] }

  JobsPodspecKitForJobsBluetooth.add_support_subspec(spec, support_context)
  JobsPodspecKitForJobsBluetooth.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsBluetooth.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
