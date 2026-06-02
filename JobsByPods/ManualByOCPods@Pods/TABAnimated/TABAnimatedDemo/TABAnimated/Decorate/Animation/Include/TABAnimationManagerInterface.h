//
//  TABAnimationManagerInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABAnimationManagerInterface_h
#define TABAnimationManagerInterface_h

@class UIView;

@protocol TABAnimationManagerInterface <NSObject>

// 绑定控制视图
- (void)setControlView:(UIView *)controlView;

// 为目标view添加动画
- (void)addAnimationWithTargetView:(UIView *)targetView;

- (void)destory;

@end

#endif /* TABAnimationManagerInterface_h */
