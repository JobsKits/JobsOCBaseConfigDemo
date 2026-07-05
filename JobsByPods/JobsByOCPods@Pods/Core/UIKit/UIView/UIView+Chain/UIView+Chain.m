//
//  UIView+Chain.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
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
JobsKey(_ableRespose)
@dynamic ableRespose;
- (void)setAbleRespose:(BOOL)ableRespose {
    Jobs_setAssociatedRETAIN_NONATOMIC(_ableRespose, @(ableRespose))
}
 
- (BOOL)ableRespose {
    return Jobs_getAssociatedObject(_ableRespose) != nil ? [Jobs_getAssociatedObject(_ableRespose) boolValue] : NO;
}

@end
