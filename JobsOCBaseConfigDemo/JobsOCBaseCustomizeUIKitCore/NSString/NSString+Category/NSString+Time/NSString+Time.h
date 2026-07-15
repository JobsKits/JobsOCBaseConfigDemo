//
//  NSString+Time.h
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A
#define JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A

#import <Foundation/Foundation.h>
#import "JobsStringUtilsHeader.h"
#import "JobsMakes.h"
#import "WHToastExtra.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSString (JobsTimeUtilsTime)
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
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_TIME_A4B077740A */
