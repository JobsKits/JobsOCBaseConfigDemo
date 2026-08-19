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
end
