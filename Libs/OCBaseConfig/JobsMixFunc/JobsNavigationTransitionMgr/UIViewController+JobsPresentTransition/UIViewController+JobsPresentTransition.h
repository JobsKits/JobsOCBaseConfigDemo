//
//  UIViewController+JobsPresentTransition.h
//  JobsPresentTransitionMgr
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JOBSPRESENTTRANSITION_07E35B7B61
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JOBSPRESENTTRANSITION_07E35B7B61

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import "JobsPresentTransitionMgr.h"

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (JobsPresentTransition)

-(JobsRetJobsPresentTransitionMgrByUIViewControllerBlock _Nonnull)jobs_presentViewController;

-(nullable JobsPresentTransitionMgr *)jobs_presentViewController:(UIViewController *)presentedViewController
                                                      configure:(jobsByPresentTransitionManagerBlock _Nullable)configure
                                                     completion:(jobsByVoidBlock _Nullable)completion;

@end

NS_ASSUME_NONNULL_END

#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_JOBSPRESENTTRANSITION_07E35B7B61 */
