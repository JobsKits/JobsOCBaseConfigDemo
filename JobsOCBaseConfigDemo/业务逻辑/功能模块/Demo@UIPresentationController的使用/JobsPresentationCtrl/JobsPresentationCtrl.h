//
//  JobsPresentationCtrl.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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

@interface JobsPresentationCtrl : UIPresentationController 
<
UIViewControllerTransitioningDelegate,
UIViewControllerAnimatedTransitioning,
UIGestureRecognizerDelegate
>

@end
/**
 
     自定义高度的模态推送控制器使用示例
     1、如果self = ViewController
     JobsPresentedVC *vc = JobsPresentedVC.new;
     JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
     presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:vc presentingViewController:self];
     vc.presentUpHeight = JobsWidth(200);
     vc.view.byBgColor(JobsRedColor);

     vc.transitioningDelegate = presentationController;

     [self presentViewController:vc animated:YES completion:NULL];

     2、如果self = View
     JobsCommentCoreVC *jobsCommentCoreVC = JobsCommentCoreVC.new;
     JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
     presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:jobsCommentCoreVC presentingViewController:self.jobsGetCurrentViewController];
     jobsCommentCoreVC.presentUpHeight = JobsWidth(800);
     /// jobsCommentCoreVC.view.backgroundColor = JobsRedColor;
     jobsCommentCoreVC.transitioningDelegate = presentationController;

     [self forceComingToPresentVC:jobsCommentCoreVC
                    requestParams:@"".tr
                       completion:nil];
 */
