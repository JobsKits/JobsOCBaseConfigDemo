//
//  UIView+Animation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_ANIMATION_86173D3DD8
#define JOBS_HEADER_GUARD_UIVIEW_ANIMATION_86173D3DD8

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import <UIKit/UIKit.h>
#import "NSMutableArray+Extra.h"
#import "NSString+CAAnimation.h"

#if __has_include(<ReactiveObjC/RACmetamacros.h>)
#import <ReactiveObjC/RACmetamacros.h>
#else
#import "RACmetamacros.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTScope.h>)
#import <ReactiveObjC/RACEXTScope.h>
#else
#import "RACEXTScope.h"
#endif

#if __has_include(<ReactiveObjC/RACEXTKeyPathCoding.h>)
#import <ReactiveObjC/RACEXTKeyPathCoding.h>
#else
#import "RACEXTKeyPathCoding.h"
#endif

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Animation)

Prop_assign()CGFloat rotateChangeAngle;
Prop_assign()CGFloat currentAngle;
Prop_assign()CGFloat durationTime;
Prop_assign()CGFloat delayTime;
Prop_assign()BOOL isStopRotateAnimation;// 默认值为NO（一直旋转）
Prop_strong()CAKeyframeAnimation *shakeAnim;
#pragma mark —— 一些功能方法
-(JobsRetViewByBOOLBlock _Nonnull)抖动动画;
/// 一直不停地旋转
-(JobsRetViewByBOOLBlock _Nonnull)旋转动画;
/// 旋转一定时间之后停止下来
-(JobsRetViewByFloatBlock _Nonnull)旋转动画By;
-(JobsRetViewByVoidBlock _Nonnull)图片从小放大;
-(JobsRetViewByVoidBlock _Nonnull)视图上下一直来回跳动的动画;
/// 点击放大再缩小
-(void)addViewAnimationWithCompletionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 逐渐显示
-(void)graduallyShowWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                       completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 逐渐消退
-(void)graduallyDisappearWithAnimationBlock:(jobsByIDBlock _Nullable)animationBlock
                            completionBlock:(jobsByIDBlock _Nullable)completionBlock;
/// 重力弹跳动画效果
-(void)shakerAnimationWithDuration:(NSTimeInterval)duration
                            height:(float)height;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_ANIMATION_86173D3DD8 */
