require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  support_context = JobsPodspecKitForJobsOCWebSocket.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsOCWebSocket'
  spec.version          = '1.0.0'
  spec.summary          = 'Lightweight WebSocket lifecycle client for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCWebSocket wraps SocketRocket connection state, heartbeat pings, exponential reconnects, and main-thread delegate callbacks.
  DESC
  spec.homepage         = 'https://example.local/JobsOCWebSocket'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files     = [
    'JobsOCWebSocket.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCWebSocket.h',
    'Core/**/*.h'
  ]
  spec.header_dir       = 'JobsOCWebSocket'
  spec.frameworks       = ['Foundation']

  spec.dependency 'SocketRocket'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'SRWebSocketExtra'

  JobsPodspecKitForJobsOCWebSocket.add_support_subspec(spec, support_context)
  JobsPodspecKitForJobsOCWebSocket.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCWebSocket.apply_standard_xcconfig(spec)

  # 测试单独进入 Stability target，生产包不包含 Tests。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end
end
