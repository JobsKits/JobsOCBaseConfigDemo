//
//  NSString+Extra.h
//  JobsDropDownListView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSSTRING_EXTRA_CB424DB392
#define JOBS_HEADER_GUARD_NSSTRING_EXTRA_CB424DB392

#pragma once

#import <Foundation/Foundation.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
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

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Extra)
/// OC字符串拼接
-(JobsRetStrByStrBlock _Nonnull)add;
#pragma mark —— 动画相关
/// 创建CABasicAnimation
-(CABasicAnimation *)basicAnimation;
/// 创建CAKeyframeAnimation（关键帧动画）
-(CAKeyframeAnimation *)keyframeAnimation;

-(CAMediaTimingFunction *)makeCAMediaTimingFunction;

-(CAKeyframeAnimation *)makeCAKeyframeAnimationByBlock:(jobsByCAKeyframeAnimationBlock _Nonnull)block;

-(CABasicAnimation *)makeCABasicAnimationByBlock:(jobsByCABasicAnimationBlock _Nonnull)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSSTRING_EXTRA_CB424DB392 */
