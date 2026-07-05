//
//  NSString+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_2F558A4605
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_2F558A4605

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<SDWebImage/SDWebImage.h>)
#import <SDWebImage/SDWebImage.h>
#else
#import "SDWebImage.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

@interface NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
/// 字符串是否包含URL【返回YES包含】
-(BOOL)isContainsUrl;
/// 清除 SDImage 的图片缓存（用 url 为 key）
-(void)cleanSDImageCache:(SDWebImageNoParamsBlock _Nullable)block;
/// 复制到系统剪切板
-(JobsRetStrByVoidBlock _Nonnull)pasteboard;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_2F558A4605 */
