//
//  CAAnimation+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_CAANIMATION_EXTRA_E821CB7FB4
#define JOBS_HEADER_GUARD_CAANIMATION_EXTRA_E821CB7FB4

#import <QuartzCore/QuartzCore.h> // 提供 Core Animation 和 CALayer 能力，用于动画、图层和视觉渲染。
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface CAAnimation (Extra)

-(JobsRetCAAnimationByCAMediaTimingFunctionBlock _Nonnull)timingFunctionBy;
-(JobsRetCAAnimationByDelegateBlock _Nonnull)delegateBy;
-(JobsRetCAAnimationByBOOLBlock _Nonnull)removedOnCompletionBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_CAANIMATION_EXTRA_E821CB7FB4 */
