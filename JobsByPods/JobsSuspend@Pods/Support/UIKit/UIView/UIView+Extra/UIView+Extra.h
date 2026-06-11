//
//  UIView+Extra.h
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_430CF60285
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_430CF60285

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>

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

Prop_assign()CGFloat rotateChangeAngle;
Prop_assign()__block CGFloat currentAngle;
Prop_assign()CGFloat durationTime;
Prop_assign()CGFloat delayTime;
Prop_assign()BOOL isStopRotateAnimation;

-(JobsRetViewByFloatBlock _Nonnull)cornerCutToCircleWithCornerRadius;
-(JobsRetViewByCorBlock _Nonnull)layerByBorderCor;
-(JobsRetViewByFloatBlock _Nonnull)layerByBorderWidth;
-(void)appointCornerCutToCircleByRoundingCorners:(UIRectCorner)corners
                                     cornerRadii:(CGSize)cornerRadii;
-(JobsRetViewByGestureRecognizer _Nonnull)addGesture;
-(JobsRetViewByBOOLBlock _Nonnull)旋转动画;
-(JobsRetViewByViewBlock _Nonnull)addSubview;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_430CF60285 */
