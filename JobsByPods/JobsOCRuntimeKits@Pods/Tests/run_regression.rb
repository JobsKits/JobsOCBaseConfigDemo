# 编译真实 weak holder 实现，验证释放归零和实例隔离。
source = <<~'OBJC'
#import <Foundation/Foundation.h>
#import "JobsWeakAssociation.h"

static void Check(BOOL condition, NSString *message) {
    if (!condition) {
        fprintf(stderr, "%s\n", message.UTF8String);
        exit(1);
    }
}

int main(void) {
    @autoreleasepool {
        static const char key = 0;
        NSObject *first = NSObject.new;
        NSObject *second = NSObject.new;
        Class original = object_getClass(first);
        __weak NSObject *weak;
        @autoreleasepool {
            NSObject *value = NSObject.new;
            weak = value;
            JobsSetAssociatedWeakObject(first, &key, value);
            JobsSetAssociatedWeakObject(second, &key, value);
            Check(JobsGetAssociatedWeakObject(first, &key) == value, @"Wrong value");
            Check(object_getClass(first) == original, @"isa changed");
            first = nil;
            Check(JobsGetAssociatedWeakObject(second, &key) == value, @"Other owner affected");
        }
        Check(weak == nil, @"Value retained by holder");
        Check(JobsGetAssociatedWeakObject(second, &key) == nil, @"Weak value did not zero");
        Check(object_getClass(second) == NSObject.class, @"Second isa changed");
        NSObject *concurrentOwner = NSObject.new;
        dispatch_apply(256, dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0), ^(size_t index) {
            @autoreleasepool {
                NSObject *value = NSObject.new;
                JobsSetAssociatedWeakObject(concurrentOwner, &key, value);
                id read = JobsGetAssociatedWeakObject(concurrentOwner, &key);
                Check(read == nil || [read isKindOfClass:NSObject.class], @"Concurrent read invalid");
                JobsSetAssociatedWeakObject(concurrentOwner, &key, nil);
            }
        });
        JobsSetAssociatedWeakObject(second, &key, nil);
        Check(JobsGetAssociatedWeakObject(second, &key) == nil, @"Clear failed");
        Check(JobsGetAssociatedWeakObject(nil, &key) == nil, @"Nil owner unsafe");
        puts("JobsWeakAssociation: owner isolation, release zeroing, clear, nil, unchanged isa, concurrent holder replacement passed");
    }
    return 0;
}
OBJC
include_directory = File.expand_path('../Core/JobsWeakAssociation', __dir__)
implementation = File.join(include_directory, 'JobsWeakAssociation.m')

require 'tmpdir'
require 'open3'

pod_root = File.expand_path('..', __dir__)
sdk, sdk_error, sdk_status = Open3.capture3('xcrun', '--sdk', 'macosx', '--show-sdk-path')
abort sdk_error unless sdk_status.success?
Dir.mktmpdir('jobs-regression-') do |directory|
  main = File.join(directory, 'main.m')
  executable = File.join(directory, 'regression')
  File.write(main, source)
  arguments = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-isysroot', sdk.strip,
               '-framework', 'Foundation', '-framework', 'Security', '-I', include_directory,
               main, implementation, '-o', executable]
  output, errors, status = Open3.capture3(*arguments)
  warn errors unless errors.empty?
  abort output unless status.success?
  output, errors, status = Open3.capture3(executable)
  print output
  warn errors unless errors.empty?
  abort 'Regression failed' unless status.success?
end
