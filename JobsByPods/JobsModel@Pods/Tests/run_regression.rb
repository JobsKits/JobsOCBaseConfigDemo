# 真实时间原语 macOS 回归；临时头只提取现有 JobsBlock typedef/时间枚举，不改生产源。
require 'tmpdir'
require 'open3'
require 'fileutils'

pod_root = File.expand_path('..', __dir__)
pods_root = File.dirname(pod_root)
core = File.join(pod_root, 'Core/Foundation/NSString+JobsModelTime')
block_header = File.join(pods_root, 'JobsBlock@Pods/Core/确定参数的Block/ReturnByCertainParametersBlock/ReturnByCertainParametersBlock.h')
block_type = File.readlines(block_header).find { |line| line.start_with?('typedef ') && line.include?('(^JobsRetStrByStrBlock)') }
abort 'JobsBlock canonical typedef 未找到' unless block_type
enum_header = File.join(pods_root, 'JobsOCDefs@Pods/Core/JobsDefines/JobsDefineEnums/JobsDefineTimeEnums/JobsDefineTimeEnums.h')
sdk, errors, status = Open3.capture3('xcrun', '--sdk', 'macosx', '--show-sdk-path')
abort errors unless status.success?

source = <<~'OBJC'
//
//  main.m
//  JobsModelTimestampRegression
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "NSString+JobsModelTime.h"

static void Check(BOOL condition, NSString *message) {
    if (!condition) {
        fprintf(stderr, "%s\n", message.UTF8String);
        exit(1);
    }
}

int main(void) {
    @autoreleasepool {
        Check([@"1700000000000".chinaTime(nil) isEqual:@"2023-11-15 06:13:20"], @"China millisecond formatting failed");
        Check([[@"1700000000" timeStampByTimeFormatter:nil timeZoneType:TimeZoneTypeUTC intervalStyle:intervalBySec] isEqual:@"2023-11-14 22:13:20"], @"UTC second formatting failed");
        Check([@"0".chinaTime(@"") isEqual:@"1970-01-01 08:00:00"], @"Empty default format failed");
        NSString *nul = [NSString stringWithFormat:@"1700000000%Ctail", (unichar)0];
        for (NSString *value in @[@"", @".", @"-1", @"nan", @"1e3", @"1.2.3", @"123tail", nul]) {
            NSTimeInterval seconds = 42;
            Check(!JobsModelParseTimestamp(value, NO, &seconds) && seconds == 42, @"Invalid parse modified output");
            Check(value.chinaTime(nil) == nil, @"Invalid timestamp became formatted epoch");
        }
        Check([@"0" timeStampByTimeFormatter:nil timeZoneType:TimeZoneTypeUTC intervalStyle:(IntervalStyle)999] == nil, @"Unknown unit accepted");
        NSTimeInterval seconds = -1;
        Check(JobsModelParseTimestamp(@"1000.5", YES, &seconds) && fabs(seconds - 1.0005) < 0.000001, @"Fractional milliseconds failed");
        JobsRetStrByStrBlock saved;
        __weak NSString *weakOwner;
        @autoreleasepool {
            NSMutableString *owner = [NSMutableString stringWithString:@"1700000000000"];
            weakOwner = owner;
            saved = owner.chinaTime;
        }
        Check(weakOwner == nil && saved(nil) == nil, @"Saved formatter block retained or dereferenced dead owner");
        puts("JobsModel timestamp: real implementation units, POSIX/Gregorian/IANA/default format, invalid/NUL/output preservation, weak lifecycle passed");
    }
    return 0;
}
OBJC

Dir.mktmpdir('jobs-model-timestamp-') do |directory|
  FileUtils.mkdir_p(File.join(directory, 'JobsBlock'))
  FileUtils.mkdir_p(File.join(directory, 'JobsOCDefs'))
  File.write(File.join(directory, 'JobsBlock/JobsBlock.h'), "#import <Foundation/Foundation.h>\n#{block_type}")
  FileUtils.cp(enum_header, File.join(directory, 'JobsOCDefs/JobsDefineTimeEnums.h'))
  main = File.join(directory, 'main.m')
  executable = File.join(directory, 'regression')
  File.write(main, source)
  arguments = ['xcrun', '--sdk', 'macosx', 'clang', '-fobjc-arc', '-fblocks', '-isysroot', sdk.strip,
               '-framework', 'Foundation', '-I', directory, '-I', core,
               main, File.join(core, 'NSString+JobsModelTime.m'), '-o', executable]
  output, errors, status = Open3.capture3(*arguments)
  warn errors unless errors.empty?
  abort output unless status.success?
  output, errors, status = Open3.capture3(executable)
  print output
  warn errors unless errors.empty?
  abort 'Timestamp regression failed' unless status.success?
end
