//
//  UIView+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_DCAE181A61
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_DCAE181A61

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsLinkageMenuView/UIView+Refresh.h>
#import <JobsLinkageMenuView/UIView+Measure.h>
#import <JobsLinkageMenuView/UIBezierPath+Extra.h>

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra) <BaseViewProtocol,BaseCellProtocol>

Prop_assign()BOOL ableRespose;
Prop_assign()CGFloat jobsVisible;

+(JobsRetViewByFrameBlock _Nonnull)initByFrame;
/// 描边：统一设置Layer的线宽+颜色+圆切角（不一定切角）
-(JobsRetViewByLocationModelBlock _Nonnull)layerBy;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".jobsCor()).layerByBorderWidth(1);
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor;
/// 调用方式：view.layerByBorderCor(@"#FFD8D8".jobsCor()).layerByBorderWidth(1);
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth;
/// 切整个View的4个角为统一的切角参数
-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
/// 指定圆切角
/// ⚠️这种写法存在一定的弊端：如果在某个View上添加子View，并对这个View使用如下方法的圆切角，则这个View上的子视图不可见⚠️
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;

-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsRetGestureByGesture _Nonnull)addGestureRecognizer;
-(JobsRetViewByCGFloatBlock _Nonnull)byVisible;
/// iOS 阴影效果 添加了shadowPath后消除了离屏渲染问题 。特别提示：不能存在 -(void)drawRect:(CGRect)rect 或者在-(void)drawRect:(CGRect)rect里面写，否则无效
/// @param targetShadowview 需要作用阴影效果的View
/// @param superview 该阴影效果的View的父View
/// @param ShadowDirection 阴影朝向
/// @param offsetX 贝塞尔曲线X轴偏移量
/// @param offsetY 贝塞尔曲线Y轴偏移量
/// @param cornerRadius 圆切角参数，传0表示不切
/// @param shadowOffset  阴影偏移量
/// @param shadowOpacity 阴影的不透明度,取值范围在0~1
/// @param layerShadowColor 阴影颜色
/// @param layerShadowRadius  模糊计算的半径
+(void)makeTargetShadowview:(__kindof UIView *__nonnull)targetShadowview
                  superView:(__kindof UIView *__nullable)superview
            shadowDirection:(ShadowDirection)ShadowDirection
          shadowWithOffsetX:(CGFloat)offsetX
                    offsetY:(CGFloat)offsetY
               cornerRadius:(CGFloat)cornerRadius
               shadowOffset:(CGSize)shadowOffset
              shadowOpacity:(CGFloat)shadowOpacity
           layerShadowColor:(UIColor *__nullable)layerShadowColor
          layerShadowRadius:(CGFloat)layerShadowRadius;
#pragma mark —— UILabel
/// 确定Label的字体大小，使其宽度自适应
-(JobsRetViewByVoidBlock _Nonnull)bySizeToFit;
/// 确定Label的宽度，使字体大小自适应
-(JobsRetViewByVoidBlock _Nonnull)labelAutoFontByWidth;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_DCAE181A61 */
