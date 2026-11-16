//
//  NSString+JobsModelTime.m
//  JobsModel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "NSString+JobsModelTime.h"

BOOL JobsModelParseTimestamp(NSString *value, BOOL milliseconds, NSTimeInterval *seconds) {
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

@implementation NSString (JobsModelTime)

-(JobsRetStrByStrBlock _Nonnull)chinaTime{
    __weak NSString *weakSelf = self;
    return ^NSString *_Nullable(NSString *_Nullable format){
        NSString *owner = weakSelf;
        return [owner timeStampByTimeFormatter:format
                                  timeZoneType:TimeZoneTypeCSTChina
                                 intervalStyle:intervalByMilliSec];
    };
}

-(NSString *_Nullable)timeStampByTimeFormatter:(NSString *_Nullable)timeFormatter
                                 timeZoneType:(TimeZoneType)timeZoneType
                                intervalStyle:(IntervalStyle)intervalStyle{
    if (intervalStyle != intervalBySec && intervalStyle != intervalByMilliSec) {
        return nil;
    }
    NSTimeInterval seconds = 0;
    if (!JobsModelParseTimestamp(self, intervalStyle == intervalByMilliSec, &seconds)) {
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

@end
