//
//  NSString+CAAnimation.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8CBA335BA8
#define JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8CBA335BA8

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CAAnimation)
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation;

-(CAMediaTimingFunction *)makeCAMediaTimingFunction;

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block;

-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8CBA335BA8 */
