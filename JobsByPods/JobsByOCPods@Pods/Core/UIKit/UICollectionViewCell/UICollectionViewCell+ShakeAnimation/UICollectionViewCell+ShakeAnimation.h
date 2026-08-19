//
//  UICollectionViewCell+ShakeAnimation.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33
#define JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsByOCPods/NSMutableArray+Extra.h>

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
#endif /* JOBS_HEADER_GUARD_UICOLLECTIONVIEWCELL_SHAKEANIMATION_67DD940F33 */
