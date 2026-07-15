//
//  JobsTimeModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_A007DD5E8C3A232
#define JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_A007DD5E8C3A232

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsTimeModel (DSL)

-(JobsRetJobsTimeModelByCGFloatBlock _Nonnull)byCurrentDateOffsetSec;
-(JobsRetJobsTimeModelByDateBlock _Nonnull)byCurrentOffsetDate;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCurrentTimestampStr;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampOffsetSec;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampSec;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampOffsetMilliSec;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampMilliSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentEra;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentYear;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentMonth;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentDay;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentHour;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentMin;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentNanoSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekday;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekdayOrdinal;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentQuarter;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekOfMonth;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekOfYear;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentYearForWeekOfYear;
-(JobsRetJobsTimeModelByDateBlock _Nonnull)byCustomDate;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCustomTimestampStr;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCustomTimestampSec;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCustomTimestampMilliSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomEra;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomYear;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomMonth;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomDay;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomHour;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomMin;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomNanoSec;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekday;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekdayOrdinal;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomQuarter;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekOfMonth;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekOfYear;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomYearForWeekOfYear;
-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byLocalTimeZone;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCustomTimeZoneStr;
-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byCustomTimeZone;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateFormatterStr;
-(JobsRetJobsTimeModelByNSDateFormatterPointerBlock _Nonnull)byDateFormatter;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byTimeOffset;
-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomTimeOffset;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byYear;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byMonth;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDay;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byHour;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byMinute;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)bySecond;
-(JobsRetJobsTimeModelByDateBlock _Nonnull)byDate;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateStr;
-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateReadableStr;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byIntervalBySec;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byIntervalByMilliSec;
-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byTimeZone;
-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byTimeInterval;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSTIMEMODEL_DSL_A007DD5E8C3A232 */
