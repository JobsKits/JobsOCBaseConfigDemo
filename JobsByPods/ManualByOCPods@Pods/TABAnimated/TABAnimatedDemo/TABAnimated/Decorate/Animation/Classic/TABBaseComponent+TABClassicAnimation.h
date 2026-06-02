//
//  TABBaseComponent+TABClassicAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/TABBaseComponent.h>
#import <TABAnimated/TABAnimatedChainDefines.h>

NS_ASSUME_NONNULL_BEGIN

@interface TABBaseComponent (TABClassicAnimation)

/**
 赋予动画元素画由长到短的动画
 
 @return 目标动画元素
 */
- (TABBaseComponentVoidBlock)toLongAnimation;

/**
 赋予动画元素画由短到长的动画
 
 @return 目标动画元素
 */
- (TABBaseComponentVoidBlock)toShortAnimation;

@end

NS_ASSUME_NONNULL_END
