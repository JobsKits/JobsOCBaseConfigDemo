//
//  CALayer+XYColorOC.m
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "CALayer+XYColorOC.h"
#import "_XYColor_PrivateView.h"

@implementation CALayer (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        if (view.xy_privateView == nil) { view.xy_privateView = _XYColor_PrivateView.new; }

        __weak CALayer *weakLayer = self;
        __weak UIView *weakView = view;
        [view.xy_privateView traitCollectionChange:^{
            CALayer *strongLayer = weakLayer;
            UIView *strongView = weakView;
            if (!strongLayer || !strongView) { return; }
            strongLayer.borderColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.borderColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.borderColor = color.CGColor;
    }
}

- (void)xy_setLayerShadowColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        if (view.xy_privateView == nil) { view.xy_privateView = _XYColor_PrivateView.new; }

        __weak CALayer *weakLayer = self;
        __weak UIView *weakView = view;
        [view.xy_privateView traitCollectionChange:^{
            CALayer *strongLayer = weakLayer;
            UIView *strongView = weakView;
            if (!strongLayer || !strongView) { return; }
            strongLayer.shadowColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.shadowColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.shadowColor = color.CGColor;
    }
}

- (void)xy_setLayerBackgroundColor:(UIColor *)color with:(UIView *)view {
    if (@available(iOS 13.0, *)) {
        if (view.xy_privateView == nil) { view.xy_privateView = _XYColor_PrivateView.new; }

        __weak CALayer *weakLayer = self;
        __weak UIView *weakView = view;
        [view.xy_privateView traitCollectionChange:^{
            CALayer *strongLayer = weakLayer;
            UIView *strongView = weakView;
            if (!strongLayer || !strongView) { return; }
            strongLayer.backgroundColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.backgroundColor = [color resolvedColorWithTraitCollection:view.traitCollection].CGColor;
    } else {
        self.backgroundColor = color.CGColor;
    }
}

@end
