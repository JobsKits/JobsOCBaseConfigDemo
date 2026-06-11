//
//  JobsPopUpVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN
//此类解耦手势
@interface JobsPopUpVC : BaseViewController
<
UIGestureRecognizerDelegate
>

Prop_assign()CGFloat popUpHeight;//默认弹出高度300

@end

NS_ASSUME_NONNULL_END

/**

    PopUpVC *popUpVC = PopUpVC.new;
    @jobs_weakify(self)
    [popUpVC actionBlockPopUpVC:^(id data) {
        @jobs_strongify(self)
        JobsLog(@"您点击了关注");
    }];
    [UIViewController comingFromVC:self
                              toVC:popUpVC
                       comingStyle:ComingStyle_PUSH
                 presentationStyle:UIModalPresentationAutomatic
                     requestParams:@"".tr
                           success:^(id data) {}
                          animated:YES];

*/
