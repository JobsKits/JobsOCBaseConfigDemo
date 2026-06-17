//
//  UITabBarItem+TLAnimation.m
//  JobsOCBaseConfigDemo
//
//  Created by 故乡的云 on 2019/7/19.
//  Copyright © 2019 故乡的云. All rights reserved.
//

#import "UITabBarItem+TLAnimation.h"

@implementation UITabBarItem (TLAnimation)

-(void)setAnimation:(id<TLAnimationProtocol>)animation{
    NSAssert([animation conformsToProtocol:@protocol(TLAnimationProtocol)], @"UITabBarItem: animation属性必须遵守TLAnimationProtocol协议");
    Jobs_setAssociatedRETAIN_NONATOMIC(_animation, animation)
}

#pragma mark —— animation
JobsKey(_animation)
@dynamic animation;
-(id<TLAnimationProtocol>)animation{
    return Jobs_getAssociatedObject(_animation);
}

@end

