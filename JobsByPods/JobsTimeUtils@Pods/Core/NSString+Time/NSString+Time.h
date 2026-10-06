//
//  NSString+Time.h
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A
#define JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A

#import <errno.h>
#import <math.h>
#import <stdlib.h>
#import <Foundation/Foundation.h>

#if __has_include(<JobsModel/NSString+JobsModelTime.h>)
#import <JobsModel/NSString+JobsModelTime.h>
#else
#import "NSString+JobsModelTime.h"
#endif

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

@interface NSString (JobsTimeUtilsTime)
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsRetBOOLByVoidBlock _Nonnull)isExpired;
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsRetStrByStrBlock _Nonnull)readableTimeByFormatter;
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A */
