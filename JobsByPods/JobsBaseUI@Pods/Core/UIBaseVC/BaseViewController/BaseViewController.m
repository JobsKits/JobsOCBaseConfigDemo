//
//  BaseViewController.m
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "BaseViewController.h"
#import <JobsBaseUI/UIView+Refresh.h>
#import <JobsBaseUI/UIView+Measure.h>

static BOOL JobsIsSystemNavigationBarDemo(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"JobsNavigationDemoVC"];
}

@interface BaseViewController ()

-(NSString *)jobs_defaultNavigationTitle;
-(void)jobs_ensureDefaultNavigationBar;

@end

@implementation BaseViewController
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
    [super loadView];
    self.LoadView = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (@available(iOS 13.0, *)) {
        self.view.byBgColor(JobsSystemBackgroundColor);
    } else {
        self.view.byBgColor(JobsWhiteColor);
    }
    self.ViewDidLoad = YES;
    /// 在loadView或者之前的生命周期中定义背景图片或者底色
    self.setBackGround();
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.ViewWillAppear = YES;
    [self jobs_ensureDefaultNavigationBar];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.ViewDidAppear = YES;
    [self jobs_ensureDefaultNavigationBar];
#ifdef DEBUG
    /// 网络异步数据刷新UI会在viewDidAppear以后执行viewWillLayoutSubviews、viewDidLayoutSubviews
//    [self ifEmptyData];
#endif
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.ViewWillDisappear = YES;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    self.ViewDidDisappear = YES;
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.view.mjRefreshTargetView.mj_footer.y = self.view.mjRefreshTargetView.contentSize.height;
}
#pragma mark —— 一些私有方法
-(BOOL)jobs_requiresDefaultNavigationBar{
    UINavigationController *navigationController = self.navigationController;
    BOOL isNavigationChild = navigationController.topViewController == self &&
        navigationController.viewControllers.firstObject != self;
    BOOL isPresentedPage = self.presentingViewController ||
        (navigationController.viewControllers.firstObject == self && navigationController.presentingViewController);
    return isNavigationChild || isPresentedPage;
}

-(NSString *)jobs_defaultNavigationTitle{
    NSString *navigationTitle = self.viewModel.textModel.attributedTitle.string;
    if (!navigationTitle.length) navigationTitle = self.viewModel.textModel.text;
    if (!navigationTitle.length) navigationTitle = self.title;
    if (!navigationTitle.length) navigationTitle = NSStringFromClass(self.class);
    return navigationTitle;
}

-(void)jobs_ensureDefaultNavigationBar{
    if (![self jobs_requiresDefaultNavigationBar]) return;
    if (JobsIsSystemNavigationBarDemo(self)) {
        [self.navigationController setNavigationBarHidden:NO animated:NO];
        self.navigationController.navigationBar.byHidden(NO);
        return;
    }
    NSString *navigationTitle = [self jobs_defaultNavigationTitle];
    if (!self.title.length) self.title = navigationTitle;
    if (!self.viewModel.textModel.attributedTitle.string.length &&
        !self.viewModel.textModel.text.length) {
        self.viewModel.textModel.byText(navigationTitle);
    }
    if (!self.gk_navTitle.length && !self.gk_navTitleView) {
        if (self.navigationItem.titleView) {
            self.gk_navTitleView = self.navigationItem.titleView;
        }else self.byGKNavTitle(navigationTitle);
    }
    if (!self.gk_navRightBarButtonItem && !self.gk_navRightBarButtonItems.count) {
        if (self.navigationItem.rightBarButtonItems.count) {
            self.gk_navRightBarButtonItems = self.navigationItem.rightBarButtonItems;
        }else if (self.navigationItem.rightBarButtonItem) {
            self.gk_navRightBarButtonItem = self.navigationItem.rightBarButtonItem;
        }
    }
    if (!self.gk_navLeftBarButtonItem && !self.gk_navLeftBarButtonItems.count) {
        ((id<AppToolsProtocol>)self).setGKNavBackBtnBy(nil);
    }
    self.byGKNavigationBarBlock(^(__kindof GKCustomNavigationBar * _Nullable navigationBar) {
        navigationBar
            .byHidden(NO)
            .byAlpha(1);
    });
    self.gk_navBarAlpha = 1;
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    self.view.byBringSubviewToFront(self.gk_navigationBar);
}
/// 在loadView或者之前的生命周期中定义背景图片或者底色
-(jobsByVoidBlock _Nonnull)setBackGround{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        /// 底图没有 + 底色没有
        if(!self.viewModel.bgImage && !self.viewModel.bgCor){
            self.view.byBgColor(HEXCOLOR(0xFCFBFB));
            return;
        }
        /// 底图有 + 底色没有
        if(self.viewModel.bgImage && !self.viewModel.bgCor){
            self.bgImageView.byAlpha(1);
            return;
        }
        /// 底图没有 + 底色有
        if(!self.viewModel.bgImage && self.viewModel.bgCor){
            self.view.byBgColor(self.viewModel.bgCor);
            return;
        }
        /// 底图有 + 底色有 = 优先使用底图数据
        if(self.viewModel.bgImage && self.viewModel.bgCor){
            self.bgImageView.byAlpha(1);
            return;
        }
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
                .byUserInteractionEnabled(YES);
            imageView.resetOrigin(CGPointMake(self.view.x, self.view.y));
            imageView.resetSize(CGSizeMake(JobsRealWidth(), JobsRealHeight()));
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

@end
