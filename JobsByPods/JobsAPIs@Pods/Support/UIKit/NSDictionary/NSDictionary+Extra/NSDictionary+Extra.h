//
//  NSDictionary+Extra.h
//  AFNetworking
//
//  Created by Jobs on 2026/5/14.
//

#ifndef JOBS_HEADER_GUARD_NSDICTIONARY_EXTRA_6F6DE6223F
#define JOBS_HEADER_GUARD_NSDICTIONARY_EXTRA_6F6DE6223F

#import <Foundation/Foundation.h>

#if __has_include(<JobsStringUtils/JobsStringUtils.h>)
#import <JobsStringUtils/JobsStringUtils.h>
#else
#import "JobsStringUtils.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Extra)
/// 对系统方法 initWithContentsOfFile 的二次封装
+(JobsRetDicByStringBlock _Nonnull)initByContentsOfFile;
/// 对系统方法 initWithContentsOfURL 的二次封装
+(JobsRetDicByURLBlock _Nonnull)initByContentsOfURL;
/// 转成可变字典
-(JobsRetMutableDicByVoidBlock _Nonnull)mutableDic;
/// 对系统方法 objectForKey 的二次封装
-(JobsRetIDByIDBlock _Nonnull)objectForKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDICTIONARY_EXTRA_6F6DE6223F */
