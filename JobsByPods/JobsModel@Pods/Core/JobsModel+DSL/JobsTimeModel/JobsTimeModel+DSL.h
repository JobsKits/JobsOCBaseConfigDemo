//
//  JobsTimeModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_C3D4DB7BFB8D1027
#define JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_C3D4DB7BFB8D1027

#if __has_include(<JobsModel/JobsTimeModel.h>)
#import <JobsModel/JobsTimeModel.h>
#else
#import "JobsTimeModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsTimeModel (DSL)

#pragma mark —— 来自 JobsTimeModel
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(CGFloat data))byCurrentDateOffsetSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byCurrentOffsetDate;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCurrentTimestampStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampOffsetSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampOffsetMilliSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampMilliSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentEra;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentMonth;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentDay;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentHour;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentMin;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentNanoSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekday;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekdayOrdinal;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentQuarter;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekOfMonth;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekOfYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentYearForWeekOfYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byCustomDate;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomTimestampStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCustomTimestampSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCustomTimestampMilliSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomEra;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomMonth;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomDay;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomHour;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomMin;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomNanoSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekday;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekdayOrdinal;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomQuarter;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekOfMonth;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekOfYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomYearForWeekOfYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byLocalTimeZone;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomTimeZoneStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byCustomTimeZone;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateFormatterStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDateFormatter * data))byDateFormatter;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byTimeOffset;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomTimeOffset;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byYear;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byMonth;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDay;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byHour;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byMinute;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))bySecond;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byDate;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateReadableStr;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byIntervalBySec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byIntervalByMilliSec;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byTimeZone;
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_C3D4DB7BFB8D1027 */
