//
//  UIView+TABAnimated.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+TABAnimated.h"
#import <objc/runtime.h>

@implementation UIView (TABAnimated)

- (NSString *)tab_name {
    return objc_getAssociatedObject(self, @selector(tab_name));
}

- (void)setTab_name:(NSString *)tab_name {
    objc_setAssociatedObject(self, @selector(tab_name), tab_name, OBJC_ASSOCIATION_COPY);
}

@end
