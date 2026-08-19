//
//  NSString+Reachability.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Reachability.h"

@implementation NSString (Reachability)
-(JobsRetReachabilityByVoidBlock _Nonnull)makeReachability{
    @jobs_weakify(self)
    return ^Reachability *_Nonnull{
        @jobs_strongify(self)
        if (!self) return nil;
        return [Reachability reachabilityWithHostname:self];
    };
}

@end
