//
//  TABAnimatedDarkModeManagerInterface.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef TABAnimatedDarkModeManagerInterface_h
#define TABAnimatedDarkModeManagerInterface_h

@class UIView;

@protocol TABAnimatedDarkModeManagerInterface <NSObject>

// 绑定controlView
- (void)setControlView:(UIView *)controlView;

// 添加哨兵视图
- (void)addDarkModelSentryView;

/// 添加需要实时改变的view
- (void)addNeedChangeView:(UIView *)view;

// 释放
- (void)destroy;

@end

#endif /* TABAnimatedDarkModeManagerInterface_h */
