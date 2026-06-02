//
//  UIView+Gradient.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_GRADIENT_26033482CF
#define JOBS_HEADER_GUARD_UIVIEW_GRADIENT_26033482CF

#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSMutableArray+Extra.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Gradient)
/// 颜色渐变
+(void)setView:(UIView *)view
         layer:(CALayer *)layer
 gradientLayer:(UIColor *)startColor
      endColor:(UIColor *)endColor;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_GRADIENT_26033482CF */
