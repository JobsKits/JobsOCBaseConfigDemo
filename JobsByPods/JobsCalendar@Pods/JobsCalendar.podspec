require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsCalendar'
  spec.version          = '1.0.0'
  spec.summary          = 'Standalone calendar view for Jobs Objective-C projects.'
  spec.description      = <<-DESC
JobsCalendar is a standalone Jobs calendar implementation. It owns its view hierarchy, date rendering, selection, paging, appearance, and safe reload behavior without wrapping a third-party calendar view.
  DESC
  spec.homepage         = 'https://example.local/JobsCalendar'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }
  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.module_name      = 'JobsCalendar'
  spec.source           = { :path => '.' }

  spec.source_files        = [
    'JobsCalendarHeader.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsCalendarHeader.h',
    'Core/**/*.h'
  ]
  spec.header_dir          = 'JobsCalendar'
  spec.frameworks          = ['Foundation', 'UIKit']

  spec.dependency 'JobsOCDefs'


  JobsPodspecKitForJobsCalendar.apply_standard_exclude_files(spec)
  JobsPodspecKitForJobsCalendar.apply_standard_xcconfig(spec)

end
