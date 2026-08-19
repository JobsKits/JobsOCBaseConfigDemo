//
//  UICollectionViewCell+ShakeAnimation.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841

#pragma once

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsBaseUI/NSMutableArray+Extra.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/CAKeyframeAnimation+DSL.h>)
#import <JobsOCDSL/CAKeyframeAnimation+DSL.h>
#else
#import "CAKeyframeAnimation+DSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UICollectionViewCell (ShakeAnimation)

-(jobsByVoidBlock _Nonnull)beginShake;// 实现cell抖动方法
-(jobsByVoidBlock _Nonnull)stopShake;// 实现cell停止抖动方法

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_8845157841 */
