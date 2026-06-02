//
//  CALayer+XYColorOC.h
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color with:(UIView *)view;
- (void)xy_setLayerShadowColor:(UIColor *)color with:(UIView *)view;
- (void)xy_setLayerBackgroundColor:(UIColor *)color with:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
