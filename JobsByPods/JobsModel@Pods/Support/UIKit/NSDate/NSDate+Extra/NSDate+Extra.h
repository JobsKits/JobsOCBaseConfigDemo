//
//  NSDate+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSDate_Extra_h
#define NSDate_Extra_h

#import <Foundation/Foundation.h>
#import <JobsModel/NSDateFormatter+Extra.h>

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

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (JobsModelExtra)
/// 创建一个基于 1970年1月1日00:00:00 UTC 时间 的 NSDate 对象
/// 基准时间点：1970 年 1 月 1 日 00:00
/// 入参data：秒数，计算距离 1970 的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)initDateBy;
/// 创建一个基于 当前时间 的 NSDate 对象。
/// 基准时间点：当前时间
/// 入参data：秒数，计算距离当前时间的偏移量
+(JobsRetDateByTimeIntervalBlock _Nonnull)dateSince;
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSDateFormatter *）缺省标准：年/月/日
-(JobsRetStrByDateFormatterBlock _Nonnull)toReadableTime;

@end

NS_ASSUME_NONNULL_END

#endif /* NSDate_Extra_h */
