//
//  JobsPresentTransitionMgr.h
//  JobsPresentTransitionMgr
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSPRESENTTRANSITIONMGR_DA9BA95529
#define JOBS_HEADER_GUARD_JOBSPRESENTTRANSITIONMGR_DA9BA95529

#import <objc/runtime.h>
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsPresentTransitionMgr : UIPresentationController
<
UIViewControllerTransitioningDelegate,
UIViewControllerAnimatedTransitioning,
UIGestureRecognizerDelegate
>

Prop_assign()NSTimeInterval time;
Prop_assign()JobsTransitionDirection direction;
Prop_assign()CGFloat presentedRatio;
Prop_assign()CGFloat dimmingAlpha;
Prop_assign()CGFloat cornerRadius;

-(JobsRetJobsPresentTransitionMgrByTimeIntervalBlock _Nonnull)byTime;
-(JobsRetJobsPresentTransitionMgrByDirectionBlock _Nonnull)byDirection;
-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byPresentedRatio;
-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byDimmingAlpha;
-(JobsRetJobsPresentTransitionMgrByCGFloatBlock _Nonnull)byCornerRadius;

+(nullable instancetype)presentViewController:(UIViewController *)presentedViewController
                           fromViewController:(UIViewController *)presentingViewController;

+(nullable instancetype)presentViewController:(UIViewController *)presentedViewController
                           fromViewController:(UIViewController *)presentingViewController
                                    configure:(jobsByPresentTransitionManagerBlock _Nullable)configure
                                   completion:(jobsByVoidBlock _Nullable)completion;

-(void)presentFromViewController:(UIViewController *)presentingViewController
                      completion:(jobsByVoidBlock _Nullable)completion;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsPresentTransitionMgr
-(JobsRetJobsPresentTransitionMgrByBOOLBlock _Nonnull)byHasInteractiveFrame;
-(JobsRetJobsPresentTransitionMgrByCGRectBlock _Nonnull)byInteractiveFrame;
-(JobsRetJobsPresentTransitionMgrByCGRectBlock _Nonnull)byPanStartFrame;
-(JobsRetJobsPresentTransitionMgrByUIPanGestureRecognizerBlock _Nonnull)byPanGestureRecognizer;
-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byDimmingView;
-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentationRoundedCornerView;
-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentationWrappingView;
-(JobsRetJobsPresentTransitionMgrByUIViewBlock _Nonnull)byPresentedViewControllerWrapperView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsPresentTransitionMgr
@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_JOBSPRESENTTRANSITIONMGR_DA9BA95529 */
