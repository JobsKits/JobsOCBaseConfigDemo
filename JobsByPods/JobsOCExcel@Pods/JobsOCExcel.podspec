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
  spec.dependency 'JobsMakes'
  spec.dependency 'JobsOCDSL'
  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'
  spec.dependency 'JobsOCUILabelScrolling'
  spec.dependency 'Masonry'
  JobsPodspecKitForJobsOCExcel.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCExcel.apply_standard_xcconfig(spec)
end
