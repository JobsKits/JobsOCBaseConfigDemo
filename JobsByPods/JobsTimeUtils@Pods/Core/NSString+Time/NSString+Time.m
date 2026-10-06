//
//  NSString+Time.m
//  JobsTimeUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Time.h"

#import <JobsTimeUtils/NSDate+Extra.h>
#import <JobsTimeUtils/NSFormatter+Extra.h>
#import <JobsTimeUtils/NSDateFormatter+Extra.h>

@implementation NSString (JobsTimeUtilsTime)
/// （字符串）时间戳 转换为可读时间（系统默认时区）
-(JobsRetStrByStrBlock _Nonnull)readableTimeByFormatter{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSString *_Nullable timeFormat){
        @jobs_strongify(self)
        if(isNull(timeFormat)) timeFormat = @"yyyy-MM-dd HH:mm:ss";
        double sec = 0;
        if (!JobsModelParseTimestamp(self, self.length == 13, &sec)) return nil;
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
/// 当前时间戳较之当前时间是否已过期【过期返回YES】
-(JobsRetBOOLByVoidBlock _Nonnull)isExpired{
    @jobs_weakify(self)
    return ^BOOL(){
        @jobs_strongify(self)
        if (!self.length) return NO;
        NSTimeInterval timeStamp = 0;
        if ((self.length != 10 && self.length != 13) || !JobsModelParseTimestamp(self, self.length == 13, &timeStamp)) return YES;
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
