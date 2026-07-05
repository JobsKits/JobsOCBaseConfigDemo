//
//  NSDate+Extra.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//
#ifndef NSDate_Extra_h
#define NSDate_Extra_h

#import <Foundation/Foundation.h>
#import "NSDateFormatter+Extra.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

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
/// 对系统方法 dateByAddingTimeInterval 的二次封装
-(JobsRetDateByTimeIntervalBlock _Nonnull)byAddingTimeInterval API_AVAILABLE(macos(10.6), ios(2.0), watchos(2.0), tvos(9.0));
/// 对系统方法 timeIntervalSinceDate 的二次封装
-(JobsRetTimeIntervalByDateBlock _Nonnull)timeIntervalSinceDate;
/// 将NSDate *转化为可视化的时间字符串
/// 入参：日期格式化标准（NSDateFormatter *）缺省标准：年/月/日
-(JobsRetStrByDateFormatterBlock _Nonnull)toReadableTime;

@end

NS_ASSUME_NONNULL_END

#endif /* NSDate_Extra_h */
