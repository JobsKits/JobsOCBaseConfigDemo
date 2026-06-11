//
//  NSDateFormatter+DSL.m
//  JobsOCDSL
//
#import "NSDateFormatter+DSL.h"

@implementation NSDateFormatter (JobsChain)
+(JobsRetDateFormatterByVoidBlock)byDateFormatter{
    return ^__kindof NSDateFormatter *_Nullable(void){
        return [[self alloc] init];
    };
}

+(JobsRetDateFormatterByStrBlock)byDateFormatterWithDateFormat{
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        NSDateFormatter *formatter = [[self alloc] init];
        formatter.dateFormat = data;
        return formatter;
    };
}

-(JobsRetDateFormatterByStrBlock)byDateFormat{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.dateFormat = data;
        return self;
    };
}

-(JobsRetDateFormatterByLocaleBlock)byLocale{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSLocale *_Nullable data){
        @jobs_strongify(self)
        self.locale = data;
        return self;
    };
}

-(JobsRetDateFormatterByTimeZoneBlock)byTimeZone{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSTimeZone *_Nullable data){
        @jobs_strongify(self)
        self.timeZone = data;
        return self;
    };
}

-(JobsRetDateFormatterByCalendarBlock)byCalendar{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSCalendar *_Nullable data){
        @jobs_strongify(self)
        self.calendar = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterStyleBlock)byDateStyle{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterStyle data){
        @jobs_strongify(self)
        self.dateStyle = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterStyleBlock)byTimeStyle{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterStyle data){
        @jobs_strongify(self)
        self.timeStyle = data;
        return self;
    };
}

-(JobsRetDateFormatterByDateFormatterBehaviorBlock)byFormatterBehavior{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(NSDateFormatterBehavior data){
        @jobs_strongify(self)
        self.formatterBehavior = data;
        return self;
    };
}

-(JobsRetDateFormatterByBOOLBlock)byLenient{
    @jobs_weakify(self)
    return ^__kindof NSDateFormatter *_Nullable(BOOL data){
        @jobs_strongify(self)
        self.lenient = data;
        return self;
    };
}

-(JobsRetStrByDateBlock)byStringFromDate{
    @jobs_weakify(self)
    return ^__kindof NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        return date ? [self stringFromDate:date] : nil;
    };
}

-(JobsRetDateByStrBlock)byDateFromString{
    @jobs_weakify(self)
    return ^__kindof NSDate *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        return data ? [self dateFromString:data] : nil;
    };
}

@end
