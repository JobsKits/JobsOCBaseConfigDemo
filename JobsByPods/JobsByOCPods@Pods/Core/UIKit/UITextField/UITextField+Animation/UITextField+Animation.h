//
//  UITextField+Animation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELD_ANIMATION_BA35906C95
#define JOBS_HEADER_GUARD_UITEXTFIELD_ANIMATION_BA35906C95

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/NSString+Check.h>

#if __has_include(<JobsStringUtils/JobsStringUtilsHeader.h>)
#import <JobsStringUtils/JobsStringUtilsHeader.h>
#else
#import "JobsStringUtilsHeader.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Animation)
#pragma mark —— 一些动画
/// 输入的和某个预设定值不一致的时候，抖动动画
-(jobsByStrBlock _Nonnull)isValidate;
/// 输入的为空，抖动动画
-(jobsByVoidBlock _Nonnull)isEmptyText;

-(jobsByVoidBlock _Nonnull)shakeAnimationForView;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UITEXTFIELD_ANIMATION_BA35906C95 */
