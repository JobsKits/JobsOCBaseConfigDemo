//
//  NSObject+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+Extra.h"

@implementation NSObject (Extra)
#pragma mark —— Prop_weak(nullable)id weak_target;
JobsKey(_weak_target)
@dynamic weak_target;
-(id)weak_target{
    return Jobs_getAssociatedObject(_weak_target);
}

-(void)setWeak_target:(id)weak_target{
    Jobs_setAssociatedRETAIN_NONATOMIC(_weak_target, weak_target)
}

@end
