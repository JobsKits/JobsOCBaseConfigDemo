//
//  NSString+Extra.m
//  JobsMakes
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

#import <JobsMakes/UIColor+Extra.h>

@implementation NSString (JobsMakesExtra)
-(UIColor *)cor{
    return (((JobsRetCorByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(NSString.class, @selector(jobsCor)))(self, @selector(jobsCor)))();
}

-(JobsRetCorByVoidBlock _Nonnull)jobsCor{
    @jobs_weakify(self)
    return ^UIColor *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        return UIColor.jobsCor(self);
    };
}

@end
