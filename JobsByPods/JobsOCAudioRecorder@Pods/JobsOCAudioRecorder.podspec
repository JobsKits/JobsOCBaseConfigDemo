require_relative 'JobsPodspecKit'

Pod::Spec.new do |s|
  s.name = 'JobsOCAudioRecorder'
  s.version = '0.1.0'
  s.summary = 'Decoupled Objective-C audio recording and local audio management.'
  s.homepage = 'https://github.com/JobsKits/JobsOCAudioRecorder'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'Jobs' => 'lg295060456@gmail.com' }
  s.platform = :ios, '12.0'
  s.source = { :git => 'https://github.com/JobsKits/JobsOCAudioRecorder.git', :tag => s.version.to_s }
  s.source_files = 'Core/**/*.{h,m}'
  s.public_header_files = 'Core/**/*.h'
  s.frameworks = 'AVFoundation', 'UIKit'
  s.dependency 'JobsOCTimer'
  s.dependency 'JobsOCDSL'
  s.dependency 'JobsBlock'
  s.dependency 'JobsOCDefs'
  JobsPodspecKitForJobsOCAudioRecorder.apply_standard_exclude_files(s)
  JobsPodspecKitForJobsOCAudioRecorder.apply_standard_xcconfig(s)
end
