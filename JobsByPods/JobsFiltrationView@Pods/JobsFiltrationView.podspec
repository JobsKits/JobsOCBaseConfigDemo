require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsFiltrationView'
  spec.version          = '1.0.0'
  spec.summary          = 'Filtration view component for Jobs projects.'
  spec.description      = <<-DESC
JobsFiltrationView is a local Objective-C UI component library providing
filtration and filter presentation support for Jobs projects.
  DESC

  spec.homepage         = 'https://example.local/JobsFiltrationView'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.source_files = [
    'JobsFiltrationViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsFiltrationViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir       = 'JobsFiltrationView'
  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForJobsFiltrationView.apply_standard_exclude_files(spec)

  spec.subspec 'Support' do |ss|
    ss.header_mappings_dir = 'Support'
    ss.source_files        = 'Support/**/*.{h,m,mm}'
    ss.exclude_files       = 'Support/BaseUI/BaseView/**/*'
    ss.private_header_files = [
      'Support/NSObject/NSObject+JobsFiltrationBaseViewSupport.h',
      'Support/UIView/UIView+JobsFiltrationBaseViewSupport.h'
    ]

    ss.dependency 'Masonry'
    ss.dependency 'JobsModelDSL'
    ss.dependency 'JobsOCDSL'
    ss.dependency 'JobsMakes'
    ss.dependency 'JobsBlock'
    ss.dependency 'JobsOCDefs'
    ss.dependency 'JobsOCProtocols'
    ss.dependency 'JobsAppTools'
    ss.dependency 'JobsBaseUI'
  end

  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'

  spec.dependency 'Masonry'
  spec.dependency 'XYColorOC'
  spec.dependency 'JobsModelDSL'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsHotLabel'
  spec.dependency 'JobsLanMgr'
  spec.dependency 'JobsBaseUI'

  JobsPodspecKitForJobsFiltrationView.apply_standard_xcconfig(spec)

end
