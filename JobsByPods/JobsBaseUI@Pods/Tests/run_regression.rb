#!/usr/bin/env ruby
# JobsBaseUI 的原始生产安全解档内核回归；不访问系统 Keychain。
# Created by Jobs on 2026年10月5日，星期一.

require 'fileutils'
require 'json'
require 'open3'
require 'tmpdir'

pod_root = File.expand_path('..', __dir__)
source = File.join(pod_root, 'Core', 'UIBaseObject', 'JobsKeychainHelper', 'JobsKeychainHelper.m')
header = File.read(source.sub(/\.m\z/, '.h'))
guard = header[/^#ifndef\s+(\w+)/, 1]
interface = header[/@interface JobsKeychainHelper : NSObject.*?@end/m]
raise 'Missing canonical public interface / header guard' unless guard && interface
block_root = File.join(File.dirname(pod_root), 'JobsBlock@Pods', 'Core')
block_headers = Dir.glob(File.join(block_root, '**', '*.h'))
typedefs = %w[JobsRetIDByStrBlock JobsRetBOOLByStrBlock jobsByStrBlock].map do |name|
  pattern = /\(\^#{Regexp.escape(name)}\)/
  declaration = block_headers.lazy.flat_map { |path| File.readlines(path) }.find do |line|
    line.start_with?('typedef ') && line.match?(pattern)
  end
  raise "Missing canonical JobsBlock #{name}" unless declaration
  declaration
end.join

main = <<~'OBJC'
  //
  //  JobsKeychainDecodeRegression.m
  //  JobsBaseUI
  //
  //  Created by Jobs on 2026年10月5日，星期一.
  //

  #import <Foundation/Foundation.h>
  #import <Security/Security.h>
  #import <objc/runtime.h>
  #define __HEADER_GUARD__
  __TYPEDEFS__
  __INTERFACE__
  // 完整工程可能可见同名 BOOL selector，确保内核使用具体 Foundation 接收类型。
  @protocol JobsKeychainArrayNameCollision <NSObject>
  @property (nonatomic, readonly) BOOL array;
  @end

  // 原始实现作为 include 时被 Clang 当作头文件；这里只关闭该上下文产生的完整性警告。
  #pragma clang diagnostic push
  #pragma clang diagnostic ignored "-Wnullability-completeness"
  #import __PRODUCTION_SOURCE__
  #pragma clang diagnostic pop

  static void JobsCheck(BOOL condition, NSString *message) {
      if (!condition) {
          fprintf(stderr, "FAIL: %s\n", message.UTF8String);
          exit(EXIT_FAILURE);
      }
  }

  static NSData *JobsArchive(id value) {
      NSError *error = nil;
      NSData *data = [NSKeyedArchiver archivedDataWithRootObject:value requiringSecureCoding:YES error:&error];
      JobsCheck(data != nil && error == nil, @"secure fixture archive");
      return data;
  }

  int main(void) {
      @autoreleasepool {
          NSError *error = nil;
          NSData *stringData = JobsArchive(@"original");
          NSSet *strings = [NSSet setWithObject:NSString.class];
          JobsCheck([JobsKeychainDecodeData(stringData, strings, &error) isEqual:@"original"] && error == nil,
                    @"NSString allowed");
          JobsCheck(JobsKeychainDecodeData(stringData, [NSSet setWithObject:NSDate.class], &error) == nil &&
                    error.code == errSecDecode, @"NSDate does not authorize primitive NSString");
          JobsCheck([JobsKeychainDecodeData(stringData, strings, &error) isEqual:@"original"] && error == nil,
                    @"success clears previous decode error");

          NSArray *payload = @[@{@"label": @"value", @"count": @1}];
          NSData *nestedData = JobsArchive(payload);
          NSSet *withoutNumbers = [NSSet setWithObjects:NSArray.class, NSDictionary.class, NSString.class, nil];
          JobsCheck(JobsKeychainDecodeData(nestedData, withoutNumbers, &error) == nil &&
                    error.code == errSecDecode, @"nested primitive NSNumber denied");
          JobsCheck([JobsKeychainDecodeData(nestedData, [withoutNumbers setByAddingObject:NSNumber.class], &error)
                    isEqual:payload] && error == nil, @"explicit container and leaf whitelist succeeds");
          JobsCheck(JobsKeychainDecodeData(JobsArchive(@{@"key": @"value"}),
                    [NSSet setWithObjects:NSDictionary.class, NSDate.class, nil], &error) == nil &&
                    error.code == errSecDecode, @"dictionary string keys also checked");

          NSSet *setValue = [NSSet setWithObject:@"member"];
          JobsCheck([JobsKeychainDecodeData(JobsArchive(setValue),
                    [NSSet setWithObjects:NSSet.class, NSString.class, nil], &error) isEqual:setValue] &&
                    error == nil, @"set members allowed");
          JobsCheck(JobsKeychainDecodeData(JobsArchive(setValue), [NSSet setWithObject:NSSet.class], &error) == nil,
                    @"set primitive members denied");
          NSOrderedSet *ordered = [NSOrderedSet orderedSetWithObject:@"member"];
          JobsCheck([JobsKeychainDecodeData(JobsArchive(ordered),
                    [NSSet setWithObjects:NSOrderedSet.class, NSArray.class, NSString.class, nil], &error)
                    isEqual:ordered] && error == nil, @"ordered-set members allowed");

          for (id invalid in @[@42, @[], [NSSet setWithObject:@"NSString"], NSSet.new,
                                [NSSet setWithObject:object_getClass(NSObject.class)]]) {
              JobsCheck(JobsKeychainDecodeData(stringData, invalid, &error) == nil &&
                        error.code == errSecParam, @"invalid allowedClasses rejects safely");
              JobsCheck([JobsKeychainHelper loadService:@"no-security-call" allowedClasses:invalid error:&error] == nil &&
                        error.code == errSecParam, @"facade rejects invalid classes before Security");
          }
          JobsCheck(JobsKeychainDecodeData(stringData, nil, &error) == nil && error.code == errSecParam,
                    @"nil whitelist rejected");
          JobsCheck([JobsKeychainHelper loadService:@"no-security-call" allowedClasses:nil error:&error] == nil &&
                    error.code == errSecParam, @"facade nil whitelist rejected before Security");
          JobsCheck(JobsKeychainDecodeData(NSData.new, strings, &error) == nil && error.code == errSecDecode,
                    @"empty archive rejected");
          JobsCheck(JobsKeychainDecodeData([@"invalid" dataUsingEncoding:NSUTF8StringEncoding], strings, &error) == nil &&
                    error != nil, @"malformed archive rejected");
          JobsCheck(JobsKeychainDecodeData(stringData, [NSSet setWithObject:NSDate.class], NULL) == nil,
                    @"optional NSError pointer safe");

          NSMutableArray *cycle = NSMutableArray.new;
          id cycleReference = cycle;
          [cycle addObject:cycleReference];
          JobsCheck(JobsKeychainDecodedGraphIsAllowed(cycle, [NSSet setWithObject:NSArray.class]),
                    @"identity traversal terminates on cycles");
          [cycle removeAllObjects];
          puts("PASS: unchanged production .m; strict root/container whitelist, invalid classes, nil, errors, cycles; no system Keychain I/O");
      }
      return EXIT_SUCCESS;
  }
OBJC
main = main.gsub('__HEADER_GUARD__', guard)
           .gsub('__TYPEDEFS__', typedefs)
           .gsub('__INTERFACE__', interface)
           .gsub('__PRODUCTION_SOURCE__', source.to_json)

Dir.mktmpdir('JobsKeychainDecodeRegression-') do |directory|
  path = File.join(directory, 'JobsKeychainDecodeRegression.m')
  binary = File.join(directory, 'JobsKeychainDecodeRegression')
  File.write(path, main)
  command = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-fmodules',
             "-fmodules-cache-path=#{File.join(directory, 'ModuleCache')}",
             '-framework', 'Foundation', '-framework', 'Security', path, '-o', binary]
  stdout, stderr, status = Open3.capture3(*command)
  puts stdout unless stdout.empty?
  warn stderr unless stderr.empty?
  exit status.exitstatus unless status.success?
  stdout, stderr, status = Open3.capture3(binary)
  puts stdout unless stdout.empty?
  warn stderr unless stderr.empty?
  exit status.exitstatus unless status.success?
end
