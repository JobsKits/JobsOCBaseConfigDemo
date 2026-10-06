//
//  JobsKeychainHelper.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsKeychainHelper.h"
#import <objc/runtime.h>

static BOOL JobsKeychainSetError(NSError **error, NSError *value) {
    if (error) {
        *error = value;
    }
    return NO;
}

static BOOL JobsKeychainStatus(OSStatus status, NSError **error) {
    if (status == errSecSuccess) {
        return YES;
    }
    return JobsKeychainSetError(error, [NSError errorWithDomain:NSOSStatusErrorDomain code:status userInfo:nil]);
}

static NSMutableDictionary *JobsKeychainIdentity(NSString *service, NSString *account) {
    if (![service isKindOfClass:NSString.class] || !service.length ||
        ![account isKindOfClass:NSString.class] || !account.length) {
        return nil;
    }
    return [@{(__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
              (__bridge id)kSecAttrService: service,
              (__bridge id)kSecAttrAccount: account} mutableCopy];
}

static BOOL JobsKeychainStore(NSDictionary *identity, NSData *data, NSError **error) {
    if (!identity || !data) {
        return JobsKeychainStatus(errSecParam, error);
    }
    NSDictionary *attributes = @{(__bridge id)kSecValueData: data};
    OSStatus status = SecItemUpdate((__bridge CFDictionaryRef)identity, (__bridge CFDictionaryRef)attributes);
    if (status == errSecItemNotFound) {
        NSMutableDictionary *item = [identity mutableCopy];
        [item addEntriesFromDictionary:attributes];
        item[(__bridge id)kSecAttrAccessible] = (__bridge id)kSecAttrAccessibleAfterFirstUnlock;
        status = SecItemAdd((__bridge CFDictionaryRef)item, NULL);
        if (status == errSecDuplicateItem) {
            status = SecItemUpdate((__bridge CFDictionaryRef)identity, (__bridge CFDictionaryRef)attributes);
        }
    }
    return JobsKeychainStatus(status, error);
}

static NSData *JobsKeychainRead(NSDictionary *identity, NSError **error) {
    if (!identity) {
        JobsKeychainStatus(errSecParam, error);
        return nil;
    }
    NSMutableDictionary *query = [identity mutableCopy];
    query[(__bridge id)kSecReturnData] = @YES;
    query[(__bridge id)kSecMatchLimit] = (__bridge id)kSecMatchLimitOne;
    CFTypeRef result = NULL;
    OSStatus status = SecItemCopyMatching((__bridge CFDictionaryRef)query, &result);
    id value = CFBridgingRelease(result);
    if (!JobsKeychainStatus(status, error)) {
        return nil;
    }
    if (![value isKindOfClass:NSData.class]) {
        JobsKeychainStatus(errSecDecode, error);
        return nil;
    }
    return value;
}

static BOOL JobsKeychainAllowedClassesAreValid(NSSet *classes) {
    if (![classes isKindOfClass:NSSet.class] || !classes.count) {
        return NO;
    }
    for (id candidate in classes) {
        if (!object_isClass(candidate) || class_isMetaClass((Class)candidate)) {
            return NO;
        }
    }
    return YES;
}

static BOOL JobsKeychainDecodedGraphIsAllowed(id root, NSSet<Class> *classes) {
    NSMutableArray *pending = [NSMutableArray arrayWithObject:root];
    NSHashTable *visited = [NSHashTable hashTableWithOptions:NSPointerFunctionsObjectPointerPersonality];
    while (pending.count) {
        id value = pending.lastObject;
        [pending removeLastObject];
        if ([visited containsObject:value]) {
            continue;
        }
        [visited addObject:value];
        BOOL allowed = NO;
        for (Class candidate in classes) {
            if ([value isKindOfClass:candidate]) {
                allowed = YES;
                break;
            }
        }
        if (!allowed) {
            return NO;
        }
        if ([value isKindOfClass:NSDictionary.class]) {
            [pending addObjectsFromArray:[value allKeys]];
            [pending addObjectsFromArray:[value allValues]];
        } else if ([value isKindOfClass:NSArray.class]) {
            [pending addObjectsFromArray:value];
        } else if ([value isKindOfClass:NSSet.class]) {
            [pending addObjectsFromArray:[value allObjects]];
        } else if ([value isKindOfClass:NSOrderedSet.class]) {
            [pending addObjectsFromArray:[(NSOrderedSet *)value array]];
        }
    }
    return YES;
}

/// Foundation 会自动放行部分基础类型，额外限制可观察值图。
static id JobsKeychainDecodeData(NSData *data, NSSet<Class> *classes, NSError **error) {
    if (error) {
        *error = nil;
    }
    if (!JobsKeychainAllowedClassesAreValid(classes)) {
        JobsKeychainStatus(errSecParam, error);
        return nil;
    }
    if (![data isKindOfClass:NSData.class] || !data.length) {
        JobsKeychainStatus(errSecDecode, error);
        return nil;
    }
    @try {
        id value = [NSKeyedUnarchiver unarchivedObjectOfClasses:classes fromData:data error:error];
        if (!value) {
            if (error && !*error) {
                JobsKeychainStatus(errSecDecode, error);
            }
            return nil;
        }
        if (!JobsKeychainDecodedGraphIsAllowed(value, classes)) {
            JobsKeychainStatus(errSecDecode, error);
            return nil;
        }
        return value;
    } @catch (NSException *exception) {
        JobsKeychainSetError(error, [NSError errorWithDomain:@"JobsKeychainHelper" code:1
                                                  userInfo:@{NSLocalizedDescriptionKey: exception.reason ?: @"Archive decode failed"}]);
        return nil;
    }
}

@implementation JobsKeychainHelper

+(void)load {}

+(JobsRetIDByStrBlock _Nonnull)jobsLoad {
    return ^id(NSString *service) {
        NSSet *classes = [NSSet setWithObjects:NSString.class, NSNumber.class, NSData.class,
                          NSDate.class, NSArray.class, NSDictionary.class, NSSet.class, NSNull.class, nil];
        return [self loadService:service allowedClasses:classes error:nil];
    };
}

+(id)loadService:(NSString *)service allowedClasses:(NSSet<Class> *)classes error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (!JobsKeychainAllowedClassesAreValid(classes)) {
        JobsKeychainStatus(errSecParam, error);
        return nil;
    }
    NSData *data = JobsKeychainRead(JobsKeychainIdentity(service, service), error);
    if (!data) {
        return nil;
    }
    return JobsKeychainDecodeData(data, classes, error);
}

+(jobsByStrBlock _Nonnull)remove {
    return ^(NSString *service) {
        NSDictionary *identity = JobsKeychainIdentity(service, service);
        if (identity) {
            SecItemDelete((__bridge CFDictionaryRef)identity);
        }
    };
}

+(BOOL)save:(NSString *)service data:(id)data {
    return [self save:service data:data error:nil];
}

+(BOOL)save:(NSString *)service data:(id<NSSecureCoding>)data error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    NSDictionary *identity = JobsKeychainIdentity(service, service);
    if (!identity || !data) {
        return JobsKeychainStatus(errSecParam, error);
    }
    NSData *encoded = nil;
    @try {
        encoded = [NSKeyedArchiver archivedDataWithRootObject:data requiringSecureCoding:YES error:error];
    } @catch (NSException *exception) {
        return JobsKeychainSetError(error, [NSError errorWithDomain:@"JobsKeychainHelper" code:2
                                                         userInfo:@{NSLocalizedDescriptionKey: exception.reason ?: @"Archive encode failed"}]);
    }
    if (!encoded) {
        return NO;
    }
    @synchronized (self) {
        return JobsKeychainStore(identity, encoded, error);
    }
}

+(BOOL)saveAccount:(NSString *)account password:(NSString *)password forService:(NSString *)service {
    return [self saveAccount:account password:password forService:service error:nil];
}

+(BOOL)saveAccount:(NSString *)account password:(NSString *)password forService:(NSString *)service error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    if (![password isKindOfClass:NSString.class]) {
        return JobsKeychainStatus(errSecParam, error);
    }
    NSData *data = [password dataUsingEncoding:NSUTF8StringEncoding];
    @synchronized (self) {
        return JobsKeychainStore(JobsKeychainIdentity(service, account), data, error);
    }
}

+(NSString *)getPasswordByService:(NSString *)service account:(NSString *)account {
    return [self getPasswordByService:service account:account error:nil];
}

+(NSString *)getPasswordByService:(NSString *)service account:(NSString *)account error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    NSData *data = JobsKeychainRead(JobsKeychainIdentity(service, account), error);
    if (!data) {
        return nil;
    }
    NSString *password = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    if (!password) {
        JobsKeychainStatus(errSecDecode, error);
    }
    return password;
}

+(BOOL)deleteAccount:(NSString *)account forService:(NSString *)service error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    NSDictionary *identity = JobsKeychainIdentity(service, account);
    if (!identity) {
        return JobsKeychainStatus(errSecParam, error);
    }
    OSStatus status = SecItemDelete((__bridge CFDictionaryRef)identity);
    return status == errSecItemNotFound || JobsKeychainStatus(status, error);
}

+(JobsRetBOOLByStrBlock _Nonnull)deleteAccountInfoByService {
    return ^BOOL(NSString *service) {
        if (![service isKindOfClass:NSString.class] || !service.length) {
            return NO;
        }
        NSDictionary *query = @{(__bridge id)kSecClass: (__bridge id)kSecClassGenericPassword,
                                (__bridge id)kSecAttrService: service};
        OSStatus status = SecItemDelete((__bridge CFDictionaryRef)query);
        return status == errSecSuccess || status == errSecItemNotFound;
    };
}

+(BOOL)migrateLegacyPasswordForService:(NSString *)service toAccount:(NSString *)account error:(NSError **)error {
    if (error) {
        *error = nil;
    }
    NSDictionary *legacy = JobsKeychainIdentity(service, service);
    if (!legacy || !JobsKeychainIdentity(service, account)) {
        return JobsKeychainStatus(errSecParam, error);
    }
    @synchronized (self) {
        if (![self getPasswordByService:service account:service error:error]) {
            return NO;
        }
        if ([service isEqualToString:account]) {
            return YES;
        }
        /// 更新身份是一次 Keychain 操作；目标已存在时失败，原条目不会被删除。
        NSDictionary *attributes = @{(__bridge id)kSecAttrAccount: account};
        return JobsKeychainStatus(SecItemUpdate((__bridge CFDictionaryRef)legacy, (__bridge CFDictionaryRef)attributes), error);
    }
}

@end
