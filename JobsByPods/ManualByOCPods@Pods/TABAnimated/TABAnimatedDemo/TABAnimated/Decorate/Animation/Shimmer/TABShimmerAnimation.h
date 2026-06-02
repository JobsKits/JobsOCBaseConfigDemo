//
//  TABShimmerAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <TABAnimated/TABAnimatedConfig.h>
#import <TABAnimated/TABShimmerAnimationDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABShimmerAnimation : NSObject

/**
 * 闪光灯动画的时长，默认是1s。
 */
@property (nonatomic, assign) CGFloat shimmerDuration;

/**
 * 闪光灯动画的方向
 */
@property (nonatomic, assign) TABShimmerDirection shimmerDirection;

/**
 * 闪光灯变色值，默认值0xDFDFDF
 */
@property (nonatomic, strong) UIColor *shimmerBackColor;

/**
 * 闪光灯亮度，默认值0.92
 */
@property (nonatomic, assign) CGFloat shimmerBrightness;

/**
 * 暗黑模式下，全局闪光灯背景色
 */
@property (nonatomic, strong) UIColor *shimmerBackColorInDarkMode;

/**
 * 暗黑模式下，全局闪光灯颜色亮度
 */
@property (nonatomic, assign) CGFloat shimmerBrightnessInDarkMode;

@end

NS_ASSUME_NONNULL_END
