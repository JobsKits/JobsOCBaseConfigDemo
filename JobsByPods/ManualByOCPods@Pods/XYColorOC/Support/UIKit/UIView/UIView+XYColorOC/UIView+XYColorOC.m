//
//  UIView+XYColorOC.m
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UIView+XYColorOC.h"
#import "_XYColor_PrivateView.h"

@implementation UIView (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.xy_privateView == nil) { self.xy_privateView = _XYColor_PrivateView.new; }

        __weak UIView *weakView = self;
        [self.xy_privateView traitCollectionChange:^{
            UIView *strongView = weakView;
            if (!strongView) { return; }
            strongView.layer.borderColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.layer.borderColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.borderColor = color.CGColor;
    }
}

- (void)xy_setLayerShadowColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.xy_privateView == nil) { self.xy_privateView = _XYColor_PrivateView.new; }

        __weak UIView *weakView = self;
        [self.xy_privateView traitCollectionChange:^{
            UIView *strongView = weakView;
            if (!strongView) { return; }
            strongView.layer.shadowColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.layer.shadowColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.shadowColor = color.CGColor;
    }
}

- (void)xy_setLayerBackgroundColor:(UIColor *)color {
    if (@available(iOS 13.0, *)) {
        if (self.xy_privateView == nil) { self.xy_privateView = _XYColor_PrivateView.new; }

        __weak UIView *weakView = self;
        [self.xy_privateView traitCollectionChange:^{
            UIView *strongView = weakView;
            if (!strongView) { return; }
            strongView.layer.backgroundColor = [color resolvedColorWithTraitCollection:strongView.traitCollection].CGColor;
        }];

        self.layer.backgroundColor = [color resolvedColorWithTraitCollection:self.traitCollection].CGColor;
    } else {
        self.layer.backgroundColor = color.CGColor;
    }
}

@end
