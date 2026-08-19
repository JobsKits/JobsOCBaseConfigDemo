require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForYTKNetworkExtra.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'YTKNetworkExtra'
  spec.version          = '1.0.0'
  spec.summary          = 'YTKNetwork extra request helpers for Jobs projects.'
  spec.description      = <<-DESC
YTKNetworkExtra is a local Objective-C extension library that provides base request
classes, request parameter helpers, upload request support, response model mapping,
and loading accessories on top of YTKNetwork.
  DESC

  spec.homepage         = 'https://example.local/YTKNetworkExtra'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForYTKNetworkExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForYTKNetworkExtra.add_support_subspec(spec, support_context)

  spec.source_files = [
    'YTKNetworkExtra.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'YTKNetworkExtra.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'YTKNetworkExtra'


  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'YTKNetwork'
  spec.dependency 'MJExtension'
  spec.dependency 'AFNetworking'
  spec.dependency 'WHToastExtra'
  spec.dependency 'JobsTimeUtils'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsStringUtils'
  spec.dependency 'JobsLanMgr'

  JobsPodspecKitForYTKNetworkExtra.apply_standard_xcconfig(spec)

end
