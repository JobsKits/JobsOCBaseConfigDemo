require_relative 'JobsPodspecKit'

Pod::Spec.new do |spec|
  spec.name             = 'JobsLocker'
  spec.version          = '1.0.0'
  spec.summary          = 'A lightweight Objective-C locking utility with a per-instance once extension.'
  spec.description      = <<-DESC
JobsLocker is a lightweight Objective-C synchronization utility that provides
multiple lock strategies through a unified API, including NSLock,
NSRecursiveLock, pthread mutex, os_unfair_lock, and dispatch semaphore.
It also includes a per-instance once extension implemented as a category,
so the same locker can optionally coordinate one-time execution semantics.
  DESC

  spec.homepage         = 'https://github.com/JobsKits/JobsLocker'
  spec.license          = { :type => 'MIT', :file => 'LICENSE' }
  spec.author           = { 'Jobs' => 'lg295060456@gmail.com' }

  spec.platform         = :ios, '12.0'
  spec.requires_arc     = true
  spec.source           = { :path => '.' }
  spec.default_subspecs = 'Core'

  spec.frameworks = [
    'Foundation'
  ]

  JobsPodspecKitForJobsLocker.apply_standard_exclude_files(spec)

  spec.subspec 'Core' do |ss|
    ss.source_files        = 'Core/**/*.{h,m,mm}'
    ss.public_header_files = 'Core/**/*.h'
    ss.dependency 'JobsOCDefs'
  end

  JobsPodspecKitForJobsLocker.apply_standard_xcconfig(spec)

end
