//
//  NSString+JobsModelTime.h
//  JobsModel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_JOBSMODELTIME
#define JOBS_HEADER_GUARD_NSSTRING_JOBSMODELTIME

#import <Foundation/Foundation.h>
#import <errno.h>
#import <math.h>
#import <stdlib.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefineTimeEnums.h>)
#import <JobsOCDefs/JobsDefineTimeEnums.h>
#else
#import "JobsDefineTimeEnums.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// 完整校验非负数字时间戳；失败时不修改 seconds。
FOUNDATION_EXPORT BOOL JobsModelParseTimestamp(NSString *_Nullable value,
                                              BOOL milliseconds,
                                              NSTimeInterval *_Nonnull seconds);

@interface NSString (JobsModelTime)

/// 毫秒时间戳转中国时间；nil/空格式使用 yyyy-MM-dd HH:mm:ss。
-(JobsRetStrByStrBlock _Nonnull)chinaTime;
/// 显式秒/毫秒单位，固定 POSIX locale 和 Gregorian calendar；非法输入返回 nil。
-(NSString *_Nullable)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                                 timeZoneType:(TimeZoneType)timeZoneType
                                intervalStyle:(IntervalStyle)intervalStyle;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_NSSTRING_JOBSMODELTIME */
