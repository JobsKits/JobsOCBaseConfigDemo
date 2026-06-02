//
//  UIColor+TABCategory.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (TABCategory)

+ (UIColor *)tab_normalDynamicBackgroundColor;

+ (UIColor *)tab_cardDynamicBackgroundColor;

+ (UIColor *)tab_getColorWithLightColor:(UIColor *)lightColor
                              darkColor:(UIColor * _Nullable)darkColor;

@end

NS_ASSUME_NONNULL_END
