//
//  TABComponentLayer+TABClassicAnimation.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TABComponentLayer+TABClassicAnimation.h"
#import <objc/runtime.h>

@implementation TABComponentLayer (TABClassicAnimation)

- (void)setBaseAnimationType:(TABComponentLayerBaseAnimationType)baseAnimationType {
    objc_setAssociatedObject(self, @selector(baseAnimationType), @(baseAnimationType), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (TABComponentLayerBaseAnimationType)baseAnimationType {
    return [objc_getAssociatedObject(self, _cmd) intValue];
}

@end
