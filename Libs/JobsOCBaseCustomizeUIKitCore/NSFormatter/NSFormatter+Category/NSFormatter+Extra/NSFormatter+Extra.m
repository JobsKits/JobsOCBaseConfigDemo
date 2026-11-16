//
//  NSFormatter+Extra.m
//  NSFormatter+Extra
//
//  Created by Jobs on 2026年5月15日，星期五.
//

#import "NSFormatter+Extra.h"

@implementation NSFormatter (JobsModelExtra)

-(JobsRetStrByDateBlock _Nonnull)date{
    @jobs_weakify(self)
    return ^NSString *_Nullable(NSDate *_Nullable date){
        @jobs_strongify(self)
        if(self){
            if(self.isKindOfClass(NSDateFormatter.class)){
                NSDateFormatter *dateFormatter = (NSDateFormatter *)self;
                return [dateFormatter stringFromDate:date];
            }
        };return @"";
    };
}

@end
