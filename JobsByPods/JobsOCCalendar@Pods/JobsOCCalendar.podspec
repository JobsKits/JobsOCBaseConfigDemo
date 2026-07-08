require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsOCCalendar'
  spec.version          = '1.0.0'
  spec.summary          = 'Standalone calendar view for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsOCCalendar is a standalone Jobs calendar implementation. It owns its view hierarchy, date rendering, selection, paging, appearance, and safe reload behavior without wrapping a third-party calendar view.
  DESC
  spec.homepage         = 'https://example.local/JobsOCCalendar'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'JobsOCCalendar'
  spec.source           = { :path => '.' }

  spec.source_files        = [
    'JobsOCCalendarHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsOCCalendarHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir          = 'JobsOCCalendar'
  spec.frameworks          = ['Foundation', 'UIKit']

  spec.dependency 'JobsOCDefs'


  JobsPodspecKitForJobsOCCalendar.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsOCCalendar.apply_standard_xcconfig(spec)

end
