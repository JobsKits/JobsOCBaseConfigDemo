//
//  NSString+CAAnimation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8906A1C0DA
#define JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8906A1C0DA

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。

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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (CAAnimation)
/// 创建CABasicAnimation
-(JobsRetCABasicAnimationByVoidBlock _Nonnull)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(JobsRetCAKeyframeAnimationByVoidBlock _Nonnull)keyframeAnimation;

-(JobsRetCAMediaTimingFunctionByVoidBlock _Nonnull)makeCAMediaTimingFunction;

-(JobsRetCAKeyframeAnimationByjobsByCAKeyframeAnimationBlockBlock _Nonnull)makeCAKeyframeAnimationByBlock;

-(JobsRetCABasicAnimationByjobsByCABasicAnimationBlockBlock _Nonnull)makeCABasicAnimationByBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_CAANIMATION_8906A1C0DA */
