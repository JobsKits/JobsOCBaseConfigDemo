//
//  NSString+Time.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Time.h"

#import "NSDate+Extra.h"
#import "NSFormatter+Extra.h"
#import "NSDateFormatter+Extra.h"

static BOOL JobsParseTimestamp(NSString *value, BOOL milliseconds, NSTimeInterval *seconds) {
    if (!value.length || !seconds) {
        return NO;
    }
    const char *input = value.UTF8String;
    NSUInteger length = [value lengthOfBytesUsingEncoding:NSUTF8StringEncoding];
    if (!input || !length) {
        return NO;
    }
    BOOL hasDecimal = NO;
    BOOL hasDigit = NO;
    // 使用完整字节长度，不能让嵌入 NUL 绕过尾部校验。
    for (NSUInteger index = 0; index < length; index++) {
        char character = input[index];
        if (character == '.' && !hasDecimal) {
            hasDecimal = YES;
        } else if (character >= '0' && character <= '9') {
            hasDigit = YES;
        } else {
            return NO;
        }
    }
    char *end = NULL;
    errno = 0;
    double number = strtod(input, &end);
    if (!hasDigit || errno || end != input + length || !isfinite(number) || number < 0) {
        return NO;
    }
    *seconds = milliseconds ? number / 1000.0 : number;
    return YES;
}

// 与现有 TimeZoneType 的 IANA 语义一致；底层原语不调用上层 DSL。
static NSTimeZone *JobsModelTimestampTimeZone(TimeZoneType type) {
    static NSDictionary<NSNumber *, NSString *> *names;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        names = @{
            @(TimeZoneTypeUTC): @"UTC",
            @(TimeZoneTypeGMT): @"GMT",
            @(TimeZoneTypePST): @"America/Los_Angeles",
            @(TimeZoneTypeEST): @"America/New_York",
            @(TimeZoneTypeCST): @"America/Chicago",
            @(TimeZoneTypeMST): @"America/Denver",
            @(TimeZoneTypeCSTChina): @"Asia/Shanghai",
            @(TimeZoneTypeJST): @"Asia/Tokyo",
            @(TimeZoneTypeBST): @"Europe/London",
            @(TimeZoneTypeAEST): @"Australia/Sydney",
            @(TimeZoneTypeAWST): @"Australia/Perth",
            @(TimeZoneTypeCET): @"Europe/Berlin",
            @(TimeZoneTypeMSK): @"Europe/Moscow",
            @(TimeZoneTypeIST): @"Asia/Kolkata",
            @(TimeZoneTypeBRT): @"America/Sao_Paulo",
            @(TimeZoneTypeCSTMexico): @"America/Mexico_City",
            @(TimeZoneTypeART): @"America/Argentina/Buenos_Aires",
            @(TimeZoneTypeHST): @"Pacific/Honolulu",
            @(TimeZoneTypeAKST): @"America/Anchorage",
            @(TimeZoneTypeCEST): @"Europe/Berlin",
            @(TimeZoneTypeEET): @"Europe/Helsinki",
            @(TimeZoneTypeWET): @"Europe/Lisbon",
            @(TimeZoneTypeNST): @"America/St_Johns",
            @(TimeZoneTypeAST): @"America/Halifax",
            @(TimeZoneTypePDT): @"America/Los_Angeles",
            @(TimeZoneTypeMDT): @"America/Denver",
            @(TimeZoneTypeCDT): @"America/Chicago",
            @(TimeZoneTypeEDT): @"America/New_York",
            @(TimeZoneTypeNZST): @"Pacific/Auckland",
            @(TimeZoneTypeHKT): @"Asia/Hong_Kong",
            @(TimeZoneTypeSGT): @"Asia/Singapore",
            @(TimeZoneTypeMYT): @"Asia/Kuala_Lumpur",
            @(TimeZoneTypeKST): @"Asia/Seoul"
        };
    });
    NSString *name = names[@(type)];
    return name ? [NSTimeZone timeZoneWithName:name] : NSTimeZone.defaultTimeZone;
}

@implementation NSString (JobsTimeUtilsTime)
/// 格式化为中国时间
-(JobsRetStrByStrBlock _Nonnull)chinaTime{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSString *_Nullable timeFormatter){
        @jobs_strongify(self)
        return [self timeStampByTimeFormatter:timeFormatter
                                 timeZoneType:TimeZoneTypeCSTChina
                                intervalStyle:intervalByMilliSec];
    };
}
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsRetStrByStrBlock _Nonnull)readableTimeByFormatter{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable timeFormat){
        @jobs_strongify(self)
        if(isNull(timeFormat)) timeFormat = @"yyyy-MM-dd HH:mm:ss";
        double sec = 0;
        if (!JobsParseTimestamp(self, self.length == 13, &sec)) return nil;
        if(self.length == 10){
            sec = self.doubleValue;/// 秒级时间戳（10位）
        }else if (self.length == 13){
            sec = self.doubleValue / 1000.0;/// 毫秒级时间戳（13位）
        }else{
            JobsLog(@"不是正确的时间戳，请检查");
            toastBy(@"不是正确的时间戳，请检查".jobsTr());
            return nil;
        };return jobsMakeDateFormatter(^(__kindof NSDateFormatter *_Nullable dateFormatter) {
            dateFormatter.byDateFormat(timeFormat);
        }).stringByDate(NSDate.initDateBy(sec));
    };
}
///（字符串）时间戳依据某一规范，格式化为能一目了然的时间（字符串）
/// - Parameters:
///   - timeFormatter: timeFormatter
///   - timeZoneType: 时区
///   - intervalStyle: IntervalStyle
-(NSString *)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                         timeZoneType:(TimeZoneType)timeZoneType
                        intervalStyle:(IntervalStyle)intervalStyle{
    if (intervalStyle != intervalBySec && intervalStyle != intervalByMilliSec) {
        return nil;
    }
    NSTimeInterval seconds = 0;
    if (!JobsParseTimestamp(self, intervalStyle == intervalByMilliSec, &seconds)) {
        return nil;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:seconds];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
    formatter.calendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    formatter.timeZone = JobsModelTimestampTimeZone(timeZoneType);
    formatter.dateFormat = timeFormatter.length ? timeFormatter : @"yyyy-MM-dd HH:mm:ss";
    return [formatter stringFromDate:date];
}
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsRetBOOLByVoidBlock _Nonnull)isExpired{
    @jobs_weakify(self)
    return ^BOOL(){
        @jobs_strongify(self)
        if (!self.length) return NO;
        NSTimeInterval timeStamp = 0;
        if ((self.length != 10 && self.length != 13) || !JobsParseTimestamp(self, self.length == 13, &timeStamp)) return YES;
        NSDate *dateFromTimeStamp = NSDate.initDateBy(timeStamp);
        /// 比较当前时间和时间戳所代表的时间
        NSComparisonResult result = [NSDate.date compare:dateFromTimeStamp];
        /// 如果当前时间晚于时间戳所代表的时间，返回 YES
        return (result == NSOrderedDescending);
    };
}
/// OC字符串转NSDate
-(JobsRetDateByDateFormatterBlock _Nonnull)dataByDateFormatter{
    @jobs_weakify(self)
    return ^NSDate *_Nullable(NSDateFormatter *_Nullable data){
        @jobs_strongify(self)
        return [data dateFromString:self];
    };
}

@end
