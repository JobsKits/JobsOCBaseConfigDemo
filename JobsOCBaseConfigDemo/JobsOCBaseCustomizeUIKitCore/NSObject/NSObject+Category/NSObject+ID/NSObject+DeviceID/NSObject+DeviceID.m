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

static NSString *JobsDeviceIDKeychainLoad(NSString *service) {
    NSMutableDictionary *query = JobsDeviceIDKeychainQuery(service);
    query[(__bridge id)kSecReturnData] = @YES;
    query[(__bridge id)kSecMatchLimit] = (__bridge id)kSecMatchLimitOne;
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    if (status != errSecSuccess || !result) return nil;
    NSData *data = (__bridge_transfer NSData *)result;
    NSString *string = [NSString.alloc initWithData:data encoding:NSUTF8StringEncoding];
    if (string) return string;
    NSError *error = nil;
    id object = [NSKeyedUnarchiver unarchivedObjectOfClass:NSString.class
                                                  fromData:data
                                                     error:&error];
    return [object isKindOfClass:NSString.class] ? object : nil;
}

static BOOL JobsDeviceIDKeychainSave(NSString *service, NSString *data) {
    NSMutableDictionary *query = JobsDeviceIDKeychainQuery(service);
    SecItemDelete((__bridge CFDictionaryRef)query);
    query[(__bridge id)kSecValueData] = [data dataUsingEncoding:NSUTF8StringEncoding];
    return SecItemAdd((__bridge CFDictionaryRef)query, NULL) == errSecSuccess;
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
-(void)deleteDeviceID{
    JobsDeviceIDKeychainRemove(设备ID);
}

-(NSString *)deviceID{
    /// 读取keychain的缓存
    NSString *deviceID = JobsDeviceIDKeychainLoad(设备ID);
    if (deviceID.length == 0) {
        deviceID = UIDevice.currentDevice.identifierForVendor.UUIDString;
        JobsDeviceIDKeychainSave(设备ID, deviceID);
    };return deviceID;
}

@end
