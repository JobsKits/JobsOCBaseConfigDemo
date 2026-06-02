//
//  NSString+Time.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TIME_B76075F29B
#define JOBS_HEADER_GUARD_NSSTRING_TIME_B76075F29B

#import <Foundation/Foundation.h>
#import <JobsByOCPods/NSString+Check.h>
#import <JobsByOCPods/NSDate+Extra.h>
#import <JobsByOCPods/NSFormatter+Extra.h>

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif

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

#if __has_include(<WHToastExtra/WHToastExtra.h>)
#import <WHToastExtra/WHToastExtra.h>
#else
#import "WHToastExtra.h"
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

@interface NSString (Time)
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsRetBOOLByVoidBlock _Nonnull)isExpired;
-(JobsRetStrByStrBlock _Nonnull)chinaTime;
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsRetStrByStrBlock _Nonnull)readableTimeByFormatter;
/// 时间戳（字符串）依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_TIME_B76075F29B */
