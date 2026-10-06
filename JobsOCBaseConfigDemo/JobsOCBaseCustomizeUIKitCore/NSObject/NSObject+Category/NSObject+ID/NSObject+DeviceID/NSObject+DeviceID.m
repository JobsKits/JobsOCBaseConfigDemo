//
//  NSObject+DeviceID.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+DeviceID.h"

#import "NSObject+Extra.h"

static NSMutableDictionary *JobsDeviceIDKeychainQuery(NSString *service) {
    NSMutableDictionary *query = NSMutableDictionary.dictionary;
    query[(__bridge id)kSecClass] = (__bridge id)kSecClassGenericPassword;
    query[(__bridge id)kSecAttrService] = service;
    query[(__bridge id)kSecAttrAccount] = service;
    query[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAfterFirstUnlock;
    return query;
}

static NSString *JobsDeviceIDKeychainLoad(NSString *service, OSStatus *statusOut) {
    NSMutableDictionary *query = JobsDeviceIDKeychainQuery(service);
    query[(__bridge id)kSecReturnData] = @YES;
    query[(__bridge id)kSecMatchLimit] = (__bridge id)kSecMatchLimitOne;
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (statusOut) *statusOut = status;
    if (status != errSecSuccess || !result) return nil;
    NSData *data = (__bridge_transfer NSData *)result;
    NSString *string = [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    if (string.length && ![string hasPrefix:@"bplist"]) return string;
    NSError *error = nil;
    id object = [NSKeyedUnarchiver unarchivedObjectOfClass:NSString.class
                                                  fromData:data
                                                     error:&error];
    if (![object isKindOfClass:NSString.class] || ![object length]) {
        if (statusOut) *statusOut = errSecDecode;
        return nil;
    }
    return object;
}

static OSStatus JobsDeviceIDKeychainSave(NSString *service, NSString *data) {
    NSMutableDictionary *query = JobsDeviceIDKeychainQuery(service);
    query[(__bridge id)kSecValueData] = [data dataUsingEncoding:NSUTF8StringEncoding];
    return SecItemAdd((__bridge CFDictionaryRef)query, NULL);
}

static void JobsDeviceIDKeychainRemove(NSString *service) {
    SecItemDelete((__bridge CFDictionaryRef)JobsDeviceIDKeychainQuery(service));
}

@implementation NSObject (DeviceID)
/**
 我们可以获取到UUID，然后把UUID保存到KeyChain里面。
 这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
 但是刷机或重装系统后uuid还是会改变。
 */
-(jobsByVoidBlock _Nonnull)deleteDeviceID{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @synchronized (NSObject.class) {
            JobsDeviceIDKeychainRemove(设备ID);
        }
    };
}

-(JobsRetStrByVoidBlock _Nonnull)deviceID{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return [self jobsDeviceIDWithError:nil];
    };
}

-(NSString *)jobsDeviceIDWithError:(NSError *__autoreleasing *)error{
    @synchronized (NSObject.class) {
        if (error) *error = nil;
        OSStatus status = errSecSuccess;
        NSString *identifier = JobsDeviceIDKeychainLoad(设备ID, &status);
        if (identifier.length) return identifier;
        if (status == errSecItemNotFound) {
            NSString *candidate = UIDevice.currentDevice.identifierForVendor.UUIDString;
            if (!candidate.length) {
                status = errSecNotAvailable;
            } else {
                status = JobsDeviceIDKeychainSave(设备ID, candidate);
                if (status == errSecSuccess) return candidate;
                if (status == errSecDuplicateItem) {
                    identifier = JobsDeviceIDKeychainLoad(设备ID, &status);
                    if (identifier.length) return identifier;
                }
            }
        }
        if (error) *error = [NSError errorWithDomain:NSOSStatusErrorDomain code:status
                                           userInfo:@{NSLocalizedDescriptionKey:@"设备标识暂不可读或未能持久保存；请稍后重试"}];
        return nil;
    }
}

@end
