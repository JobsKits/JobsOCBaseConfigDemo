require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|

  spec.name             = 'JobsOCOpen'
  spec.version          = '1.0.0'
  spec.summary          = 'Objective-C URL opening component for Jobs projects.'
  spec.description      = <<-DESC
JobsOCOpen ports JobsSwiftOpen to Objective-C and provides in-app web opening, external URL opening, phone dialing, and mail launching helpers.
  DESC

  spec.homepage         = 'https://example.local/JobsOCOpen'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.default_subspecs = 'Core'

  if File.exist?(File.join(__dir__, 'JobsOCOpen.h'))
    spec.source_files = 'JobsOCOpen.h'
    spec.public_header_files = 'JobsOCOpen.h'
  end

  spec.header_dir = 'JobsOCOpen'

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'WebKit',
    'MessageUI'
  ]

  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsGetWindow'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsStringUtils'

  spec.subspec 'Core' do |ss|
    ss.source_files = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.resources = 'Core/**/*.{png,jpg,jpeg,webp,gif,wav,mp3,caf,json,plist,xib,storyboard,bundle}'
    ss.header_dir = 'JobsOCOpen'
  end

  JobsPodspecKitForJobsOCOpen.apply_standard_exclude_files(spec)

  JobsPodspecKitForJobsOCOpen.apply_standard_xcconfig(
    spec,
    pod_target_xcconfig: {
      'DEFINES_MODULE' => 'YES',
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    },
    user_target_xcconfig: {
      'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
    }
  )

end
