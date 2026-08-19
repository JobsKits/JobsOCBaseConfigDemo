//
//  UIViewController+Shake.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SHAKE_11CF9EFA5A
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SHAKE_11CF9EFA5A

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>     // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import <UIKit/UIKit.h>
#import <AudioToolbox/AudioToolbox.h> // 用于调用系统级音频能力。
#import <CoreMotion/CoreMotion.h>     // 用于访问设备运动传感器数据：加速度计、陀螺仪、磁力计、设备姿态、计步器等。
#import <JobsByOCPods/NSObject+Shake.h>
#import <JobsByOCPods/NSString+Check.h>
#import <JobsByOCPods/NSNotificationCenter+JobsBlock.h>

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

//#if __has_include(<ReactiveObjC/RACEXTRuntimeExtensions.h>)
//#import <ReactiveObjC/RACEXTRuntimeExtensions.h>
//#else
//#import "RACEXTRuntimeExtensions.h"
//#endif

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, UIViewControllerShakeType) {
    UIViewControllerShakeNone,
    UIViewControllerShakeBeganType,
    UIViewControllerShakeCancelType,
    UIViewControllerShakeEndType,
};

@interface UIViewController (Shake)

Prop_strong()CMMotionManager *motionManager;

-(jobsByVoidBlock _Nonnull)invokeWhenViewDidLoadUsingSysFunc;
-(jobsByVoidBlock _Nonnull)invokeWhenViewDidAppearUsingCMMotionManager;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_SHAKE_11CF9EFA5A */
