require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCExcel'
  spec.version          = '1.0.0'
  spec.summary          = 'Reusable spreadsheet UI with arbitrary frozen columns for Jobs Objective-C projects.'
  spec.description      = <<-DESC
                            JobsOCExcel renders fixed-size cells, freezes every column through a caller-selected index, and scrolls the remaining columns horizontally. Every cell supports shrink, single-line truncation, multi-line truncation, or scrolling text.
                          DESC
  spec.homepage         = 'https://example.local/JobsOCExcel'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.header_dir       = 'JobsOCExcel'
  spec.source_files     = ['JobsOCExcel.h', 'Core/**/*.{h,m,mm}']
  spec.public_header_files = ['JobsOCExcel.h', 'Core/**/*.h']
  spec.frameworks       = ['UIKit']
  spec.dependency 'JobsBaseUI'
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCUILabelScrolling'
  spec.dependency 'Masonry'
  JobsPodspecKitForJobsOCExcel.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCExcel.apply_standard_xcconfig(spec)
  # 生产 source_files 不包含 Tests；测试只由显式 Stability 测试目标编译。
  spec.exclude_files = Array(spec.attributes_hash['exclude_files']).reject { |path| path.start_with?('Test/', 'Tests/', 'UnitTests/', 'UITests/') }
  spec.test_spec 'Stability' do |test_spec|
    test_spec.source_files = 'Tests/**/*.{h,m,mm}'
    test_spec.resources = 'Tests/**/*.{xib,storyboard,json,plist}'
    test_spec.frameworks = 'XCTest'
    test_spec.requires_app_host = true
  end

end
