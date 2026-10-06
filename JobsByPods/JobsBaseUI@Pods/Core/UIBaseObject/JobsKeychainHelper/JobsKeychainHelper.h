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

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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
+(void)load;
+(JobsRetIDByStrBlock _Nonnull)jobsLoad;

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

/// 带错误的接口以 service + account 隔离身份；保存失败保留原条目。
+(BOOL)saveAccount:(NSString *_Nullable)account
          password:(NSString *_Nullable)password
        forService:(NSString *_Nullable)service
             error:(NSError *_Nullable *_Nullable)error;
+(NSString *_Nullable)getPasswordByService:(NSString *_Nullable)service
                                  account:(NSString *_Nullable)account
                                    error:(NSError *_Nullable *_Nullable)error;
+(BOOL)deleteAccount:(NSString *_Nullable)account
         forService:(NSString *_Nullable)service
              error:(NSError *_Nullable *_Nullable)error;
+(BOOL)save:(NSString *_Nullable)service
       data:(id<NSSecureCoding> _Nullable)data
      error:(NSError *_Nullable *_Nullable)error;
+(id _Nullable)loadService:(NSString *_Nullable)service
           allowedClasses:(NSSet<Class> *_Nullable)allowedClasses
                    error:(NSError *_Nullable *_Nullable)error;
/// 旧版本把 account 写成 service；只在调用方确认归属后显式迁移，不自动猜测账户。
+(BOOL)migrateLegacyPasswordForService:(NSString *_Nullable)service
                           toAccount:(NSString *_Nullable)account
                               error:(NSError *_Nullable *_Nullable)error;

@end
#endif /* JOBS_HEADER_GUARD_JOBSKEYCHAINHELPER_31B5174A44 */
