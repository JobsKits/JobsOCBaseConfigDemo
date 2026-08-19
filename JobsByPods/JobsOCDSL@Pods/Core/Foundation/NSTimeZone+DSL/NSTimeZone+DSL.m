//
//  NSTimeZone+DSL.m
//  JobsOCDSL
//
//  Created by Jobs on 2026年8月3日，星期一.
//

#import "NSTimeZone+DSL.h"

@implementation NSTimeZone (JobsChain)
+(JobsRetTimeZoneByVoidBlock _Nonnull)bySystemTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self systemTimeZone];
    };
}

+(JobsRetTimeZoneByVoidBlock _Nonnull)byLocalTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self localTimeZone];
    };
}

+(JobsRetTimeZoneByVoidBlock _Nonnull)byDefaultTimeZone{
    return ^NSTimeZone *_Nullable(void){
        return [self defaultTimeZone];
    };
}

+(JobsRetTimeZoneByStrBlock _Nonnull)byTimeZoneWithName{
    return ^NSTimeZone *_Nullable(__kindof NSString *_Nullable data){
        return data ? [self timeZoneWithName:data] : nil;
    };
}

+(JobsRetTimeZoneByIntegerBlock _Nonnull)byTimeZoneForSecondsFromGMT{
    return ^NSTimeZone *_Nullable(NSInteger data){
        return [self timeZoneForSecondsFromGMT:data];
    };
}

-(JobsRetIntegerByDateBlock _Nonnull)bySecondsFromGMTForDate{
    @jobs_weakify(self)
    return ^NSInteger(NSDate *_Nullable data){
        @jobs_strongify(self)
        return data ? [self secondsFromGMTForDate:data] : self.secondsFromGMT;
    };
}

@end
