//
//  UITabBarItem+TLAnimation.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITabBarItem+TLAnimation.h"

@implementation UITabBarItem (TLAnimation)
JobsKey(_animation)
@dynamic animation;

-(void)setAnimation:(id<TLAnimationProtocol>)animation{
    NSAssert([animation conformsToProtocol:@protocol(TLAnimationProtocol)], @"UITabBarItem: animation属性必须遵守TLAnimationProtocol协议");
    Jobs_setAssociatedRETAIN_NONATOMIC(_animation, animation)
}

-(id<TLAnimationProtocol>)animation{
    return Jobs_getAssociatedObject(_animation);
}

@end

