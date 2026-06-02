//
//  NSDate+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSDATE_EXTRA_9F07045463
#define JOBS_HEADER_GUARD_NSDATE_EXTRA_9F07045463

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBaseUI/NSDateFormatter+Extra.h>

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

@interface NSDate (Extra)
#pragma mark —— 创建 Date 对象
/// 创建一个基于 1970年1月1日00:00:00 UTC 时间 的 NSDate 对象
/// 基准时间点：1970 年 1 月 1 日 00:00
/// 入参data：秒数，计算距离 1970 的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)initDateBy;
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)dateSince;
/// 对系统方法 dateByAddingTimeInterval 的二次封装
-(JobsRetDateByTimeIntervalBlock _Nonnull)byAddingTimeInterval API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0));
/// 对系统方法 timeIntervalSinceDate 的二次封装
-(JobsRetTimeIntervalByDateBlock _Nonnull)timeIntervalSinceDate;
#pragma mark —— Date 对象的转化
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSDateFormatter *）缺省标准：年/月/日
-(JobsRetStrByDateFormatterBlock _Nonnull)toReadableTime;
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSString *）缺省标准：年/月/日
-(JobsRetStrByStrBlock _Nonnull)toReadableTimeBy;
/// 将 NSDate  *转换输出成人类可读的（年\月\日）时间（字符串）
-(NSString *_Nullable)readableDayTime;
/// 将 NSDate  *转换输出成人类可读的（年\月\日\时\分\秒）时间（字符串）
-(NSString *_Nullable)readableTime;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSDATE_EXTRA_9F07045463 */
