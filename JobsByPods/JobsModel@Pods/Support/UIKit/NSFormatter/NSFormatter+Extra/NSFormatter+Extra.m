//
//  NSFormatter+Extra.m
//  AFNetworking
//
//  Created by Jobs on 2026/5/15.
//

#import "NSFormatter+Extra.h"

@implementation NSFormatter (Extra)

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
