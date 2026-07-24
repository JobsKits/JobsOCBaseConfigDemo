require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsAppDoor'
  spec.version          = '1.0.0'
  spec.summary          = 'Configurable login, register, and password recovery templates for Jobs projects.'
  spec.description      = <<-DESC
JobsAppDoor provides morphing-panel and sliding-card authentication templates,
shared form controls, optional mobile binding, configurable graphic captcha
composition, password recovery, image backgrounds, and video backgrounds.
  DESC

  spec.homepage         = 'https://example.local/JobsAppDoor'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.static_framework = true
  spec.module_name      = 'JobsAppDoor'

  spec.source_files = [
    'JobsAppDoor.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsAppDoor.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsAppDoor'
  spec.subspec 'Resource' do |ss|
    ss.resource_bundles = {
      'JobsAppDoorResources' => [
        'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'
      ]
    }
  end

  JobsPodspecKitForJobsAppDoor.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'ReactiveObjC'
  spec.dependency 'ZFPlayer'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsModel'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsCountdownBtn'
  spec.dependency 'JobsOCGraphicCaptcha'
  spec.dependency 'JobsOCKeyboardMgr'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCTools'
  spec.dependency 'JobsHotLabel'
  spec.dependency 'JobsDeviceInfo'
  spec.dependency 'JobsOCProtocols'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsOCCountryCodeCtrl'
  spec.dependency 'JobsFuseAnimation'
  spec.dependency 'ZFPlayerExtra'
  spec.dependency 'XYColorOC'

  JobsPodspecKitForJobsAppDoor.apply_standard_xcconfig(spec)
end
