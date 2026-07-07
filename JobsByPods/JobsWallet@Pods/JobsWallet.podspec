require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  support_context = JobsPodspecKitForJobsWallet.build_support_context(
    podspec_dir: File.expand_path(File.dirname(__FILE__)),
    support_dir: 'Support',
    support_dependencies: []
  )

  spec.name             = 'JobsWallet'
  spec.version          = '1.0.0'
  spec.summary          = 'Wallet card stack component for Jobs projects.'
  spec.description      = <<-DESC
JobsWallet is a local Objective-C wallet card component. It renders an array of
JobsWalletCardModel instances and provides two card opening styles: single
selected card expansion and independent keep-open expansion.
  DESC

  spec.homepage         = 'https://example.local/JobsWallet'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  JobsPodspecKitForJobsWallet.add_support_subspec(spec, support_context)

  spec.source_files = [
    'JobsWalletHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsWalletHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsWallet'

  JobsPodspecKitForJobsWallet.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModel'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsWallet.apply_standard_xcconfig(spec)

end
