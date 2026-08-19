//
//  BaseViewController.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_BASEVIEWCONTROLLER_31EF1238C2

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#define JOBS_HEADER_GUARD_BASEVIEWCONTROLLER_31EF1238C2

#import <UIKit/UIKit.h>
#import "JobsTabBarSettingVC.h"

#import "JobsBaseProtocolHeader.h"
#import "JobsBasePopupViewHeader.h"
#import "JobsMakes.h"
#import "JobsModelDSL.h"
#import "JobsBlock.h"
#import "JobsDefines.h"
#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseViewController : JobsTabBarSettingVC <BaseViewControllerProtocol>

-(JobsRetBaseViewControllerByNSUIntegerBlock _Nonnull)byJobsTag;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN BaseViewController
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byLoadView;
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidAppear;
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidDisappear;
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidLoad;
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewWillAppear;
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewWillDisappear;
-(JobsRetBaseViewControllerByCGFloatBlock _Nonnull)byGk_navBarAlpha;
-(JobsRetBaseViewControllerByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItems;
-(JobsRetBaseViewControllerByUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItem;
-(JobsRetBaseViewControllerByUIViewBlock _Nonnull)byGk_navTitleView;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END BaseViewController
@end

NS_ASSUME_NONNULL_END
/*

    /// 在具体的子类去实现，以覆盖父类的方法实现
    @synthesize backBtnModel = _backBtnModel;
    -(UIButtonModel *)backBtnModel{
        if(!_backBtnModel){
            @jobs_weakify(self)
            _backBtnModel = self.jobsMakeBackBtnModel()
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
