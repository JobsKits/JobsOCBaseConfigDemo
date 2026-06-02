require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'This'
  spec.version          = '1.0.0'
  spec.summary          = 'This base object for Jobs Objective-C projects.'
  spec.description      = <<-DESC
This provides the base This object used by Jobs Objective-C projects.
  DESC

  spec.homepage         = 'https://example.local/This'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  JobsPodspecKitForThis.apply_standard_exclude_files(
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
      '*.podspec',
      '*.xcodeproj/**/*',
      '*.xcworkspace/**/*',
      'DerivedData/**/*',
      'build/**/*',
      '.codex-derived-data/**/*',
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
      'Images/**/*',
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

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
  end

  JobsPodspecKitForThis.apply_standard_xcconfig(spec)

end
