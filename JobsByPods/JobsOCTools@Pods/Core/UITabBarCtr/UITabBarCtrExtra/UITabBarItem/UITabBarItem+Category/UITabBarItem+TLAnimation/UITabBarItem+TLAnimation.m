//
//  UITabBarItem+TLAnimation.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UITabBarItem+TLAnimation.h"

@implementation UITabBarItem (TLAnimation)

-(void)setAnimation:(id<TLAnimationProtocol>)animation{
    NSAssert([animation conformsToProtocol:@protocol(TLAnimationProtocol)], @"UITabBarItem: animation属性必须遵守TLAnimationProtocol协议");
    objc_setAssociatedObject(self,
                             @selector(animation),
                             animation,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(id<TLAnimationProtocol>)animation{
    return objc_getAssociatedObject(self,_cmd);
}

@end

