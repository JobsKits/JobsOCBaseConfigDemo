//
//  JobsTimeModel+DSL.m
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#import "JobsTimeModel+DSL.h"

@implementation JobsTimeModel (DSL)

#pragma mark —— 来自 JobsTimeModel
-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(CGFloat data))byCurrentDateOffsetSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(CGFloat data) {
        @jobs_strongify(self)
        self.currentDateOffsetSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byCurrentOffsetDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.currentOffsetDate = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCurrentTimestampStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.currentTimestampStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampOffsetSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampOffsetSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampOffsetMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampOffsetMilliSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCurrentTimestampMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.currentTimestampMilliSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentEra{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentEra = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentMonth = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentDay = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentHour = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentMin{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentMin = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentNanoSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentNanoSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekday{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekday = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekdayOrdinal{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekdayOrdinal = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentQuarter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentQuarter = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekOfMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekOfMonth = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentWeekOfYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCurrentYearForWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.currentYearForWeekOfYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byCustomDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.customDate = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomTimestampStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customTimestampStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCustomTimestampSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.customTimestampSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byCustomTimestampMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.customTimestampMilliSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomEra{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customEra = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customMonth = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customDay = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customHour = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomMin{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customMin = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomNanoSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customNanoSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekday{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekday = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekdayOrdinal{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekdayOrdinal = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomQuarter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customQuarter = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekOfMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekOfMonth = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customWeekOfYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomYearForWeekOfYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customYearForWeekOfYear = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byLocalTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeZone * data) {
        @jobs_strongify(self)
        self.localTimeZone = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byCustomTimeZoneStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.customTimeZoneStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byCustomTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeZone * data) {
        @jobs_strongify(self)
        self.customTimeZone = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateFormatterStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.dateFormatterStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDateFormatter * data))byDateFormatter{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSDateFormatter * data) {
        @jobs_strongify(self)
        self.dateFormatter = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byTimeOffset{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.timeOffset = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSInteger data))byCustomTimeOffset{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSInteger data) {
        @jobs_strongify(self)
        self.customTimeOffset = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byYear{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.year = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byMonth{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.month = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDay{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.day = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byHour{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.hour = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byMinute{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.minute = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))bySecond{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.second = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSDate * data))byDate{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSDate * data) {
        @jobs_strongify(self)
        self.date = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.dateStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSString * data))byDateReadableStr{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSString * data) {
        @jobs_strongify(self)
        self.dateReadableStr = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byIntervalBySec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.intervalBySec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byIntervalByMilliSec{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.intervalByMilliSec = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeZone * data))byTimeZone{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeZone * data) {
        @jobs_strongify(self)
        self.timeZone = data;
        return self;
    };
}

-(__kindof JobsTimeModel *_Nonnull (^ _Nonnull)(NSTimeInterval data))byTimeInterval{
    @jobs_weakify(self)
    return ^__kindof JobsTimeModel *_Nonnull(NSTimeInterval data) {
        @jobs_strongify(self)
        self.timeInterval = data;
        return self;
    };
}

@end
