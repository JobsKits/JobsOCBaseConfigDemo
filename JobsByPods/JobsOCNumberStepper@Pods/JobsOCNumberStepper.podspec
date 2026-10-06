require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCNumberStepper'
  spec.version          = '1.0.0'
  spec.summary          = 'Bounded integer stepper control for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCNumberStepper combines a decrease button, numeric text field, and increase
button. Optional lower and upper bounds automatically disable the related button.
  DESC

  spec.homepage         = 'https://example.local/JobsOCNumberStepper'
  spec.license          = { :type => 'MIT' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsOCNumberStepper'

  spec.source_files = [
    'JobsOCNumberStepperHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCNumberStepperHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsOCNumberStepper'

  JobsPodspecKitForJobsOCNumberStepper.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit'
  ]

  spec.dependency 'Masonry'
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsOCNumberStepper.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
