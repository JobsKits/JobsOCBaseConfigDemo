require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsImageNumberView'
  spec.version          = '1.0.0'
  spec.summary          = 'Jobs Image Number View'
  spec.description      = <<-DESC
JobsImageNumberView is a component for displaying numbers using images.
  DESC

  spec.homepage         = 'https://example.local/JobsImageNumberView'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]
  spec.source_files = [
    'JobsImageNumberViewHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsImageNumberViewHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsImageNumberView'
  spec.resources = 'Resource/**/*.{png,jpg,jpeg,gif,webp,svg,pdf,json,plist,bundle,xib,nib,storyboard,xcassets,strings,stringsdict,ttf,otf,mp3,mp4,wav,caf,aiff,xcprivacy}'

  JobsPodspecKitForJobsImageNumberView.apply_standard_exclude_files(
    spec,
    [
      '**/.DS_Store',
      '**/._*',
      '__MACOSX/**/*',
      '.git/**/*',
      '.svn/**/*',
      'Pods/**/*',
      'Podfile',
      'Podfile.lock',
      '*.xcodeproj/**/*',
      '*.xcworkspace/**/*',
      'DerivedData/**/*',
      'build/**/*',
      'Demo/**/*',
      'Demos/**/*',
      'Example/**/*',
      'Examples/**/*',
      'Sample/**/*',
      'Samples/**/*',
      'Test/**/*',
      'Tests/**/*',
      'UnitTests/**/*',
      'UITests/**/*',
      'README*',
      'CHANGELOG*',
      'Docs/**/*',
      'doc/**/*',
      'Documentation/**/*',
      'Screenshots/**/*',
      'fastlane/**/*',
      '.github/**/*',
      '.gitlab/**/*',
      '.circleci/**/*',
      '.travis.yml',
      'Jenkinsfile',
      'tmp/**/*',
      'temp/**/*',
      '.tmp/**/*',
      '.temp/**/*',
      '*.log',
      '*.bak',
      '*.swp',
      '*.zip',
      '*.tar',
      '*.tar.gz',
      '*.tgz',
      '*.rar',
      '*.7z'
    ]
  )

  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsByOCPods'
  spec.dependency 'JobsOCProtocols'

  JobsPodspecKitForJobsImageNumberView.apply_standard_xcconfig(spec)

end
