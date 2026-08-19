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
end
