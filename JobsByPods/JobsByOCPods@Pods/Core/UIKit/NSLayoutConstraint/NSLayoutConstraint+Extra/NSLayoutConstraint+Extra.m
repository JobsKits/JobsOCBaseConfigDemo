//
//  NSLayoutConstraint+Extra.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSLayoutConstraint+Extra.h"

@implementation NSLayoutConstraint (Extra)
+(jobsByArrBlock _Nonnull)initBy{
    return ^(NSArray *_Nullable data){
        return [NSLayoutConstraint activateConstraints:data];
    };
}

+(jobsByArrBlock _Nonnull)deactivateBy{
    return ^(NSArray *_Nullable data){
        return [NSLayoutConstraint deactivateConstraints:data];
    };
}

@end
