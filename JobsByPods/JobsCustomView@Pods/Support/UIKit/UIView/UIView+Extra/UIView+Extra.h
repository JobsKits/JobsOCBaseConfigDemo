//
//  UIView+Extra.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_38A40CC26A
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_38A40CC26A

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsCustomView/UIView+Refresh.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

Prop_copy()jobsByMASConstraintMakerBlock masonryBlock;
Prop_assign()CGFloat jobsVisible;

-(JobsRetViewByViewBlock _Nonnull)addSubview;
-(jobsByVoidBlock _Nonnull)refresh;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".cor).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth;
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
/// 指定圆切角
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_38A40CC26A */
