//
//  NSObject+Time.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Time.h"
#import <JobsTimeUtils/NSDateFormatter+Extra.h>
#import <JobsTimeUtils/NSFormatter+Extra.h>
#import <JobsTimeUtils/NSDate+Extra.h>
#import <JobsTimeUtils/NSCalendar+Extra.h>
#import <JobsTimeUtils/NSMutableArray+Extra.h>
#import <JobsTimeUtils/NSTimeZone+Extra.h>

@implementation NSObject (Time)
/// 获取当前时间
-(NSDate *)currentDate{
    return NSDate.date;
}
/// 获取当前手机时区的当前时间，返回 NSString 格式
-(JobsRetStrByStrBlock _Nonnull)currentTimeStringBy{
    return ^__kindof NSString *_Nullable(__kindof NSString *_Nullable data){
        return [self.dateFormatterBy(data) stringFromDate:self.currentDate];
    };
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年-月-日 时:分:秒
-(NSString *)currentTimeStringByStyle1{
    return self.currentTimeStringBy(nil);
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年-月-日 时:分
-(NSString *)currentTimeStringByStyle2{
    return self.currentTimeStringBy(@"yyyy-MM-dd HH:mm");
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年-月-日 时
-(NSString *)currentTimeStringByStyle3{
    return self.currentTimeStringBy(@"yyyy-MM-dd HH");
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年-月-日
-(NSString *)currentTimeStringByStyle4{
    return self.currentTimeStringBy(@"yyyy-MM-dd");
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年-月
-(NSString *)currentTimeStringByStyle5{
    return self.currentTimeStringBy(@"yyyy-MM");
}
/// 获取当前手机时区的当前时间，返回 NSString 格式。时间格式 年
-(NSString *)currentTimeStringByStyle6{
    return self.currentTimeStringBy(@"yyyy");
}
/// 获取当日零点的时间戳（秒级）
-(NSTimeInterval)todayZeroTime{
    /// 获取今天零点的时间戳（秒级）
    NSTimeInterval midnightTimestamp = self._zeroTime.timeIntervalSince1970;
    /// 打印零点时间戳
    JobsLog(@"今天零点的时间戳（秒级）：%.0f", midnightTimestamp);
    return midnightTimestamp;
}
/// 获取某天前零点的时间戳（秒级）
-(JobsRetDoubleByNSIntegerBlock _Nonnull)zeroTimeByDaysBefore{
    @jobs_weakify(self)
    return ^NSTimeInterval(NSInteger days){
        @jobs_strongify(self)
        /// 计算24小时前的零点
        NSDate *dayBeforeMidnight = self._zeroTime.byAddingTimeInterval(-(days * 24 * 60 * 60));
        /// 获取24小时前零点的时间戳（秒级）
        NSTimeInterval dayBeforeMidnightTimestamp = dayBeforeMidnight.timeIntervalSince1970;
        /// 打印24小时前的零点时间戳
        JobsLog(@"24小时前零点的时间戳（秒级）：%.0f", dayBeforeMidnightTimestamp);
        return dayBeforeMidnightTimestamp;
    };
}
/// 返回的是（Double）时间戳
-(NSTimeInterval)currentUnixTimeStamp{
    return self.currentDate.timeIntervalSince1970;/// 获取 Unix 时间戳 ：1970 到 当前日期和时间
}
/// 返回的是（uint64_t）时间戳
-(uint64_t)currentUnixTimeStampInMilliseconds{
    return self.currentUnixTimeStamp * 1000;/// 获取 Unix 时间戳 ：1970 到 当前日期和时间。将秒数转换为毫秒数
}
/// 返回带时间格式的当前时间字符串
-(JobsRetStrByStrBlock _Nonnull)currentTimestampString{
    @jobs_weakify(self)
    return ^ __kindof NSString *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return self.dateFormatterBy(data).date(self.currentDate);
    };
}
/// 获取某天前的时间。默认时间格式 yyyy-MM-dd HH:mm:ss
-(NSString *)timeAgo:(NSInteger)timeAgo
          dateFormat:(NSString *_Nullable)dateFormat{
    return self.dateFormatterBy(dateFormat).stringByDate([NSCalendar.currentCalendar dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.day = -timeAgo; /// 设置为timeAgo天前
    }) toDate:self.currentDate options:0]);
}
/// 获取某天前的时间。时间格式 yyyy-MM-dd HH:mm:ss
-(JobsRetStrByIntegersBlock _Nonnull)daysAgoBy{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSInteger timeAgo, ...) {
        @jobs_strongify(self)
        /// 默认日期格式
        NSString *dateFormat = @"yyyy-MM-dd HH:mm:ss";
        /// 处理可变参数
        va_list args;
        va_start(args, timeAgo);
        NSString *customFormat = va_arg(args, NSString *);
        va_end(args);
        /// 如果有传入自定义格式，覆盖默认格式
        if (customFormat) dateFormat = customFormat;
        /// 调用实例方法来获取格式化字符串
        return [self timeAgo:timeAgo dateFormat:dateFormat];
    };
}
/// 将时间戳按照 yyyy-MM-dd HH:mm:ss 的格式转化为人类可读的时间
/// 入参不能是毫秒级的时间戳
-(JobsRetStrByTimeIntervalsBlock _Nonnull)readableTimeByStyle1{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSTimeInterval data, ...) {
        @jobs_strongify(self)
        /// 默认日期格式
        NSString *dateFormat = @"yyyy-MM-dd HH:mm:ss";
        /// 处理可变参数
        va_list args;
        va_start(args, data);
        NSString *customFormat = va_arg(args, NSString *);
        va_end(args);
        /// 如果有传入自定义格式，覆盖默认格式
        if (customFormat) dateFormat = customFormat;
        /// 格式化并返回字符串
        return self.dateFormatterBy(dateFormat).stringByDate(NSDate.initDateBy(data));
    };
}
#pragma mark —— 时间格式转换
/// 字符串转时间格式
-(JobsRetDateFormatterByStrBlock _Nonnull)dateFormatterBy{
    return ^NSDateFormatter *_Nullable(NSString *_Nullable dateFormat){
        if(isNull(dateFormat)) dateFormat = @"yyyy-MM-dd HH:mm:ss";
        return jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.dateFormat = dateFormat;/// 设置时间格式
            data.timeZone = NSTimeZone.localTimeZone;/// 使用本地时区
            data.locale = NSLocale.currentLocale;
        });
    };
}
/// NSDate * ---> NSString *   (NSDate*)时间 转 (NSString*)时间戳（毫秒级）
/// @param date 不传值则为当前时间
-(NSString *)dateConversionTimeStamp:(NSDate *_Nullable)date
                       intervalStyle:(IntervalStyle)intervalStyle{
    if (!date) date = self.currentDate;
    NSString *timeSp = nil;
    if (intervalStyle == intervalBySec) {
        timeSp = toStringByLongLong(date.timeIntervalSince1970);
    }else if(intervalStyle == intervalByMilliSec){
        timeSp = toStringByLongLong(date.timeIntervalSince1970 * 1000);
    }return timeSp;
}
/// NSTimeInterval ---> NSString *
-(JobsRetStrByTimeIntervalBlock _Nonnull)timeIntervalByInterval{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSTimeInterval interval){
        @jobs_strongify(self)
        return [self dateConversionTimeStamp:self.dateByTimeInterval(interval)
                               intervalStyle:intervalBySec];
    };
}
/// NSDate * ---> NSTimeInterval
-(JobsRetTimeIntervalByDateBlock _Nonnull)timeIntervalByDate{
    return ^NSTimeInterval(NSDate *_Nullable date){
        if(!date) date = self.currentDate;
        NSTimeInterval interval = date.timeIntervalSince1970;
        return interval;
    };
}
/// NSString * ---> NSTimeInterval
-(NSTimeInterval)timeIntervalByDateStr:(NSString *_Nullable)dateStr
                         timeFormatter:(NSString *_Nullable)timeFormatter
                         intervalStyle:(IntervalStyle)intervalStyle{
    NSTimeInterval interval = 0;
    if (intervalStyle == intervalBySec) {
        interval = [self strByDate:dateStr timeFormatter:timeFormatter].timeIntervalSince1970;
    }else if (intervalStyle == intervalByMilliSec){
        interval = [self strByDate:dateStr timeFormatter:timeFormatter].timeIntervalSince1970 * 1000;
    }else{}return interval;
}
/// NSTimeInterval ---> NSDate *
-(JobsRetDateByTimeIntervalBlock _Nonnull)dateByTimeInterval{
    return ^NSDate *_Nullable(NSTimeInterval interval){
        NSDate *date = nil;
        if(interval)date = NSDate.initDateBy(interval);
        else date = self.currentDate;
        return date;
    };
}
/// NSString * ---> NSDate *  (NSString *)时间 转 (NSDate *时间)
-(NSDate *)strByDate:(NSString *_Nonnull)dateStr
       timeFormatter:(NSString *_Nullable)timeFormatter{
    return dateStr.dataByDateFormatter(self.dateFormatterBy(timeFormatter));
}
#pragma mark —— 功能性的
/// 可以获得两个日期之间的时间间隔
/// @param startTime （给定） 开始时间【字符串格式】
/// @param endTime （可以不用给定）结束时间【字符串格式】
/// @param timeFormatter 时间格式：缺省值@"yyyy-MM-dd HH:mm:ss"
-(NSTimeInterval)timeIntervalstartDate:(NSString *_Nonnull)startTime
                               endDate:(NSString *_Nullable)endTime
                         timeFormatter:(NSString *_Nullable)timeFormatter{
    /// 创建日期格式化器
    NSDateFormatter *dateFormatter = self.dateFormatterBy(nil);
    /// 将 startTime 转换为 NSDate
    NSDate *startDate = dateFormatter.dateByString(startTime);
    if (!startDate) {
        JobsLog(@"开始时间格式不正确");
        return 0;
    }
    /// 如果 endTime 未提供，则使用当前时间
    NSDate *endDate = endTime ? dateFormatter.dateByString(endTime) : self.currentDate;
    if (!endDate) {
        JobsLog(@"结束时间格式不正确");
        return 0;
    }return endDate.timeIntervalSinceDate(startDate);/// 计算两个日期之间的时间间隔
}
/**
    iOS 获取 加上多少时间以后的时间A (NSDate *) = 基础时间（NSDate *） +  时间间隔（NSInteger）
    参考资料：
    https://www.jianshu.com/p/5f4e7fabcc02
    https://blog.csdn.net/weixin_34055787/article/details/91893379
 */
-(NSDate *)getDate:(NSDate *_Nonnull)date
  afterIntegerTime:(NSInteger)afterIntegerTime{
    return [[NSCalendar.alloc initWithCalendarIdentifier:NSCalendarIdentifierGregorian] dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.hour = afterIntegerTime;
    })toDate:date options:0];
}
/// 以当前时间为基准，加上某个时间间隔（NSTimeInterval类型）以后的NSData值
-(JobsRetDateByTimeIntervalBlock _Nonnull)getDateFromCurrentAfterTimeInterval{
    return ^NSDate *_Nullable(NSTimeInterval timeInterval){
        return [NSDate.alloc initWithTimeIntervalSinceNow:timeInterval];
    };
}
/// 计算两字符串时间的差值【方法一】
-(NSTimeInterval)intervalDifferenceBetweenStarTime:(NSString *)starTime
                                         toEndTime:(NSString *)endTime
                                   byDateFormatter:(NSDateFormatter *)dateFormatter{
    if (!dateFormatter) dateFormatter = self.dateFormatterBy(@"HH:mm:ss");
    NSDate *startDate = starTime.dataByDateFormatter(dateFormatter);
    NSDate *endDate = endTime.dataByDateFormatter(dateFormatter);
    NSTimeInterval time = [endDate timeIntervalSinceDate:startDate];
    return time;
}
/// 计算两字符串时间的差值【方法二】
-(NSDateComponents *)dateComponentsDiffBetweenStarTime:(NSString *)starTime
                                             toEndTime:(NSString *)endTime
                                       byDateFormatter:(NSDateFormatter *)dateFormatter{
    if (!dateFormatter) dateFormatter = self.dateFormatterBy(@"HH:mm:ss");
    NSDate *date1 = dateFormatter.dateByString(starTime);
    NSDate *date2 = dateFormatter.dateByString(endTime);
    
    NSCalendarUnit type =
    NSCalendarUnitYear |
    NSCalendarUnitMonth |
    NSCalendarUnitDay |
    NSCalendarUnitHour |
    NSCalendarUnitMinute |
    NSCalendarUnitSecond;
    /// 利用日历对象比较两个时间的差值
    NSDateComponents *cmps = [NSCalendar.currentCalendar components:type
                                                           fromDate:date1
                                                             toDate:date2
                                                            options:0];
    JobsLog(@"两个时间相差%ld年%ld月%ld日%ld小时%ld分钟%ld秒",
          cmps.year,
          cmps.month,
          cmps.day,
          cmps.hour,
          cmps.minute,
          cmps.second);
    return cmps;
}
/**

     在当前日期时间加上 某个时间段(传负数即返回当前时间之前x月x日的时间)
     @param year 当前时间若干年后 （传负数为当前时间若干年前）
     @param month 当前时间若干月后  （传0即与当前时间一样）
     @param day 当前时间若干天后
     @param hour 当前时间若干小时后
     @param minute 当前时间若干分钟后
     @param second 当前时间若干秒后
     参考资料：https://blog.csdn.net/autom_lishun/article/details/79094241
 */
-(NSArray <NSString *>*)dateStringAfterlocalDateForYear:(NSInteger)year
                                                  month:(NSInteger)month
                                                    day:(NSInteger)day
                                                   hour:(NSInteger)hour
                                                 minute:(NSInteger)minute
                                                 second:(NSInteger)second
                                          timeFormatter:(NSString *_Nullable)timeFormatter{
    NSCalendar *calender =  NSCalendar.initByCalendarIdentifier(NSCalendarIdentifierGregorian);
    NSDate *minDate = [calender dateByAddingComponents:jobsMakeDateComponents(^(NSDateComponents * _Nullable dateComponents) {
        dateComponents.year = year;
        dateComponents.month = month;
        dateComponents.day = day;
        dateComponents.hour = hour;
        dateComponents.minute = minute;
        dateComponents.second = second;
    })toDate:self.currentDate options:0];
    NSDateComponents *components = [calender components:NSCalendarUnitYear |
                                    NSCalendarUnitMonth |
                                    NSCalendarUnitDay |
                                    NSCalendarUnitHour
                                               fromDate:minDate];
    return jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable arr) {
        arr.add(toStringByLong(components.year))
        .add(toStringByLong(components.month))
        .add(toStringByLong(components.day))
        .add(toStringByLong(components.hour));
    });
}
/// 判断某个时间是否为  今天（系统时区）
/// 对比格式：yyyy-MM-dd
-(JobsRetBOOLByDateBlock _Nonnull)isToday{
    return ^BOOL(NSDate *_Nullable date){
        NSDateFormatter *fmt = jobsMakeDateFormatter(^(__kindof NSDateFormatter * _Nullable data) {
            data.timeZone = NSTimeZone.systemTimeZone; // 系统时区
            data.dateStyle = NSDateFormatterMediumStyle;
            data.timeStyle = NSDateFormatterShortStyle;
            data.dateFormat = @"yyyy-MM-dd";
        });
        NSString *dateStr = fmt.date(date);
        NSString *nowStr = fmt.date(JobsTimeModel.new.currentDate);// Now
        return [dateStr isEqualToString:nowStr];
    };
}
/// 将NSTimeInterval类型的时间戳翻译成人类能看懂的文字
-(JobsRetStrByTimeIntervalBlock _Nonnull)toReadableTimeBy{
    return ^__kindof NSString *_Nullable(NSTimeInterval timeInterval){
        /// 获取年、月、日、时、分、秒等信息
        NSDateComponents *components = [NSCalendar.currentCalendar components:(NSCalendarUnitYear |
                                                                               NSCalendarUnitMonth |
                                                                               NSCalendarUnitDay |
                                                                               NSCalendarUnitHour |
                                                                               NSCalendarUnitMinute |
                                                                               NSCalendarUnitSecond)
                                                                     fromDate:NSDate.initDateBy(timeInterval)];
        /// 拼接字符串，格式化为可读的时间
        return [NSString stringWithFormat:@"%ld年%ld月%ld日 %02ld:%02ld:%02ld",
                components.year,
                components.month,
                components.day,
                components.hour,
                components.minute,
                components.second];
    };
}
/// 接受一个秒数，对这个秒数进行解析出：时、分、秒，存入JobsTimeModel，外层再对这个JobsTimeModel进行取值，对数据进行拼装
-(JobsReturnTimeModelByIntegerBlock _Nonnull)HHMMSS{
    return ^JobsTimeModel *(NSInteger TimeSec){
        return jobsMakeTimeModel(^(__kindof JobsTimeModel *_Nullable data) {
            data.byCustomHour(toStringByFloatDecimalPlaces(TimeSec / 3600, 2).integerValue)
                .byCustomMin(toStringByFloatDecimalPlaces((TimeSec % 3600) / 60, 2).integerValue)
                .byCustomSec(toStringByFloatDecimalPlaces(TimeSec % 60, 2).integerValue);
        });
    };
}
/// 获得今天的时间：年/月/日
-(JobsReturnTimeModelByStringBlock _Nonnull)getToday{
    @jobs_weakify(self)
    return ^JobsTimeModel *_Nullable(NSString *_Nullable dateFormat){
        @jobs_strongify(self )
        NSDateFormatter *formatter = self.dateFormatterBy(dateFormat);
        NSString *dateTime_Str = formatter.date(self.currentDate); /// 今天
        NSDate *dateTime_Date = dateTime_Str.dataByDateFormatter(formatter);
        NSTimeInterval interval = NSTimeZone.systemTimeZone.GMTDateSecs(self.currentDate);/// 偏移秒数
        return jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
            data.byDateStr(dateTime_Str)
                .byDate(dateTime_Date)
                .byIntervalBySec(interval)
                .byIntervalByMilliSec(data.intervalBySec * 1000);
        });
    };
}
/// 各个具体时间的拆解
-(JobsTimeModel *)makeSpecificTime{
    NSCalendar *calendar = NSCalendar.currentCalendar;
    NSUInteger unitFlags;
    if (@available(iOS 8.0, *)) {
        unitFlags = NSCalendarUnitEra |
        NSCalendarUnitYear |
        NSCalendarUnitMonth |
        NSCalendarUnitDay |
        NSCalendarUnitHour |
        NSCalendarUnitMinute |
        NSCalendarUnitSecond |
        NSCalendarUnitWeekday |
        NSCalendarUnitWeekdayOrdinal |
        NSCalendarUnitQuarter |
        NSCalendarUnitWeekOfMonth |
        NSCalendarUnitWeekOfYear |
        NSCalendarUnitYearForWeekOfYear |
        NSCalendarUnitNanosecond |
        NSCalendarUnitCalendar |
        NSCalendarUnitTimeZone;
    }else{
        SuppressWdeprecatedDeclarationsWarning(unitFlags = NSEraCalendarUnit |
                                               NSYearCalendarUnit |
                                               NSMonthCalendarUnit |
                                               NSDayCalendarUnit |
                                               NSHourCalendarUnit |
                                               NSMinuteCalendarUnit |
                                               NSSecondCalendarUnit |
                                               NSWeekCalendarUnit |
                                               NSWeekdayCalendarUnit |
                                               NSWeekdayOrdinalCalendarUnit |
                                               NSQuarterCalendarUnit |
                                               NSWeekOfMonthCalendarUnit |
                                               NSWeekOfYearCalendarUnit |
                                               NSYearForWeekOfYearCalendarUnit |
                                               NSCalendarCalendarUnit |
                                               NSTimeZoneCalendarUnit);
    }return jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable timeModel) {
        NSDateComponents *dateComponent = [calendar components:unitFlags
                                                      fromDate:timeModel.currentDate];
        timeModel.byCurrentEra(dateComponent.era)
                 .byCurrentYear(dateComponent.year)
                 .byCurrentMonth(dateComponent.month)
                 .byCurrentDay(dateComponent.day)
                 .byCurrentHour(dateComponent.hour)
                 .byCurrentMin(dateComponent.minute)
                 .byCurrentSec(dateComponent.second)
                 .byCurrentNanoSec(dateComponent.nanosecond)//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0))
                 .byCurrentWeekday(dateComponent.weekday)//表示周里面的天 1代表周日 2代表周一 7代表周六
                 .byCurrentWeekdayOrdinal(dateComponent.weekdayOrdinal);
        timeModel.currentQuarter = dateComponent.quarter;//API_AVAILABLE(macos(10.6), ios(4.0), watchos(2.0), tvos(9.0));
        timeModel.byCurrentWeekOfMonth(dateComponent.weekOfMonth);//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0))
        timeModel.currentWeekOfYear = dateComponent.weekOfYear;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
        timeModel.currentYearForWeekOfYear = dateComponent.yearForWeekOfYear;//API_AVAILABLE(macos(10.7), ios(5.0), watchos(2.0), tvos(9.0));
    });
}
/// 获得当前时间
-(JobsTimeModel *)currentTime{
    NSDate *date = self.currentDate;
    NSTimeZone *zone = NSTimeZone.systemTimeZone; /// 系统时区
    return jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
        data.byIntervalBySec(zone.GMTDateSecs(date))/// 偏移秒数
            .byDate(date.byAddingTimeInterval(data.intervalBySec))
            .byDateStr([NSObject dateConversionTimeStamp:data.date intervalStyle:intervalBySec]);
//        data.dateReadableStr = @"yyyy-MM-dd HH:mm:ss".
    });
}
/// 将某个（NSDate *）时间 转换格式
/// @param date 一个指定的时间，若未指定则为当前时间
/// @param timeFormatStr 时间格式 缺省值 @"MMM dd,yyyy HH:mm tt"
-(JobsTimeModel *)timeFormatterWithDate:(NSDate *_Nullable)date
                          timeFormatStr:(NSString *_Nullable)timeFormatStr{
    if(!date) date = NSDate.date;
    return jobsMakeTimeModel(^(__kindof JobsTimeModel *_Nullable timeModel) {
        timeModel.byDate(date)                                             // 时间字符串NSDate
                 .byDateStr(self.dateFormatterBy(timeFormatStr).date(date))// NSDate转时间字符串
                 .byIntervalBySec(date.timeIntervalSince1970)              // (NSDate *)时间转时间戳 单位：秒
                 .byIntervalByMilliSec(intervalBySec * 1000);               // (NSDate *)时间转时间戳 单位：毫秒
    });
}
/// NSString * ---> NSString *   格式转换为   小时：分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getHHMMSSFromStr:(NSString *_Nonnull)totalTime
                   formatTime:(JobsTimeModel *_Nullable)formatTime{
    if (!formatTime) {
        formatTime = jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
            data.year =
            data.month =
            data.day =
            data.hour =
            data.minute =
            data.bySecond(@":");
        });
    }return [formatTime formatTimeWithYear:nil
                                     month:nil
                                       day:nil
                                      hour:toStringByFloatDecimalPlaces(totalTime.integerValue / 3600, 2)
                                    minute:toStringByFloatDecimalPlaces((totalTime.integerValue % 3600) / 60, 2)
                                    second:toStringByFloatDecimalPlaces(totalTime.integerValue % 60, 2)];
}
/// NSString * ---> NSString * 格式转换为  分钟：秒
/// @param totalTime 传入 秒
-(NSString *)getMMSSFromStr:(NSString *_Nonnull)totalTime
                 formatTime:(JobsTimeModel *_Nullable)formatTime{
    if (!formatTime) {
        formatTime = jobsMakeTimeModel(^(__kindof JobsTimeModel * _Nullable data) {
            data.year =
            data.month =
            data.day =
            data.hour =
            data.minute =
            data.bySecond(JobsColon);
        });
    }return [formatTime formatTimeWithYear:nil
                                     month:nil
                                       day:nil
                                      hour:nil
                                    minute:toStringByFloatDecimalPlaces(totalTime.integerValue / 60, 0)
                                    second:toStringByFloatDecimalPlaces(totalTime.integerValue % 60, 0)];
}
#pragma mark —— 一些私有方法
-(NSDate *)_zeroTime{
    /// 获取当前日历
    NSCalendar *calendar = NSCalendar.currentCalendar;
    /// 提取当前日期的年、月、日部分
    NSDateComponents *components = [calendar components:(NSCalendarUnitYear |
                                                         NSCalendarUnitMonth |
                                                         NSCalendarUnitDay)
                                               fromDate:self.currentDate];
    /// 设置时间为今天的零点
    return calendar.dateByComponents(components);
}

@end
