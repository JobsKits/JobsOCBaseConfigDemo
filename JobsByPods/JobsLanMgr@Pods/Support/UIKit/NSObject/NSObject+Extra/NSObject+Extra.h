//
//  NSObject+Extra.h
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_EXTRA_CC8B29F2BC
#define JOBS_HEADER_GUARD_NSOBJECT_EXTRA_CC8B29F2BC

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

/// 设置 UserDefault 整数值（Integer）
#ifndef JobsSetUserDefaultKeyWithInteger
#define JobsSetUserDefaultKeyWithInteger(key,value) [NSUserDefaults.standardUserDefaults setInteger:value forKey:key]
#endif /* JobsSetUserDefaultKeyWithInteger */
/// 获取 UserDefault 整数值（Integer）
#ifndef JobsGetUserDefaultIntegerForKey
#define JobsGetUserDefaultIntegerForKey(key) [NSUserDefaults.standardUserDefaults integerForKey:key]
#endif /* JobsGetUserDefaultIntegerForKey */
/// 同步 NSUserDefaults
#ifndef JobsUserDefaultSynchronize
#define JobsUserDefaultSynchronize NSUserDefaults.standardUserDefaults.synchronize
#endif /* JobsUserDefaultSynchronize */

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (JobsLanMgrExtra)
/// App 国际化相关系统宏二次封装 + 设置缺省值
+(JobsRetStrByStrBlock _Nonnull)localStringWithKey;
+(NSString *_Nullable)localizedString:(nonnull NSString *)key
                            fromTable:(nullable NSString *)tableName
                             inBundle:(nullable NSBundle *)bundle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_EXTRA_CC8B29F2BC */
