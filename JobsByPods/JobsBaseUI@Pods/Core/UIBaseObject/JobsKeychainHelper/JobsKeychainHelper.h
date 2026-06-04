//
//  JobsKeychainHelper.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSKEYCHAINHELPER_31B5174A44
#define JOBS_HEADER_GUARD_JOBSKEYCHAINHELPER_31B5174A44

#import <Security/Security.h> // 该框架提供了与应用程序的安全性相关的功能（加密、密钥管理、证书和身份验证）
#import <UIKit/UIKit.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

/// 钥匙串（Keychain） 支持存储的类型不仅限于字符串，可以存储任意类型的二进制数据（NSData）
/// 因此只要你的数据可以序列化为 NSData，理论上就可以存储在钥匙串中。
@interface JobsKeychainHelper : NSObject
/**
 我们可以获取到UUID，然后把UUID保存到KeyChain里面。
 这样以后即使APP删了再装回来，也可以从KeyChain中读取回来。使用group还可以可以保证同一个开发商的所有程序针对同一台设备能够获取到相同的不变的UDID。
 但是刷机或重装系统后uuid还是会改变。
 */
#pragma mark —— 🔑钥匙串存储：
/// 读取数据
+(JobsRetIDByStrBlock _Nonnull)load;

+(jobsByStrBlock _Nonnull)remove;
/// 保存数据，并检查是否保存成功
+(BOOL)save:(NSString *_Nonnull)service data:(id _Nonnull)data;
#pragma mark —— 🔑钥匙串存储：账户 + 密码
+(BOOL)saveAccount:(NSString *_Nonnull)account
          password:(NSString *_Nonnull)password
        forService:(NSString *_Nonnull)service;
/// service + account ==> password
+(NSString *_Nullable)getPasswordByService:(NSString *_Nonnull)service account:(NSString *_Nonnull)account;
/// 删除已有数据
+(JobsRetBOOLByStrBlock _Nonnull)deleteAccountInfoByService;

@end
#endif /* JOBS_HEADER_GUARD_JOBSKEYCHAINHELPER_31B5174A44 */
