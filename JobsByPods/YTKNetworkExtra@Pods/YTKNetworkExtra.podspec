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
  spec.default_subspecs = 'Core'

  spec.source_files = [
    'YTKNetworkExtra.h'
  ]

  spec.public_header_files = [
    'YTKNetworkExtra.h'
  ]

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForYTKNetworkExtra.apply_standard_exclude_files(spec)
  JobsPodspecKitForYTKNetworkExtra.add_support_subspec(spec, support_context)

  spec.subspec 'Core' do |ss|
    # Dynamic Support dependencies
    JobsPodspecKitForYTKNetworkExtra.add_dynamic_support_dependencies(ss, spec, support_context)

    ss.source_files = [
      'Core/**/*.{h,m,mm}'
    ]

    ss.public_header_files = [
      'Core/**/*.h'
    ]

    ss.header_dir = 'YTKNetworkExtra'

    ss.frameworks = [
      'Foundation',
      'UIKit'
    ]

    ss.dependency 'JobsModel'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'YTKNetwork'
    ss.dependency 'MJExtension'
    ss.dependency 'AFNetworking'
    ss.dependency 'WHToastExtra'
    ss.dependency 'JobsTimeUtils'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsStringUtils'
    ss.dependency 'JobsLanMgr'
    ss.dependency 'YTKNetworkExtra/Support'
  end

  JobsPodspecKitForYTKNetworkExtra.apply_standard_xcconfig(spec)

end
