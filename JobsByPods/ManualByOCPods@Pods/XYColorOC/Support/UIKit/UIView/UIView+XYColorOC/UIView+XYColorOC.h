//
//  UIView+XYColorOC.h
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (XYColorOC)

- (void)xy_setLayerBorderColor:(UIColor *)color;
- (void)xy_setLayerShadowColor:(UIColor *)color;
- (void)xy_setLayerBackgroundColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
