//
//  UIButton+Animation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIBUTTON_ANIMATION_D594EA0C3B
#define JOBS_HEADER_GUARD_UIBUTTON_ANIMATION_D594EA0C3B

#import <UIKit/UIKit.h>
#import "CALayer+Extra.h"
#import "CABasicAnimation+Extra.h"
#import "CAPropertyAnimation+Extra.h"
#import "CAAnimation+Extra.h"

#import "JobsDeviceInfo.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
