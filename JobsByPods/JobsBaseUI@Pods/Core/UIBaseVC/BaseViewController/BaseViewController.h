//
//  BaseViewController.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEWCONTROLLER_31EF1238C2
#define JOBS_HEADER_GUARD_BASEVIEWCONTROLLER_31EF1238C2

#import <UIKit/UIKit.h>
#import <JobsBaseUI/JobsTabBarSettingVC.h>

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsBasePopupView/JobsBasePopupViewHeader.h>)
#import <JobsBasePopupView/JobsBasePopupViewHeader.h>
#else
#import "JobsBasePopupViewHeader.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface BaseViewController : JobsTabBarSettingVC <BaseViewControllerProtocol>

/// 子类返回 NO 时，不自动安装导航栏、标题和返回按钮。
-(BOOL)jobs_requiresDefaultNavigationBar;

@end

NS_ASSUME_NONNULL_END
/*

    /// 在具体的子类去实现，以覆盖父类的方法实现
    @synthesize backBtnModel = _backBtnModel;
    -(UIButtonModel *)backBtnModel{
        if(!_backBtnModel){
            @jobs_weakify(self)
            _backBtnModel = self.makeBackBtnModel
                .byTitleFont(bayonRegular(JobsWidth(18)))
                .byTitleCor(JobsWhiteColor)
                .bySelectedTitleCor(JobsWhiteColor)
                .byLongPressGestureEventBlock(^id(__kindof UIButton *x) {
                    JobsLog(@"按钮的长按事件触发");
                    return nil;
                })
                .byClickEventBlock(^id(BaseButton *x){
                    @jobs_strongify(self)
                    self.jobsBackBtnClickEvent(x);
                    self.popToRootVCBy(YES);
                    return nil;
                });
        };return _backBtnModel;
    }
*/
#endif /* JOBS_HEADER_GUARD_BASEVIEWCONTROLLER_31EF1238C2 */
