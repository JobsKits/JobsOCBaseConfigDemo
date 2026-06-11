//
//  UIView+Extra.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_4A2DF7447C
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_4A2DF7447C

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;

-(JobsRetViewByViewBlock _Nonnull)addSubview;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth;
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsReturnGestureByGesture _Nonnull)addGestureRecognizer;
#pragma mark —— UI刷新（调用系统底层方法）
-(jobsByVoidBlock _Nonnull)refresh;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_4A2DF7447C */
