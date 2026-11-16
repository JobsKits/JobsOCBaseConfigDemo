//
//  JobsOCWorldClockCatalog.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月16日，星期一.
//

#import "JobsOCWorldClockCatalog.h"

@implementation JobsOCWorldClockCatalog

+(NSDictionary<NSString *, id> *)snapshotForDate:(NSDate *)date
                               currentTimeZone:(NSTimeZone *)currentTimeZone{
    // 优先城市先占其当前有效偏移，余下系统时区补齐半小时、四十五分钟等组。
    NSArray<NSString *> *preferred = @[
        @"Europe/Paris", @"America/New_York", @"Europe/London", @"Asia/Shanghai",
        @"Asia/Tokyo", @"Asia/Seoul", @"Asia/Kolkata", @"Asia/Kathmandu",
        @"Asia/Dubai", @"Asia/Tehran", @"Asia/Kabul", @"Asia/Dhaka",
        @"Asia/Yangon", @"Asia/Bangkok", @"Australia/Eucla", @"Australia/Adelaide",
        @"Australia/Darwin", @"Australia/Sydney", @"Pacific/Chatham", @"Pacific/Auckland",
        @"Pacific/Tongatapu", @"Pacific/Kiritimati", @"America/Los_Angeles", @"America/Denver",
        @"America/Chicago", @"America/Phoenix", @"America/Anchorage", @"Pacific/Honolulu",
        @"Pacific/Pago_Pago", @"Pacific/Marquesas", @"Pacific/Gambier", @"America/St_Johns",
        @"America/Halifax", @"America/Sao_Paulo", @"Atlantic/South_Georgia", @"Atlantic/Azores",
        @"Atlantic/Cape_Verde", @"Africa/Johannesburg", @"Africa/Cairo", @"Africa/Nairobi",
        @"Asia/Karachi", @"Indian/Mauritius", @"Indian/Reunion", @"Indian/Chagos",
        @"Indian/Cocos", @"Pacific/Guadalcanal", @"Pacific/Noumea", @"Pacific/Port_Moresby",
        @"Pacific/Norfolk", @"Etc/GMT+12"
    ];
    NSArray<NSString *> *candidates = [preferred arrayByAddingObjectsFromArray:
        [NSTimeZone.knownTimeZoneNames sortedArrayUsingSelector:@selector(compare:)]];
    NSMutableDictionary<NSNumber *, NSDictionary *> *byOffset = jobsMakeMutDic(^(NSMutableDictionary *dictionary) {});
    for (NSString *name in candidates) {
        NSTimeZone *zone = NSTimeZone.byTimeZoneWithName(name);
        if (!zone) {
            continue;
        }
        NSNumber *offset = @(zone.bySecondsFromGMTForDate(date));
        if (!byOffset[offset]) {
            byOffset[offset] = @{@"zone": zone, @"offset": offset};
        }
    }
    NSMutableArray<NSDictionary *> *world = jobsMakeMutArr(^(NSMutableArray *array) {});
    for (NSNumber *offset in [byOffset.allKeys sortedArrayUsingSelector:@selector(compare:)]) {
        [world addObject:byOffset[offset]];
    }
    return @{
        @"current": @{@"zone": currentTimeZone, @"offset": @(currentTimeZone.bySecondsFromGMTForDate(date))},
        @"world": world.copy
    };
}

+(NSString *)timeForDate:(NSDate *)date
               timeZone:(NSTimeZone *)timeZone
            uses12Hours:(BOOL)uses12Hours{
    // 固定POSIX及AM/PM符号，不受用户语言的上午/下午或系统小时制覆盖。
    static NSDateFormatter *format24;
    static NSDateFormatter *format12;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        format24 = jobsMakeDateFormatter(^(NSDateFormatter *value) {
            value.byLocale([NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"])
                .byDateFormat(@"HH:mm:ss");
        });
        format12 = jobsMakeDateFormatter(^(NSDateFormatter *value) {
            value.byLocale([NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"])
                .byDateFormat(@"hh:mm:ss a");
            value.AMSymbol = @"AM";
            value.PMSymbol = @"PM";
        });
    });
    NSDateFormatter *formatter = uses12Hours ? format12 : format24;
    @synchronized (formatter) {
        formatter.byTimeZone(timeZone);
        return [formatter stringFromDate:date];
    }
}

@end
