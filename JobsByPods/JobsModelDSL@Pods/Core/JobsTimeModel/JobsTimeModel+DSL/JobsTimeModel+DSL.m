//
//  JobsTimeModel+DSL.m
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#import "JobsTimeModel+DSL.h"

@implementation JobsTimeModel (DSL)

-(JobsRetJobsTimeModelByCGFloatBlock _Nonnull)byCurrentDateOffsetSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(CGFloat data) {
        @jobs_strongify(self)
        self.currentDateOffsetSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByDateBlock _Nonnull)byCurrentOffsetDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.currentOffsetDate = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCurrentTimestampStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.currentTimestampStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampOffsetSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampOffsetSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampOffsetMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampOffsetMilliSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCurrentTimestampMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampMilliSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentEra{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentEra = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentMonth = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentDay = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentHour = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentMin{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentMin = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentNanoSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentNanoSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekday{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekday = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekdayOrdinal{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekdayOrdinal = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentQuarter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentQuarter = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekOfMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekOfMonth = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekOfYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCurrentYearForWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.currentYearForWeekOfYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByDateBlock _Nonnull)byCustomDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.customDate = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCustomTimestampStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customTimestampStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCustomTimestampSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.customTimestampSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byCustomTimestampMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.customTimestampMilliSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomEra{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customEra = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customMonth = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customDay = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customHour = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomMin{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customMin = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomNanoSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customNanoSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekday{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekday = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekdayOrdinal{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekdayOrdinal = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomQuarter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customQuarter = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekOfMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekOfMonth = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekOfYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomYearForWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customYearForWeekOfYear = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byLocalTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeZone * _Nullable data) {
        @jobs_strongify(self)
        self.localTimeZone = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byCustomTimeZoneStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.customTimeZoneStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byCustomTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeZone * _Nullable data) {
        @jobs_strongify(self)
        self.customTimeZone = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateFormatterStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.dateFormatterStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSDateFormatterPointerBlock _Nonnull)byDateFormatter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSDateFormatter * _Nullable data) {
        @jobs_strongify(self)
        self.dateFormatter = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSIntegerBlock _Nonnull)byCustomTimeOffset{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSInteger data) {
        @jobs_strongify(self)
        self.customTimeOffset = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.year = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.month = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.day = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.hour = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byMinute{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.minute = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)bySecond{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.second = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByDateBlock _Nonnull)byDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSDate * _Nullable data) {
        @jobs_strongify(self)
        self.date = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.dateStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByStrBlock _Nonnull)byDateReadableStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSString * _Nullable data) {
        @jobs_strongify(self)
        self.dateReadableStr = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byIntervalBySec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.intervalBySec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byIntervalByMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.intervalByMilliSec = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByNSTimeZonePointerBlock _Nonnull)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeZone * _Nullable data) {
        @jobs_strongify(self)
        self.timeZone = data;
        return self;
    };
}

-(JobsRetJobsTimeModelByTimeIntervalBlock _Nonnull)byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nullable(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

@end
