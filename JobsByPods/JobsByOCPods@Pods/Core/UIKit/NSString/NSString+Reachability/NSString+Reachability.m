//
//  NSString+Reachability.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Reachability.h"

@implementation NSString (Reachability)

-(Reachability *_Nonnull)makeReachability{
    return [Reachability reachabilityWithHostname:self];
}

@end
