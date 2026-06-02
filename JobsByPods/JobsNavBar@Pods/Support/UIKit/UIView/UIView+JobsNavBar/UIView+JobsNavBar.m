//
//  UIView+JobsNavBar.m
//  JobsNavBar
//
//  Created by Jobs on 2026年5月19日，星期二.
//

#import "UIView+JobsNavBar.h"


@interface NSObject (JobsNavBarBridge)

-(jobsByBtnBlock _Nonnull)jobsBackBtnClickEvent;

@end

@implementation UIView (JobsNavBar)

PROP_STRONG_OBJECT_TYPE(JobsNavBarConfig, jobs_navBarConfig, Jobs_navBarConfig)

JobsKey(_jobs_navBar)
@dynamic jobs_navBar;
-(JobsNavBar *)jobs_navBar{
    JobsNavBar *navBar = Jobs_getAssociatedObject(_jobs_navBar);
    if (!navBar) {
        navBar = [self jobs_addNavBarWithConfig:self.jobs_navBarConfig ?: self.makeNavBarConfig(nil, nil)];
    }return navBar;
}

-(void)setJobs_navBar:(JobsNavBar *)jobs_navBar{
    Jobs_setAssociatedRETAIN_NONATOMIC(_jobs_navBar, jobs_navBar)
}

-(JobsReturnNavBarConfigByButtonModelBlock)makeNavBarConfig{
    return ^(UIButtonModel *_Nullable backBtnModel,
             UIButtonModel *_Nullable closeBtnModel) {
        @jobs_weakify(self)
        return jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
            @jobs_strongify(self)
            data.bgCor = self.viewModel.navBgCor;
            data.bgImage = self.viewModel.navBgImage;
            data.attributedTitle = self.viewModel.backBtnTitleModel.attributedTitle;
            data.title = self.viewModel.textModel.text;
            data.font = self.viewModel.textModel.font;
            data.titleCor = self.viewModel.textModel.textCor;
            data.backBtnModel = backBtnModel ? : self.backBtnModel;
            data.closeBtnModel = closeBtnModel ? : self.closeBtnModel;
            self.jobs_navBarConfig = data;
        });
    };
}

-(JobsNavBar *)jobs_addNavBarWithConfig:(JobsNavBarConfig *)config{
    if (config) self.jobs_navBarConfig = config;
    JobsNavBar *oldNavBar = Jobs_getAssociatedObject(_jobs_navBar);
    if (oldNavBar.superview == self) return oldNavBar;
    
    @jobs_weakify(self)
    JobsNavBar *navBar = jobsMakeNavBar(^(__kindof JobsNavBar *_Nullable data) {
        @jobs_strongify(self)
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            self.jobs_navBarConfig.backBtnModel.jobsOffsetX = self.jobs_navBarConfig.backBtnModel.jobsOffsetX ? : JobsWidth(40);
            self.jobs_navBarConfig.closeBtnModel.jobsOffsetX = self.jobs_navBarConfig.closeBtnModel.jobsOffsetX ? : JobsWidth(40);
        }
        JobsLog(@"%f",self.jobs_navBarConfig.backBtnModel.jobsOffsetX);
        JobsLog(@"%f",self.jobs_navBarConfig.closeBtnModel.jobsOffsetX);
        data.navBarConfig = self.jobs_navBarConfig;
        [self addSubview:data];
        [data mas_makeConstraints:^(MASConstraintMaker *make) {
            if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
                make.top.equalTo(self);
            }else{
                make.top.equalTo(self).offset(JobsStatusBarHeight());
            }
            make.left.right.equalTo(self);
            make.height.mas_equalTo(JobsWidth(40));
        }];self.refresh();
        @jobs_weakify(self)
        data.JobsRichViewByModel2(nil)
            .JobsNavBarBackBtnClickBlock(^(__kindof UIButton *_Nullable x){
                @jobs_strongify(self)
                self.jobsBackBtnClickEvent(x);
                if(self.backBtnClickAction) self.backBtnClickAction(x);
            }).JobsNavBarCloseBtnClickBlock(^(__kindof UIButton *_Nullable x){
                @jobs_strongify(self)
                if(self.closeBtnClickAction)self.closeBtnClickAction(x);
            });
    });
    self.jobs_navBar = navBar;
    return navBar;
}

-(void)jobs_removeNavBar{
    [self.jobs_navBar removeFromSuperview];
    self.jobs_navBar = nil;
}

@end
