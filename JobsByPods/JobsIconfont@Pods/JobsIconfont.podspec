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
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
