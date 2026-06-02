//
//  UIView+PrivateView.m
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+PrivateView.h"
#import "_XYColor_PrivateView.h"
#import <objc/runtime.h>

@implementation UIView (PrivateView)

static const void *XYColorPrivateViewKey = &XYColorPrivateViewKey;

- (void)setXy_privateView:(_XYColor_PrivateView *)xy_privateView {
    _XYColor_PrivateView *oldPrivateView = self.xy_privateView;
    if (xy_privateView == oldPrivateView) { return; }

    [oldPrivateView removeFromSuperview];

    if (xy_privateView) {
        xy_privateView.hidden = YES;
        xy_privateView.userInteractionEnabled = NO;
        xy_privateView.frame = CGRectZero;
        [self insertSubview:xy_privateView atIndex:0];
    }

    objc_setAssociatedObject(self, XYColorPrivateViewKey, xy_privateView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (_XYColor_PrivateView *)xy_privateView {
    return objc_getAssociatedObject(self, XYColorPrivateViewKey);
}

@end
