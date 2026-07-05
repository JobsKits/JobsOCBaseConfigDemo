//
//  JobsBaseDataSettingVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73
#define JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73

#import <UIKit/UIKit.h>
#import "JobsDebugVC.h"

#import "JobsOCDSL.h"

#import "JobsBaseProtocolHeader.h"

#import "JobsModelDSL.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

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
#endif /* JOBS_HEADER_GUARD_JOBSBASEDATASETTINGVC_E92FC69D73 */
