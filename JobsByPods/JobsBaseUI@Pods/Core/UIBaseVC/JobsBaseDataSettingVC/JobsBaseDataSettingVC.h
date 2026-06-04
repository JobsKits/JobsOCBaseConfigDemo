//
//  JobsBaseDataSettingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73
#define JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73

#import <UIKit/UIKit.h>
#import <JobsBaseUI/JobsDebugVC.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface JobsBaseDataSettingVC : JobsDebugVC
<
BaseViewControllerProtocol
,UIGestureRecognizerDelegate
,UIContentContainer
>

Prop_strong()UIViewModel *viewModel;
Prop_strong()UIButtonModel *closeBtnModel;
Prop_strong()UIButtonModel *backBtnModel;

@end

NS_ASSUME_NONNULL_END
/**
 
     自定义高度的模态推送控制器使用示例
     1、如果self = ViewController
     JobsPresentedVC *vc = JobsPresentedVC.new;
     JobsPresentationCtrl *presentationController NS_VALID_UNTIL_END_OF_SCOPE;
     presentationController = [JobsPresentationCtrl.alloc initWithPresentedViewController:vc presentingViewController:self];
     vc.presentUpHeight = JobsWidth(200);
     vc.view.backgroundColor = JobsRedColor;
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
#endif /* JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73 */
