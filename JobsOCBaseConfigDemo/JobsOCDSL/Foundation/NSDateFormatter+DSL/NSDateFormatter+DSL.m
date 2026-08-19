//
//  NSDateFormatter+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "NSDateFormatter+DSL.h"

@implementation NSDateFormatter (JobsChain)
+(JobsRetDateFormatterByVoidBlock _Nonnull)byDateFormatter{
    return ^__kindof NSDateFormatter *_Nullable(void){
        return [[self alloc] init];
    };
}

+(JobsRetDateFormatterByStrBlock _Nonnull)byDateFormatterWithDateFormat{
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        NSDateFormatter *formatter = [[self alloc] init];
        formatter.dateFormat = data;
        return formatter;
    };
}

-(JobsRetDateFormatterByStrBlock _Nonnull)byDateFormat{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.dateFormat = data;
        return self;
    };
}

-(JobsRetDateFormatterByLocaleBlock _Nonnull)byLocale{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSLocale *_Nullable data){
        @jobs_strongify(self)
        self.locale = data;
        return self;
    };
}

-(JobsRetDateFormatterByCalendarBlock _Nonnull)byCalendar{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSCalendar *_Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterStyleBlock _Nonnull)byDateStyle{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterStyle data){
        @jobs_strongify(self)
        self.dateStyle = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterStyleBlock _Nonnull)byTimeStyle{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterStyle data){
        @jobs_strongify(self)
        self.timeStyle = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterBehaviorBlock _Nonnull)byFormatterBehavior{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterBehavior data){
        @jobs_strongify(self)
        self.formatterBehavior = data;
        return self;
    };
}

-(JobsRetDateFormatterByBOOLBlock _Nonnull)byLenient{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.lenient = data;
        return self;
    };
}

-(JobsRetDateFormatterByStrBlock _Nonnull)bySetLocalizedDateFormatFromTemplate{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        if (@available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)) {
            [self setLocalizedDateFormatFromTemplate:data];
        };return self;
    };
}

-(JobsRetStrByDateBlock _Nonnull)byStringFromDate{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        return date ? [self stringFromDate:date] : nil;
    };
}

-(JobsRetDateByStrBlock _Nonnull)byDateFromString{
    @jobs_weakify(self)
    return ^__kindof NSDate *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self dateFromString:data] : nil;
    };
}

@end
