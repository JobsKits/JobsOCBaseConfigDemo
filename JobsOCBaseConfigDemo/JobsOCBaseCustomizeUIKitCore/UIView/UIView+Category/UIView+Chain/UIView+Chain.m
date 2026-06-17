//
//  UIView+Chain.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2020/8/11.
//  Copyright © 2020 Jobs. All rights reserved.
//

#import "UIView+Chain.h"

@implementation UIView (Chain)

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        MethodSwizzle(self,
                      @selector(hitTest:withEvent:),
                      @selector(exchange_hitTest:withEvent:));
    });
}
 
- (UIView *)exchange_hitTest:(CGPoint)point
                   withEvent:(UIEvent *)event {
    UIView * view = [self exchange_hitTest:point
                                 withEvent:event];
    if (view) {
        return view;
    } else {
        for (UIView * v in self.subviews) {
            if (v.ableRespose) {
                if (CGRectContainsPoint(v.frame, point)) {
                    return v;
                }
            }
        };return nil;
    }
}
#pragma mark —— Prop_assign()BOOL ableRespose
- (void)setAbleRespose:(BOOL)ableRespose {
    Jobs_setAssociatedRETAIN_NONATOMIC(_ableRespose, @(ableRespose))
}
 
#pragma mark —— ableRespose
JobsKey(_ableRespose)
@dynamic ableRespose;
- (BOOL)ableRespose {
    return Jobs_getAssociatedObject(_ableRespose) != nil ? [Jobs_getAssociatedObject(_ableRespose) boolValue] : NO;
}

@end
