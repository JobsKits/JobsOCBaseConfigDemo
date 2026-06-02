//
//  UIColor+XYColorOC.h
//  XYColorOC
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIColor* _Nonnull (^XYColorProvider)(void);

@interface UIColor (XYColorOC)

/// 创建动态 UIColor 的方法
/// @param lightColor light 模式下的颜色
/// @param darkColor dark 模式下的颜色，低于 iOS 13.0 不生效
+ (UIColor *)xy_createWithLightColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;

/// 创建动态 UIColor 的方法
/// @param lightProvider light 模式下的颜色，当模式切换到 light 时触发
/// @param darkProvider dark 模式下的颜色，当模式切换到 dark 时触发，低于 iOS 13.0 不生效
+ (UIColor *)xy_createWithLightProvider:(XYColorProvider)lightProvider darkProvider:(XYColorProvider)darkProvider;

@end

NS_ASSUME_NONNULL_END
