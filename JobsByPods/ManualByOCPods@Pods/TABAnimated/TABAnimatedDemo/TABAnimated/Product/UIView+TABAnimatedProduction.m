//
//  UIView+TABAnimatedProduction.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+TABAnimatedProduction.h"
#import <objc/runtime.h>
#import "TABAnimatedProduction.h"

@implementation UIView (TABAnimatedProduction)

- (TABAnimatedProduction *)tabAnimatedProduction {
    return objc_getAssociatedObject(self, @selector(tabAnimatedProduction));
}

- (void)setTabAnimatedProduction:(TABAnimatedProduction *)tabAnimatedProduction {
    objc_setAssociatedObject(self, @selector(tabAnimatedProduction), tabAnimatedProduction, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end

