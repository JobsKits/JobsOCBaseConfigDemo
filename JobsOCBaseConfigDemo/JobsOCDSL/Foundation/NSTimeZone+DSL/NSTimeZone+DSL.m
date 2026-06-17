//
//  NSTimeZone+DSL.m
//  JobsOCBaseConfigDemo
//
#import "NSTimeZone+DSL.h"

@implementation NSTimeZone (JobsChain)
+(JobsRetTimeZoneByVoidBlock)bySystemTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self systemTimeZone];
    };
}

+(JobsRetTimeZoneByVoidBlock)byLocalTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self localTimeZone];
    };
}

+(JobsRetTimeZoneByVoidBlock)byDefaultTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self defaultTimeZone];
    };
}

+(JobsRetTimeZoneByStrBlock)byTimeZoneWithName{
    return ^NSTimeZone *_Nullable(__kindof NSString *_Nullable data){
        return data ? [self timeZoneWithName:data] : nil;
    };
}

+(JobsRetTimeZoneByIntegerBlock)byTimeZoneForSecondsFromGMT{
    return ^NSTimeZone *_Nullable(NSInteger data){
        return [self timeZoneForSecondsFromGMT:data];
    };
}

-(JobsRetIntegerByDateBlock)bySecondsFromGMTForDate{
    @jobs_weakify(self)
    return ^NSInteger(NSDate *_Nullable data){
        @jobs_strongify(self)
        return data ? [self secondsFromGMTForDate:data] : self.secondsFromGMT;
    };
}

@end
