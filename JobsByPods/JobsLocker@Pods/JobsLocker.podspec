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

  spec.frameworks = [
    'Foundation'
  ]

  JobsPodspecKitForJobsLocker.apply_standard_exclude_files(spec)

  spec.source_files = [
    'JobsLockerUmbrella.h',
    'Core/**/*.{h,m,mm}'
  ]
  spec.public_header_files = [
    'JobsLockerUmbrella.h',
    'Core/**/*.h'
  ]
  spec.header_dir = 'JobsLocker'

  spec.dependency 'JobsOCDefs'
  spec.dependency 'JobsBlock'

  JobsPodspecKitForJobsLocker.apply_standard_xcconfig(spec)

end
