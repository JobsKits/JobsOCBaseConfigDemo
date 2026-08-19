//
//  JobsBaseDataSettingVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBaseDataSettingVC.h"

#import <JobsBaseUI/NSObject+Extra.h>
#import <JobsBaseUI/UIViewController+BaseNavigationBar.h>
#import <JobsBaseUI/UIViewController+BackBtn.h>
#import <JobsBaseUI/BaseButton.h>

@interface JobsBaseDataSettingVC ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsBaseDataSettingVC
@interface JobsBaseDataSettingVC (JobsPropertyDSLSetterAutogen_bebcb80691)
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setModalInPresentation:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsBaseDataSettingVC

@implementation JobsBaseDataSettingVC
-(void)didReceiveMemoryWarning{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsDidReceiveMemoryWarning)))(self, @selector(jobsDidReceiveMemoryWarning));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsDidReceiveMemoryWarning {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super didReceiveMemoryWarning];
    };
}

- (void)dealloc{
    JobsRemoveNotification(self);
    [self.view endEditing:YES];
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byHiddenNavigationBar(YES);
        self.bySetupNavigationBarHidden(YES);
        self.byCurrentPage(@(1));
        self.byModalInPresentation(NO);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        /**

             NOTE:
             View controllers presented with custom presentation controllers
             do not assume control of the status bar appearance by default
             (their -preferredStatusBarStyle and -prefersStatusBarHidden
             methods are not called).  You can override this behavior by
             setting the value of the presented view controller's
             modalPresentationCapturesStatusBarAppearance property to YES.

             self.modalPresentationCapturesStatusBarAppearance = YES;
         */
        self.updatePreferredContentSizeWithTraitCollection(self.traitCollection);
        self.navigationController.interactivePopGestureRecognizer.byDelegate(self);
    };
}

-(void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
            JobsLog(@"%d",self.setupNavigationBarHidden);
            self.byHiddenNavigationBar(self.setupNavigationBarHidden);
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsBaseDataSettingVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}
#pragma mark —— UIContentContainer
/// UIContentContainer 自定义模态动画推出ViewController
-(void)willTransitionToTraitCollection:(UITraitCollection *)newCollection
             withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator{
    [super willTransitionToTraitCollection:newCollection withTransitionCoordinator:coordinator];
    // When the current trait collection changes (e.g. the device rotates),
    // update the preferredContentSize.
    self.updatePreferredContentSizeWithTraitCollection(newCollection);
}
@synthesize presentUpHeight = _presentUpHeight;
-(jobsByUITraitCollectionBlock _Nonnull)updatePreferredContentSizeWithTraitCollection{
    @jobs_weakify(self)
    return ^(UITraitCollection * traitCollection){
        @jobs_strongify(self)
        if (!self) return;
        JobsLog(@"%f",self.presentUpHeight);
        self.preferredContentSize = CGSizeMake(self.view.bounds.size.width,
                                               traitCollection.verticalSizeClass == UIUserInterfaceSizeClassCompact ? 270 : self.presentUpHeight);/// 上升的高度
    };
}
#pragma mark —— UIGestureRecognizerDelegate
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    return YES;
}
#pragma mark —— BaseViewControllerProtocol
#warning 以下写在具体的子类
//-(JobsRetNavBarConfigByButtonModelBlock _Nonnull)makeNavBarConfig{
//    return ^JobsNavBarConfig *_Nullable(UIButtonModel *_Nullable backBtnModel,
//                                        UIButtonModel *_Nullable closeBtnModel) {
//        @jobs_weakify(self)
//        return Jobs3TO(static_navBarConfig, jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable data) {
//            @jobs_strongify(self)
//            /// 对中间标题的配置
//            data.bgCor = self.viewModel.navBgCor;
//            data.bgImage = self.viewModel.navBgImage;
//            data.attributedTitle = Jobs3TO(self.viewModel.attributedTitle, self.viewModel.textModel.attributedTitle);
//            data.title = Jobs3TO(self.viewModel.text, self.viewModel.textModel.text);
//            data.font = Jobs3TO(self.viewModel.font, self.viewModel.textModel.font);
//            data.titleCor = self.viewModel.textModel.textCor;
//            /// 对（左边）返回键的配置
//            data.backBtnModel = Jobs3TO(backBtnModel, self.backBtnModel);
//            /// 对（右边）关闭键的配置
//            data.closeBtnModel = Jobs3TO(closeBtnModel, self.closeBtnModel);
//            self.navBarConfig = data;
//        }));
//    };
//}
#pragma mark —— lazyLoad
/// BaseViewControllerProtocol
@synthesize vcs = _vcs;
-(NSMutableArray<__kindof UIViewController *> *)vcs{
    if(!_vcs){
        _vcs = jobsMakeMutArr(^(NSMutableArray * _Nullable data) {
        });
    };return _vcs;
}
#pragma mark —— Prop_strong()UIViewModel *viewModel;
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(UIViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.textModel.byTextCor(JobsLabelColor)
                          .byFont(UIFontWeightRegularSize(16));
        });
    };return _viewModel;
}
#pragma mark —— Prop_strong()UIButtonModel *closeBtnModel;
/// 在具体的子类去实现，以覆盖父类的方法实现
/// AppToolsProtocol
@synthesize closeBtnModel = _closeBtnModel;
-(UIButtonModel *)closeBtnModel{
    if(!_closeBtnModel){
        _closeBtnModel = jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable data) {
            data.byBackgroundImage(@"联系我们".img)
            //            data.highlightBackgroundImage = @"联系我们".img;
            //            data.jobsResetBtnImage = @"联系我们".img;
            //            data.highlightImage = @"联系我们".img;
            //            data.imagePadding = JobsWidth(5);
            .byRoundingCorners(UIRectCornerAllCorners)
                .byBaseBackgroundColor(JobsClearColor);
        });
    };return _closeBtnModel;
} 
#pragma mark —— Prop_strong()UIButtonModel *backBtnModel;
/// 在具体的子类去实现，以覆盖父类的方法实现
/// AppToolsProtocol
@synthesize backBtnModel = _backBtnModel;
-(UIButtonModel *)backBtnModel{
    if(!_backBtnModel){
        @jobs_weakify(self)
        _backBtnModel = self.jobsMakeBackBtnModel()
            .byLongPressGestureEventBlock(^id(__kindof UIButton *x) {
                JobsLog(@"按钮的长按事件触发");
                return nil;
            })
            .byClickEventBlock(^id(BaseButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
                self.backBtnClickEvent(x);
                return nil;
            });
    };return _backBtnModel;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsBaseDataSettingVC
-(JobsRetJobsBaseDataSettingVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsBaseDataSettingVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}
-(JobsRetJobsBaseDataSettingVCByBOOLBlock _Nonnull)byModalInPresentation{
    @jobs_weakify(self)
    return ^__kindof JobsBaseDataSettingVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setModalInPresentation:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsBaseDataSettingVC
@end
