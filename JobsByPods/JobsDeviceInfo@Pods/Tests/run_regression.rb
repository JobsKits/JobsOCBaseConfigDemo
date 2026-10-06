# frozen_string_literal: true
# 抽取当前生产 Keychain 决策代码，注入 OSStatus 与 vendor ID；不访问真实 Keychain。
require 'tmpdir'
require 'open3'
source = File.read(File.expand_path('../Core/NSObject+ID/NSObject+DeviceID/NSObject+DeviceID.m', __dir__))
helpers = source[source.index('static NSMutableDictionary *JobsDeviceIDKeychainQuery')...source.index('static void JobsDeviceIDKeychainRemove')]
start = source.index('-(NSString *)jobsDeviceIDWithError:')
opening = source.index('{', start)
depth = 1
cursor = opening + 1
while depth.positive?
  depth += 1 if source[cursor] == '{'
  depth -= 1 if source[cursor] == '}'
  cursor += 1
end
method = source[start...cursor]
Dir.mktmpdir('jobs-device-id-') do |directory|
  path = File.join(directory, 'regression.m')
  File.write(path, <<~OC)
    #import <Foundation/Foundation.h>
    #import <Security/Security.h>
    static OSStatus readStatus;
    static OSStatus writeStatus;
    static NSUInteger writes;
    static BOOL duplicateRead;
    static NSData *stored;
    static OSStatus FixtureCopy(CFDictionaryRef query, CFTypeRef *result) {
        if (duplicateRead || readStatus == errSecSuccess) {
            *result = CFBridgingRetain(stored);
            return errSecSuccess;
        }
        return readStatus;
    }
    static OSStatus FixtureAdd(CFDictionaryRef query, CFTypeRef *result) {
        writes += 1;
        if (writeStatus == errSecDuplicateItem) duplicateRead = YES;
        return writeStatus;
    }
    #define SecItemCopyMatching FixtureCopy
    #define SecItemAdd FixtureAdd
    #define 设备ID @"fixture.device"
    @interface UIDevice : NSObject
    @property(class, readonly) UIDevice *currentDevice;
    @property(readonly) NSUUID *identifierForVendor;
    @end
    @implementation UIDevice
    +(UIDevice *)currentDevice { return [UIDevice new]; }
    -(NSUUID *)identifierForVendor { return [[NSUUID alloc] initWithUUIDString:@"00000000-0000-0000-0000-000000000001"]; }
    @end
    #{helpers}
    @interface NSObject (Fixture)
    -(NSString *)jobsDeviceIDWithError:(NSError **)error;
    @end
    @implementation NSObject (Fixture)
    #{method}
    @end
    static void check(BOOL condition, NSString *description) {
        if (!condition) { fprintf(stderr, "%s\\n", description.UTF8String); exit(1); }
    }
    int main(void) {
        @autoreleasepool {
            NSObject *owner = [NSObject new];
            NSError *error = nil;
            readStatus = errSecInteractionNotAllowed;
            writeStatus = errSecSuccess;
            check(![owner jobsDeviceIDWithError:&error] && error.code == errSecInteractionNotAllowed && writes == 0, @"locked storage rewrote identity");
            readStatus = errSecItemNotFound;
            writeStatus = errSecMissingEntitlement;
            check(![owner jobsDeviceIDWithError:&error] && error.code == errSecMissingEntitlement && writes == 1, @"failed persistence returned unstable candidate");
            stored = [@"winner" dataUsingEncoding:NSUTF8StringEncoding];
            writeStatus = errSecDuplicateItem;
            check([[owner jobsDeviceIDWithError:&error] isEqualToString:@"winner"] && !error, @"duplicate race did not reread winning ID");
            duplicateRead = NO;
            readStatus = errSecSuccess;
            check([[owner jobsDeviceIDWithError:&error] isEqualToString:@"winner"] && writes == 2, @"existing identity rewritten");
            stored = [NSKeyedArchiver archivedDataWithRootObject:@"legacy" requiringSecureCoding:YES error:nil];
            check([[owner jobsDeviceIDWithError:&error] isEqualToString:@"legacy"], @"legacy archived NSString no longer readable");
            readStatus = errSecItemNotFound;
            writeStatus = errSecSuccess;
            check([[owner jobsDeviceIDWithError:&error] isEqualToString:@"00000000-0000-0000-0000-000000000001"] && !error, @"first persist failed");
            puts("PASS: locked/read/save failures, duplicate winner, existing ID, legacy archive and first persist; no real Keychain access");
        }
        return 0;
    }
  OC
  output, status = Open3.capture2e('clang', '-fobjc-arc', '-framework', 'Foundation', '-framework', 'Security', path, '-o', File.join(directory, 'regression'))
  abort output unless status.success?
  output, status = Open3.capture2e(File.join(directory, 'regression'))
  puts output
  abort 'DeviceID regression failed' unless status.success?
end
