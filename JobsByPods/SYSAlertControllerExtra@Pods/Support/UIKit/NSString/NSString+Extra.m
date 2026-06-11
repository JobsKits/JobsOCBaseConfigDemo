//
//  NSString+Extra.m
//  SYSAlertControllerExtra
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)

-(jobsByVoidBlock _Nonnull)toast{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        NSObject.jobsToastMsg(self.tr);
    };
}

-(JobsRetBOOLByIDBlock _Nonnull)isEqualToString{
    @jobs_weakify(self)
    return ^BOOL(NSString *data){
        @jobs_strongify(self)
        if ([data isKindOfClass:NSString.class]) {
            return [self isEqualToString:data];
        };return NO;
    };
}

@end
