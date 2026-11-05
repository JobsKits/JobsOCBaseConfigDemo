//
//  BaseViewController.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseViewController.h"
#import "UIView+Refresh.h"
#import "UIView+Measure.h"

static BOOL JobsIsSystemNavigationBarDemo(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"JobsNavigationDemoVC"];
}

@interface BaseViewController ()

-(JobsRetStrByVoidBlock _Nonnull)jobs_defaultNavigationTitle;
-(jobsByVoidBlock _Nonnull)jobs_ensureDefaultNavigationBar;
#if DEBUG
-(void)jobs_probeCoverageDestination:(UIViewController *)destination
              navigationController:(UINavigationController *)navigationController
                 attemptsRemaining:(NSUInteger)attemptsRemaining;
#endif

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN BaseViewController
@interface BaseViewController (JobsPropertyDSLSetterAutogen_fcf4361a7e)
-(void)setGk_navBarAlpha:(CGFloat)data;
-(void)setGk_navRightBarButtonItem:(UIBarButtonItem * _Nullable)data;
-(void)setGk_navRightBarButtonItems:(NSArray<UIBarButtonItem *> * _Nullable)data;
-(void)setGk_navTitleView:(UIView * _Nullable)data;
-(void)setLoadView:(BOOL)data;
-(void)setViewDidAppear:(BOOL)data;
-(void)setViewDidDisappear:(BOOL)data;
-(void)setViewDidLoad:(BOOL)data;
-(void)setViewWillAppear:(BOOL)data;
-(void)setViewWillDisappear:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END BaseViewController

@implementation BaseViewController

-(JobsRetBaseViewControllerByNSUIntegerBlock _Nonnull)byJobsTag{
    @jobs_weakify(self)
    return ^__kindof BaseViewController *_Nullable(NSUInteger data){
        @jobs_strongify(self)
        self.jobsTag = data;
        return self;
    };
}

/// BaseViewProtocol
BaseViewProtocol_synthesize
/// BaseViewControllerProtocol
BaseViewControllerProtocol_synthesize
/// new方法触发
- (instancetype)init{
    if (self = [super init]) {
    };return self;
}
/// new方法触发
- (instancetype)initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil {
    if(self = [super initWithNibName:nibNameOrNil
                              bundle:nibBundleOrNil]) {
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byLoadView(YES);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        if (@available(iOS 13.0, *)) {
            self.view.byBgColor(JobsSystemBackgroundColor);
        } else {
            self.view.byBgColor(JobsSystemBackgroundColor);
        }
        self.byViewDidLoad(YES);
        /// 在loadView或者之前的生命周期中定义背景图片或者底色
        self.setBackGround();
    };
}

- (void)viewWillAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.byViewWillAppear(YES);
        self.jobs_ensureDefaultNavigationBar();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidAppear:animated];
            self.byViewDidAppear(YES);
#if DEBUG
            NSArray<NSString *> *coverageArguments = NSProcessInfo.processInfo.arguments;
            NSUInteger coverageFlag = [coverageArguments indexOfObject:@"--jobs-coverage-route"];
            if (coverageFlag != NSNotFound && self.view.window) {
                NSString *actualClass = NSStringFromClass(self.class);
                BOOL requestedThisPage = coverageFlag + 1 < coverageArguments.count &&
                    [coverageArguments[coverageFlag + 1] isEqualToString:actualClass];
                BOOL visibleInNavigation = !self.navigationController ||
                    self.navigationController.visibleViewController == self;
                // 真实 didAppear 才就绪；返回本页时保留已确认的直接路由标记。
                if (requestedThisPage && visibleInNavigation && !self.presentedViewController) {
                    self.view.accessibilityIdentifier = [@"jobs.coverage.ready." stringByAppendingString:actualClass];
                } else if (![self.view.accessibilityIdentifier hasPrefix:@"jobs.coverage.ready."]) {
                    self.view.accessibilityIdentifier = [@"jobs.coverage.page." stringByAppendingString:actualClass];
                }
            }
#endif
            self.jobs_ensureDefaultNavigationBar();
        #ifdef DEBUG
            /// 网络异步数据刷新UI会在viewDidAppear以后执行viewWillLayoutSubviews、viewDidLayoutSubviews
        //    [self ifEmptyData];
        #endif
    };
}

-(void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.byViewWillDisappear(YES);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
        self.byViewDidDisappear(YES);
#if DEBUG
        if ([NSProcessInfo.processInfo.arguments containsObject:@"--jobs-coverage-route"]) {
            UIViewController *destination = self.navigationController.topViewController;
            if (destination && destination != self) {
                [self jobs_probeCoverageDestination:destination
                              navigationController:self.navigationController
                                 attemptsRemaining:100];
            }
        }
#endif
    };
}

#if DEBUG
-(void)jobs_probeCoverageDestination:(UIViewController *)destination
              navigationController:(UINavigationController *)navigationController
                 attemptsRemaining:(NSUInteger)attemptsRemaining{
    // Jobs 的集成层只观察这次转场的真实实例，不接管第三方控制器或导航代理。
    if (navigationController.topViewController != destination) {
        return;
    }
    if (navigationController.visibleViewController == destination &&
        destination.isViewLoaded && destination.view.window &&
        !navigationController.transitionCoordinator && !destination.transitionCoordinator) {
        if (![destination.view.accessibilityIdentifier hasPrefix:@"jobs.coverage.ready."]) {
            destination.view.accessibilityIdentifier = [@"jobs.coverage.page." stringByAppendingString:NSStringFromClass(destination.class)];
        }
        return;
    }
    if (!attemptsRemaining) {
        return;
    }
    __weak __typeof__(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf jobs_probeCoverageDestination:destination
                         navigationController:navigationController
                            attemptsRemaining:attemptsRemaining - 1];
    });
}
#endif

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        UIScrollView *refreshTargetView = self.view.mjRefreshTargetView;
        MJRefreshFooter *footer = refreshTargetView.mj_footer;
        if (footer) footer.byY(refreshTargetView.contentSize.height);
    };
}
#pragma mark —— 一些私有方法
-(BOOL)jobs_requiresDefaultNavigationBar{
    JobsRetBOOLByVoidBlock action = ((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(BaseViewController.class, @selector(jobsJobs_requiresDefaultNavigationBar)))(self, @selector(jobsJobs_requiresDefaultNavigationBar));
    return action ? action() : NO;
}


-(JobsRetBOOLByVoidBlock _Nonnull)jobsJobs_requiresDefaultNavigationBar{
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return NO;
        UINavigationController *navigationController = self.navigationController;
        BOOL isNavigationChild = navigationController.topViewController == self &&
            navigationController.viewControllers.firstObject != self;
        BOOL isPresentedPage = self.presentingViewController ||
            (navigationController.viewControllers.firstObject == self && navigationController.presentingViewController);
        return isNavigationChild || isPresentedPage;
    };
}

-(JobsRetStrByVoidBlock _Nonnull)jobs_defaultNavigationTitle{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *navigationTitle = self.viewModel.textModel.attributedTitle.string;
        if (!navigationTitle.length) navigationTitle = self.viewModel.textModel.text;
        if (!navigationTitle.length) navigationTitle = self.title;
        if (!navigationTitle.length) navigationTitle = NSStringFromClass(self.class);
        return navigationTitle;
    };
}

-(jobsByVoidBlock _Nonnull)jobs_ensureDefaultNavigationBar{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (![self jobs_requiresDefaultNavigationBar]) return;
        if (JobsIsSystemNavigationBarDemo(self)) {
            [self.navigationController setNavigationBarHidden:NO animated:NO];
            self.navigationController.navigationBar.byHidden(NO);
            self.jobs_ensureDemoThemeButton();
            return;
        }
        NSString *navigationTitle = self.jobs_defaultNavigationTitle();
        if (!self.title.length) self.title = navigationTitle;
        if (!self.viewModel.textModel.attributedTitle.string.length &&
            !self.viewModel.textModel.text.length) {
            self.viewModel.textModel.byText(navigationTitle);
        }
        if (!self.gk_navTitle.length && !self.gk_navTitleView) {
            if (self.navigationItem.titleView) {
                self.byGk_navTitleView(self.navigationItem.titleView);
            }else self.byGKNavTitle(navigationTitle);
        }
        if (!self.gk_navRightBarButtonItem && !self.gk_navRightBarButtonItems.count) {
            if (self.navigationItem.rightBarButtonItems.count) {
                self.byGk_navRightBarButtonItems(self.navigationItem.rightBarButtonItems);
            }else if (self.navigationItem.rightBarButtonItem) {
                self.byGk_navRightBarButtonItem(self.navigationItem.rightBarButtonItem);
            }
        }
        if (!self.gk_navLeftBarButtonItem && !self.gk_navLeftBarButtonItems.count) {
            self.setGKNavBackBtnBy(nil);
        }
        self.jobs_ensureDemoThemeButton();
        self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
            navigationBar
                .byHidden(NO)
                .byAlpha(1);
        });
        self.byGk_navBarAlpha(1);
        [self.navigationController setNavigationBarHidden:YES animated:NO];
        self.view.byBringSubviewToFront(self.gk_navigationBar);
    };
}
/// 在loadView或者之前的生命周期中定义背景图片或者底色
-(jobsByVoidBlock _Nonnull)setBackGround{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        /// 页面根承载面统一跟随系统主题；业务图片与固定色请放到内容子视图。
        self.view.byBgColor(JobsSystemBackgroundColor);
        if (_bgImageView) _bgImageView.byAlpha(0);
    };
}
#pragma mark —— lazyLoad
/// UIPictureAndBackGroundCorProtocol
@synthesize bgImageView = _bgImageView;
-(UIImageView *)bgImageView{
    if (!_bgImageView) {
        @jobs_weakify(self)
        _bgImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            @jobs_strongify(self)
            imageView
                .byImage(self.viewModel.bgImage)
                .byAlpha(0)
                .byUserInteractionEnabled(YES)
                .byAutoresizingMask(UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight)
                .byFrame(self.view.bounds);
    //        self.view = _bgImageView; // 如果用UIImageView来替换原本的View，有时候会出现一些错误
            [self.view insertSubview:imageView atIndex:0];
        });
    };return _bgImageView;
}
/// 在具体的子类去实现，以覆盖父类的方法实现
//@synthesize backBtnModel = _backBtnModel;
//-(UIButtonModel *)backBtnModel{
//    if(!_backBtnModel){
//        @jobs_strongify(self)
//        _backBtnModel = self.makeBackBtnModel;
//        _backBtnModel.longPressGestureEventBlock = ^id(__kindof UIButton *x) {
//            JobsLog(@"按钮的长按事件触发");
//            return nil;
//        };
//        _backBtnModel.clickEventBlock = ^id(BaseButton *x){
//            @jobs_strongify(self)
//            if (self.objBlock) self.objBlock(x);
//            self.showTabBar(YES);
//            self.backTo(2);
//            return nil;
//        };
//    };return _backBtnModel;
//}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN BaseViewController
-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byLoadView{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setLoadView:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidAppear{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewDidAppear:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidDisappear{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewDidDisappear:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewDidLoad{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewDidLoad:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewWillAppear{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewWillAppear:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByBOOLBlock _Nonnull)byViewWillDisappear{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewWillDisappear:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByCGFloatBlock _Nonnull)byGk_navBarAlpha{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setGk_navBarAlpha:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByNSArrayUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItems{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(NSArray<UIBarButtonItem *> * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navRightBarButtonItems:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByUIBarButtonItemBlock _Nonnull)byGk_navRightBarButtonItem{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(UIBarButtonItem * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navRightBarButtonItem:data];
        return self;
    };
}

-(JobsRetBaseViewControllerByUIViewBlock _Nonnull)byGk_navTitleView{
    @jobs_weakify(self)
    return ^__kindof BaseViewController * _Nullable(UIView * _Nullable data){
        @jobs_strongify(self)
        [self setGk_navTitleView:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END BaseViewController

@end
