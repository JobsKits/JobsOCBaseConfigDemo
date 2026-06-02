//
//  LanMgr.h
//  JobsLanMgr
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_LANMGR_25952B2F95
#define JOBS_HEADER_GUARD_LANMGR_25952B2F95

#pragma once

#import <Foundation/Foundation.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface LanMgr : NSObject
/// 获取和设置当前语言
Prop_assign(class)AppLanguage language;
/// 语言包路径
+(NSBundle *_Nullable)bundle;
/// 通过key取值对应的语言
+(JobsRetStrByStrBlock _Nonnull)localStringByKey;
/// 枚举和语言字符串的转换
+(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage;
-(JobsRetStrByIntegerBlock _Nonnull)languageCodeByAppLanguage;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_LANMGR_25952B2F95 */
