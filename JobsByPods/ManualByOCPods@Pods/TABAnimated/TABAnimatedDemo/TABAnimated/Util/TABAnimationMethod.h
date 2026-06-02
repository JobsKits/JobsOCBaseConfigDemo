//
//  TABAnimationMethod.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

FOUNDATION_EXPORT NSString *tab_NSStringFromIndex(NSInteger index);

@interface TABAnimationMethod : NSObject

/**
 UIView加入淡入淡出动画
 @param view 目标view
 */
+ (void)addEaseOutAnimation:(UIView *)view;

/// 获取App版本
+ (NSString *)appVersion;

@end

NS_ASSUME_NONNULL_END
