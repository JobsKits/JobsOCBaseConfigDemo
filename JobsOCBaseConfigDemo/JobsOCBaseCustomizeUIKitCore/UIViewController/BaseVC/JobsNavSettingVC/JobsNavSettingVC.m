//
//  JobsNavSettingVC.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsNavSettingVC.h"

#import "UIViewController+BaseNavigationBar.h"
#import "UIView+Extra.h"
#import "JobsNavBarConfig.h"

@interface JobsNavSettingVC ()

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsNavSettingVC
@interface JobsNavSettingVC (JobsPropertyDSLSetterAutogen_6ea5b9cb4f)
-(void)setExtendedLayoutIncludesOpaqueBars:(BOOL)data;
-(void)setIsHiddenNavigationBar:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsNavSettingVC

@implementation JobsNavSettingVC
-(void)didReceiveMemoryWarning{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsDidReceiveMemoryWarning)))(self, @selector(jobsDidReceiveMemoryWarning));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.bySetupNavigationBarHidden(YES);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            /**
             当设置为 YES 时，视图控制器的布局将考虑导航栏、工具栏或标签栏的不透明性，即这些栏的背后内容会从顶部或底部开始布局。
             这样可以确保不透明的栏不会覆盖内容。
     
             当设置为 NO 时，视图控制器的布局会忽略不透明栏的影响，内容会延伸到整个视图控制器的边界，包括被不透明栏遮挡的部分。
             */
            self.byExtendedLayoutIncludesOpaqueBars(YES);
        /// 因为GKNavigationBar对横屏不兼容，所以这里采用GKNavigationBar（竖屏）+JobsNavBar（横屏）的方案
        #pragma mark —— 在最终的子类这么写（演示Demo）
        //    /// 配置右侧按钮群
        //    self.rightBarButtonItems = jobsMakeMutArr(^(NSMutableArray <UIBarButtonItem *>* _Nullable data) {
        //        @jobs_strongify(self)
        //        data.add(UIBarButtonItem.initBy(BaseButton.jobsInit()
        //                                        .jobsResetBtnBgImage("首页右侧悬浮菜单人工客服（已点击）".img)
        //                                        .onClickBy(^(UIButton *x){
        //                                            @jobs_strongify(self)
        //                                            if (self.objBlock) self.objBlock(x);
        //                                        }).onLongPressGestureBy(^(id data){
        //                                            JobsLog(@"");
        //                                        })
        //                                        .bySize(CGSizeMake(JobsWidth(24), JobsWidth(24)))));
        //    });
        //    self.makeNavByConfig(jobsMakeNavBarConfig(^(__kindof JobsNavBarConfig * _Nullable config) {
        //        config.alpha = 1;
        //        config.titleImage = @"BLuckyRedLogo".img; /// 配置中间的标题为图片
        //        /// 配置返回键
        //        config.backBtn = BaseButton.initByButtonModel(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable buttonModel) {
        ////            @jobs_strongify(self)
        //            buttonModel.normalImage = @"全局返回箭头".img;
        //            buttonModel.highlightImage = @"全局返回箭头".img
        //            buttonModel.title = @"".jobsTr();
        //            buttonModel.titleFont = bayonRegular(14);
        //            buttonModel.titleCor = @"#8A93A1".jobsCor();
        //            buttonModel.imagePlacement = NSDirectionalRectEdgeLeading;
        //            buttonModel.textAlignment = NSTextAlignmentCenter;
        //            buttonModel.subTextAlignment = NSTextAlignmentCenter;
        //            buttonModel.baseBackgroundColor = JobsClearColor;
        //            buttonModel.imagePadding = JobsWidth(5);
        //            buttonModel.clickEventBlock = ^id(__kindof UIButton *_Nullable x){
        //                @jobs_strongify(self)
        //                x.selected = !x.selected;
        //                JobsAppTool.loginWork = FMLoginWork_MyFav;
        //    //            self.backTo(0);
        //                self.backViewControllerCore(self);
        //                return nil;
        //            };
        //            buttonModel.longPressGestureEventBlock = ^id(__kindof UIButton *_Nullable btn){
        //                // @jobs_strongify(self)
        //                return nil;
        //            };
        //        }));
        //    }));
    };
}

- (void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        JobsLog(@"%d",self.setupNavigationBarHidden);
        self.byHiddenNavigationBar(self.setupNavigationBarHidden);
        [self.navigationController setNavigationBarHidden:self.setupNavigationBarHidden animated:animated];
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsNavSettingVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— 一些公有方法
-(jobsByCGFloatBlock _Nonnull)makeNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        /// JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape
        id<AppToolsProtocol> appToolsSelf = (id<AppToolsProtocol>)self;
        appToolsSelf.setGKNav(nil);
        appToolsSelf.setGKNavBackBtn(nil);
        if(self.leftBarButtonItems.count) self.byGKNavLeftBarButtonItems(self.leftBarButtonItems);
        if(self.rightBarButtonItems.count) self.byGKNavRightBarButtonItems(self.rightBarButtonItems);
        self.jobs_ensureDemoThemeButton();
        self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar
                .byHidden(!data)
                .byAlpha(data);
        });
        if (data) self.view.byBringSubviewToFront(self.gk_navigationBar);
    };
}

-(jobsByCGFloatBlock _Nonnull)makeJobsNavByAlpha{
    @jobs_weakify(self)
    return ^(CGFloat data){
        @jobs_strongify(self)
        ((id<AppToolsProtocol>)self).makeNavBarConfig(nil,nil);
        ((UIView *)self.navBar).hidden = !data;
        ((UIView *)self.navBar).alpha = data;
    };
}

-(jobsByNavBarConfigBlock _Nonnull)makeNavByConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsNavBarConfig *_Nullable config){
        @jobs_strongify(self)
        /// GKNavigationBar 对横屏可能不兼容
        if(JobsAppTool.jobsDeviceOrientation == DeviceOrientationLandscape){
            self.makeJobsNavByAlpha(config.viewModel.Alpha);
        }else{
            self.makeGKNavByConfig(config);
        }
    };
}

-(jobsByNavBarConfigBlock _Nonnull)makeGKNavByConfig{
    @jobs_weakify(self)
    return ^(__kindof JobsNavBarConfig *_Nullable config){
        @jobs_strongify(self)
        id<AppToolsProtocol> appToolsSelf = (id<AppToolsProtocol>)self;
        appToolsSelf.setGKNav(config.viewModel);/// 配置GKNavigationBar（不包括返回键的设定）
        appToolsSelf.setGKNavBackBtnBy(config.backBtn);/// 配置GKNavigationBar的返回按钮
        appToolsSelf.setGKNavTitleBtnBy(jobsMakeButtonModel(^(__kindof UIButtonModel * _Nullable model) {
            model.byBackgroundImage(config.viewModel.titleImage)
                 .byJobsSize(CGSizeMake(JobsWidth(150), JobsWidth(30)))
                 .byBaseBackgroundColor(JobsClearColor);
        }));
        if(self.leftBarButtonItems.count) self.byGKNavLeftBarButtonItems(self.leftBarButtonItems);
        if(self.rightBarButtonItems.count) self.byGKNavRightBarButtonItems(self.rightBarButtonItems);
        self.jobs_ensureDemoThemeButton();
        self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar.byVisible(config.viewModel.Alpha);
        });
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsNavSettingVC
-(JobsRetJobsNavSettingVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsNavSettingVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}
-(JobsRetJobsNavSettingVCByBOOLBlock _Nonnull)byExtendedLayoutIncludesOpaqueBars{
    @jobs_weakify(self)
    return ^__kindof JobsNavSettingVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setExtendedLayoutIncludesOpaqueBars:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsNavSettingVC
@end
