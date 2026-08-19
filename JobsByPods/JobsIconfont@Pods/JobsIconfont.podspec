Pod::Spec.new do |spec|
  spec.name         = 'JobsIconfont'
  spec.version      = '1.0.0'
  spec.summary      = 'A typed Objective-C facade for iconfont image and font assets.'
  spec.description  = 'JobsIconfont hides iconfont URLs, Unicode values, font registration, SDWebImage cache details and fallback rendering behind one API.'
  spec.homepage     = 'https://github.com/JobsKits/JobsIconfont'
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.source       = { :path => '.' }

  spec.platform     = :ios, '12.0'
  spec.requires_arc = true
  spec.module_name  = 'JobsIconfont'

  spec.source_files = [
    'JobsIconfontHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsIconfontHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsIconfont'
  spec.resource_bundles = {
    'JobsIconfontAssets' => ['Resource/**/*']
  }
  spec.frameworks = [
    'CoreText',
    'UIKit'
  ]
  spec.dependency 'SDWebImage'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCDefs'
end
