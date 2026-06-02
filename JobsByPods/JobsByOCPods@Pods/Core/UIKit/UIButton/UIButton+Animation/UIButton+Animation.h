//
//  UIButton+Animation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_ANIMATION_D594EA0C3B
#define JOBS_HEADER_GUARD_UIBUTTON_ANIMATION_D594EA0C3B

#import <UIKit/UIKit.h>
#import <JobsByOCPods/CALayer+Extra.h>
#import <JobsByOCPods/CABasicAnimation+Extra.h>
#import <JobsByOCPods/CAPropertyAnimation+Extra.h>
#import <JobsByOCPods/CAAnimation+Extra.h>

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

#if __has_include(<JobsDeviceInfo/JobsDeviceInfo.h>)
#import <JobsDeviceInfo/JobsDeviceInfo.h>
#else
#import "JobsDeviceInfo.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIButton (Animation)
/// 点击按钮，按钮的imageView旋转360°
-(__kindof CABasicAnimation *)revolution;
/// 停止旋转360s
-(JobsByCAPropertyAnimationBlock _Nonnull)stopRevolutionBy;
/// 开始旋转（旋转360度，持续N秒后自动停止）
-(jobsByCGFloatBlock _Nonnull)startRevolutionBy;
/// 点击时旋转180°，再点击时再转回来
-(void)rotateHalfCycle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIBUTTON_ANIMATION_D594EA0C3B */
