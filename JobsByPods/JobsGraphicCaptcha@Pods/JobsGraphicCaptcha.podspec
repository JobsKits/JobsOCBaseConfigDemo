require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsGraphicCaptcha'
  spec.version          = '1.0.0'
  spec.summary          = 'Graphic captcha generator and view for Jobs projects.'
  spec.description      = <<-DESC
JobsGraphicCaptcha provides separated number, lowercase letter, uppercase letter
and Chinese character pools, configurable random captcha text generation, and a
UIKit captcha drawing view.
  DESC

  spec.homepage         = 'https://example.local/JobsGraphicCaptcha'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.module_name      = 'JobsGraphicCaptcha'

  spec.source_files = [
    'JobsGraphicCaptchaHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsGraphicCaptchaHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsGraphicCaptcha'

  JobsPodspecKitForJobsGraphicCaptcha.apply_standard_exclude_files(spec)

  spec.frameworks = [
    'Foundation',
    'UIKit',
    'QuartzCore'
  ]

  spec.dependency 'JobsOCDefs'

  JobsPodspecKitForJobsGraphicCaptcha.apply_standard_xcconfig(spec)

end
