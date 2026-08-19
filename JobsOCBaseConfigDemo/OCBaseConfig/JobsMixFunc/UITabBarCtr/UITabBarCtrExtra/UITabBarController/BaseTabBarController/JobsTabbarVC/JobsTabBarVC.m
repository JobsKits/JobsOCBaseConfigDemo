//
//  JobsTabBarVC.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTabBarVC.h"

#import "UIViewController+Lottie.h"

static NSArray<__kindof JobsTabBarItemConfig *> *JobsTabBarVCItemConfigs(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (!appDelegateClass) return @[];
    @try {
        id value = [appDelegateClass valueForKey:@"tabBarItemConfigMutArr"];
        return [value isKindOfClass:NSArray.class] ? value : @[];
    } @catch (__unused NSException *exception) {
        return @[];
    }
}

static NSArray<__kindof UIViewController *> *JobsTabBarVCViewControllers(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (!appDelegateClass) return @[];
    @try {
        id value = [appDelegateClass valueForKey:@"viewCtrlByTabBarCtrlConfigMutArr"];
        return [value isKindOfClass:NSArray.class] ? value : @[];
    } @catch (__unused NSException *exception) {
        return @[];
    }
}

static BOOL JobsTabBarVCIsLogin(id target) {
    SEL selector = @selector(isLogin);
    if (![target respondsToSelector:selector]) return NO;
    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    if (!signature) return NO;
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.byTarget(target);
    invocation.bySelector(selector);
    [invocation invoke];
    BOOL isLogin = NO;
    [invocation getReturnValue:&isLogin];
    return isLogin;
}

@interface JobsTabBarVC (){
    BOOL A;
}
/// UI
Prop_strong(readwrite)JobsTabBar *myTabBar;/// myTabBar.humpOffsetY 凸起的高度自定义，默认值30  offsetHeight
/// Data
Prop_assign()BOOL isOpenPPBadge;
Prop_assign()NSInteger subViewControllerCount;
Prop_strong()NSMutableArray <UIView *>*UITabBarButtonMutArr;/// UITabBarButton 是内部类 直接获取不到，需要间接获取
Prop_strong()NSMutableArray <UIViewModel *>*pullListAutoSizeViewMutArr;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsTabBarVC
@interface JobsTabBarVC (JobsPropertyDSLSetterAutogen_ce46f22774)
-(void)setIsAnimationAlert:(BOOL)data;
-(void)setIsFeedbackGenerator:(BOOL)data;
-(void)setIsHiddenNavigationBar:(BOOL)data;
-(void)setIsOpenPPBadge:(BOOL)data;
-(void)setIsOpenScrollTabbar:(BOOL)data;
-(void)setIsPlaySound:(BOOL)data;
-(void)setMyTabBar:(JobsTabBar * _Nullable)data;
-(void)setSelectedIndex:(NSUInteger)data;
-(void)setViewControllers:(NSArray<__kindof UIViewController *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsTabBarVC

@implementation JobsTabBarVC
-(JobsRetJobsTabBarVCByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC *_Nullable(id<UITabBarControllerDelegate> _Nullable delegate){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setDelegate:delegate];
        return self;
    };
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}
#pragma mark —— 初始化方法
static JobsTabBarVC *JobsTabBarVCInstance = nil;
static dispatch_once_t JobsTabBarVCOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTabBarVC.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id _Nonnull{
        dispatch_once(&JobsTabBarVCOnceToken, ^{
            JobsTabBarVCInstance = [[super allocWithZone:NULL] init];
        });return JobsTabBarVCInstance;
    };
}
///【单例模式】使用外界自定义的JobsTabBar
+(JobsRetIDByJobsTabBarBlock _Nonnull)sharedInstanceWithJobsTabBar{
    return ^id _Nonnull(JobsTabBar * tabBar){
        dispatch_once(&JobsTabBarVCOnceToken, ^{
            JobsTabBarVCInstance = [[super allocWithZone:NULL] init];
            JobsTabBarVCInstance.byMyTabBar(tabBar);
        });return JobsTabBarVCInstance;
    };
}

+ (instancetype _Nonnull)allocWithZone:(struct _NSZone *)zone {
    return (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTabBarVC.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager)))();
}
/// 防止外部调用copy
- (instancetype _Nonnull)copyWithZone:(NSZone *)zone {
    return self;
}
/// 防止外部调用mutableCopy
- (instancetype _Nonnull)mutableCopyWithZone:(NSZone *)zone {
    return self;
}
/// 一般的初始化模式
-(instancetype _Nonnull)initWithJobsTabBar:(JobsTabBar *_Nonnull)tabBar{
    if (self = [super init]) {
        self.myTabBar = tabBar;
    };return self;
}
#pragma mark —— 单例的销毁
+(void)destroySingleton{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsTabBarVC.class, @selector(jobsDestroySingleton)))(self, @selector(jobsDestroySingleton));
    if (action) action();
}

+(jobsByVoidBlock _Nonnull)jobsDestroySingleton{
    return ^{
        JobsTabBarVCInstance = nil;
        JobsTabBarVCOnceToken = 0;
    };
}
#pragma mark —— ViewController的生命周期
-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        A = YES;
        self.byDelegate(self);
        self.byOpenScrollTabbar(YES);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            /// 手势左右滑动以切换TabbarControl挂载的ViewController
            if (self.isOpenScrollTabbar) {
                [self openPan]();
                if (self.view.panGR) self.view.panGR.byEnabled(self.isOpenScrollTabbar);
            }
            self.myTabBar.byAlpha(1);
        //    self.suspendBtn.alpha = 1;
        //    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
        //    JobsLog(@"");
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
            self.byHiddenNavigationBar(YES);
            @jobs_weakify(self)
            static dispatch_once_t JobsTabbarVC_viewWillAppear_onceToken;
            dispatch_once(&JobsTabbarVC_viewWillAppear_onceToken, ^{
                @jobs_strongify(self)
                self.UISetting();//最高只能在viewWillAppear，在viewDidLoad不出效果 self.tabBar.subviews为空
        //        [self 添加长按手势];
            });
        //    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
        //    JobsLog(@"");
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidAppear:animated];
        //    UIDeviceOrientation f =  UIDevice.currentDevice.orientation;
        //    UIInterfaceOrientation s = self.getInterfaceOrientation;
        //    DeviceOrientation d = self.getDeviceOrientation;
        //    JobsLog(@"");
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
        JobsLog(@"");
    };
}
static dispatch_once_t onceToken;
-(void)viewDidLayoutSubviews {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
        dispatch_once(&onceToken, ^{
            self.myTabBar.height += self.myTabBar.customTabBarOffsetHeight();
            self.myTabBar.byY(self.view.height - self.myTabBar.height);
        });self.ppBadge(YES);
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
#pragma mark —— 在 UITabBarController 中适配横屏在 UITabBarController 中适配横屏
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 决定当前界面是否开启自动转屏，如果返回NO，后面两个方法也不会被调用，只是会支持默认的方向
-(BOOL)shouldAutorotate{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsShouldAutorotate)))(self, @selector(jobsShouldAutorotate)))();
}

- (JobsRetBOOLByVoidBlock _Nonnull)jobsShouldAutorotate {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.selectedViewController.shouldAutorotate;
    };
}
#pragma clang diagnostic pop
/// 当前控制器支持的屏幕旋转方向（在具体的控制器子类进行覆写）
/// iPad设备上，默认返回值UIInterfaceOrientationMaskAllButUpSideDwon
/// iPhone设备上，默认返回值是UIInterfaceOrientationMaskAll
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    JobsRetUIInterfaceOrientationMaskByVoidBlock action = ((JobsRetUIInterfaceOrientationMaskByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsSupportedInterfaceOrientations)))(self, @selector(jobsSupportedInterfaceOrientations));
    return action ? action() : (UIInterfaceOrientationMask){0};
}

-(JobsRetUIInterfaceOrientationMaskByVoidBlock _Nonnull)jobsSupportedInterfaceOrientations{
    @jobs_weakify(self)
    return ^UIInterfaceOrientationMask{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientationMask){0};
        return self.selectedViewController.supportedInterfaceOrientations;
    };
}
/// 设置进入界面默认支持的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation{
    JobsRetUIInterfaceOrientationByVoidBlock action = ((JobsRetUIInterfaceOrientationByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsTabBarVC.class, @selector(jobsPreferredInterfaceOrientationForPresentation)))(self, @selector(jobsPreferredInterfaceOrientationForPresentation));
    return action ? action() : (UIInterfaceOrientation){0};
}

-(JobsRetUIInterfaceOrientationByVoidBlock _Nonnull)jobsPreferredInterfaceOrientationForPresentation{
    @jobs_weakify(self)
    return ^UIInterfaceOrientation{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientation){0};
        return [super preferredInterfaceOrientationForPresentation];
    };
}
#pragma mark —— 一些公有方法
/// 关闭手势
-(jobsByVoidBlock _Nonnull)closePan{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        if (self.view.panGR) self.view.panGR.byEnabled(NO);
    };
}
/// 打开手势
-(jobsByVoidBlock _Nonnull)openPan{
    @jobs_weakify(self)
    return ^() {
        @jobs_strongify(self)
        self.view.byNumberOfTouchesRequired(1);
        self.view.byNumberOfTapsRequired(1);
        self.view.byMinimumPressDuration(0.1);
        self.view.byAllowableMovement(1);
        self.view.byUserInteractionEnabled(YES);
        self.view.byWeak_target(self);
        self.view.panGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id  _Nullable target,
                                                                                UIPanGestureRecognizer *_Nullable pan) {
            @jobs_strongify(self)
            if (self.transitionCoordinator) return nil;
            if (pan.state == UIGestureRecognizerStateBegan ||
                pan.state == UIGestureRecognizerStateChanged){
                self.beginInteractiveTransitionIfPossible(pan);
            };return nil;
        });
        if (self.view.panGR) self.view.panGR.byEnabled(YES);
    };
}
/// 开启/关闭 PPBadgeView的效果,至少在viewDidLayoutSubviews后有效
-(jobsByBOOLBlock _Nonnull)ppBadge{
    @jobs_weakify(self)
    return ^(BOOL open) {
        @jobs_strongify(self)
        if (@available(iOS 16.0, *)) {
            self.byOpenPPBadge(open);
            if (open) {
                for (UITabBarItem *item in self.tabBar.items) {
                    if (item.title.isEqualToString(@"首页".jobsTr())) {
                        [item pp_addBadgeWithText:@"919+"];
#pragma mark —— 动画
                        item.badgeView.图片从小放大();
                        [item.badgeView shakerAnimationWithDuration:2 height:20];//重力弹跳动画效果
                        item.badgeView.视图上下一直来回跳动的动画();
                    }
                }
            }
        }
    };
}
#pragma mark —— 一些私有方法
/// 需要强制跳转登录的index。点击和手势滑动都需要共同调用
-(JobsRetBOOLByNSUIntegerBlock _Nonnull)forcedLoginIndex{
    @jobs_weakify(self)
    return ^(NSUInteger data) {
        @jobs_strongify(self)
        for (JobsTabBarItemConfig *tabBarItemConfig in JobsTabBarVCItemConfigs()) {
            if(tabBarItemConfig.isNeedCheckLogin){
                self.forcedLogin();
                return YES;
            }
        };return NO;
    };
}
/// 判别是否有Lottie
-(JobsRetBOOLByNSIntegerBlock _Nonnull)judgeLottieWithIndex{
    return ^BOOL(NSInteger index) {
        JobsTabBarItemConfig *config = nil;
        NSArray<__kindof JobsTabBarItemConfig *> *tabBarItemConfigs = JobsTabBarVCItemConfigs();
        if(index >= 0 && index < tabBarItemConfigs.count){
            config = (JobsTabBarItemConfig *)tabBarItemConfigs[index];
        };return isValue(config.lottieName);
    };
}
/// ❤️关键方法❤️
-(jobsByVoidBlock _Nonnull)UISetting{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSArray<__kindof JobsTabBarItemConfig *> *tabBarItemConfigs = JobsTabBarVCItemConfigs();
        NSArray<__kindof UIViewController *> *viewControllers = JobsTabBarVCViewControllers();
        for (int i = 0; i < tabBarItemConfigs.count; i++) {
            if (i >= viewControllers.count) break;
            JobsTabBarItemConfig *config = (JobsTabBarItemConfig *)tabBarItemConfigs[i];
    //        self.tabBarItem.title = config.title;
    //        self.tabBarItem.image = config.imageUnselected;
            // For Test
    //        if ([self judgeLottieWithIndex:i]) {
    //            [self addLottieImage:config.lottieName];// 有Lottie动画名，则优先创建Lottie动画
    //        }
            UIViewController *viewController = viewControllers[i];
            viewController.byTitle(config.title);
            viewController.byTabBarItem(JobsTabBarItem.initByConfig(config));
            if (config.humpOffsetY != 0) {
                //一般的图片
                /// 修改图片偏移量，上下，左右必须为相反数，否则图片会被压缩
                viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(-config.humpOffsetY,
                                                                         0,
                                                                         -config.humpOffsetY / 2,
                                                                         0);
                /// 修改文字偏移量
                viewController.tabBarItem.byTitlePositionAdjustment(UIOffsetMake(0, 0));
            }
            /// 用导航控制器包裹每一个控制器
    //        if (![viewController isKindOfClass:UINavigationController.class]) {/// 防止UIImagePickerController崩
    //            BaseNavigationVC *nav = [BaseNavigationVC.alloc initWithRootViewController:viewController];
    //            nav.title = config.title;
    //            [AppDelegate.makeUIViewControllerMutArr replaceObjectAtIndex:i withObject:nav];/// 替换元素，每个VC加Navigation
    //        }
        }
        /// ❤️这句话走了以后 才会有self.tabBar
        self.byViewControllers(JobsTabBarVCViewControllers());
        for (UIView *subView in self.tabBar.subviews) {
            if ([subView isKindOfClass:NSClassFromString(UITabBarButton)]) {
                subView.图片从小放大();
                self.UITabBarButtonMutArr.add(subView);
            }
        }
        /// 初始显示【具备Lottie播放条件才进行相关初始化操作】
        extern NSUInteger DefaultIndex;
        if (DefaultIndex < self.viewControllers.count) {
            self.bySelectedIndex(DefaultIndex);
            if (self.judgeLottieWithIndex(self.selectedIndex)) {
                NSArray<__kindof UIViewController *> *viewControllers = JobsTabBarVCViewControllers();
                if (DefaultIndex < viewControllers.count) (viewControllers[DefaultIndex]).lottieImagePlay();
                self.tabBar.animationLottieImageBy(DefaultIndex);
            }
        }
    };
}
/// 手势左右滑动以切换TabbarControl挂载的ViewController
-(jobsByPanGestureRecognizerBlock _Nonnull)beginInteractiveTransitionIfPossible{
    @jobs_weakify(self)
    return ^(UIPanGestureRecognizer __kindof *_Nullable sender) {
        @jobs_strongify(self)
        CGPoint translation = [sender translationInView:self.view];
        JobsLog(@"FromIndex = %lu",(unsigned long)self.selectedIndex);
        /// ❤️需要被跳开的item的逻辑❤️
        for (JobsTabBarItemConfig *tabBarItemConfig in JobsTabBarVCItemConfigs()) {
            if(tabBarItemConfig.isNeedjump){
                NSUInteger d = [JobsTabBarVCItemConfigs() indexOfObject:tabBarItemConfig];
                if (d <= self.tabBar.items.count - 1) {
                    {// 手势从左到右 和 手势从右到左 的两种触发方式
                        // 手势从左到右
                        if (self.selectedIndex == d - 1) {
                            if (translation.x > 0.f && self.selectedIndex > 0) {
                                self.selectedIndex --;
                            }else{
                                if (self.isJumpToNextVC) {
                                    self.selectedIndex += 2;
                                }
                                // 向外回调需要做的事
                                if (self.retBoolByUIntegerBlock) self->A = self.retBoolByUIntegerBlock(d);
                            };return;
                        }
                        // 手势从右到左
                        if (self.selectedIndex == d + 1) {
                            if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) {
                                self.selectedIndex ++;
                            }else{
                                if (self.isJumpToNextVC) self.selectedIndex -= 2;
                                // 向外回调需要做的事
                                if (self.retBoolByUIntegerBlock) self->A = self.retBoolByUIntegerBlock(d);
                            };return;
                        }
                    }
                }
            }
        }
        if (translation.x > 0.f && self.selectedIndex > 0) self.selectedIndex--;
        if (translation.x < 0.f && self.selectedIndex + 1 < self.viewControllers.count) self.selectedIndex++;
        self.forcedLoginIndex(self.selectedIndex);
        JobsLog(@"ToIndex = %lu",(unsigned long)self.selectedIndex);
    };
}
#pragma mark —— TabBarItem的相关手势
-(void)添加长按手势{
    for (UIView *subView in self.UITabBarButtonMutArr) {
        subView.byTag([self.UITabBarButtonMutArr indexOfObject:subView]);
        subView.byNumberOfTouchesRequired(1);
        subView.byNumberOfTapsRequired(1);
        subView.byMinimumPressDuration(0.1);
        subView.byAllowableMovement(1);
        subView.byUserInteractionEnabled(YES);
        subView.byWeak_target(self);
        subView.longPressGR_SelImp.selector = self.jobsSelectorBlock(^id _Nullable(id _Nullable target,
                                                                                    UILongPressGestureRecognizer *_Nullable longPressGR) {
            if(self.gestureRecognizerBlock) self.gestureRecognizerBlock(longPressGR);
            switch (longPressGR.state) {
                /// 处理 UIGestureRecognizerStatePossible 分支
                case UIGestureRecognizerStatePossible:{
                    JobsLog(@"没有触摸事件发生，所有手势识别的默认状态");
                }break;
                /// 处理 UIGestureRecognizerStateBegan 分支
                case UIGestureRecognizerStateBegan:{
                    if (self.isFeedbackGenerator) {
                        NSObject.feedbackGenerator(nil);/// 震动反馈
                    }
                    /// 长按手势出菜单（高仿 Telegram）
                    [JobsPullListAutoSizeView initWithTargetView:self.UITabBarButtonMutArr[longPressGR.view.tag]
                                                      dataMutArr:self.pullListAutoSizeViewMutArr];
                    JobsLog(@"一个手势已经开始  但尚未改变或者完成时");
                }break;
                /// 处理 UIGestureRecognizerStateChanged 分支
                case UIGestureRecognizerStateChanged:{
                    JobsLog(@"手势状态改变");
                }break;
                /// = UIGestureRecognizerStateRecognized
                case UIGestureRecognizerStateEnded:{
                    JobsLog(@"手势完成");
                }break;
                /// 处理 UIGestureRecognizerStateCancelled 分支
                case UIGestureRecognizerStateCancelled:{
                    JobsLog(@"手势取消，恢复至Possible状态");
                }break;
                /// 处理 UIGestureRecognizerStateFailed 分支
                case UIGestureRecognizerStateFailed:{
                    JobsLog(@"手势失败，恢复至Possible状态");
                }break;
                /// 未匹配已知分支时执行兜底处理
                default:
                    break;
            };return nil;
        });subView.longPressGR.enabled = YES;/// 必须在设置完Target和selector以后方可开启执行
    }
}
#pragma mark —— UITabBarDelegate
/// 监听TabBarItem点击事件
- (void)tabBar:(UITabBar *)tabBar
 didSelectItem:(UITabBarItem *)item {
    if ([tabBar.items containsObject:item]) {
        NSUInteger index = [self.tabBar.items indexOfObject:item];
        JobsLog(@"当前点击：%ld",(long)index);
        for (JobsTabBarItemConfig *tabBarItemConfig in JobsTabBarVCItemConfigs()) {
            if(tabBarItemConfig.isNeedjump){
                if (!self.forcedLoginIndex(index)) {
                    /// 不需要进行强制登录的时候，才重新赋值刷新self.selectedIndex
                    self.bySelectedIndex(index);
                }
            }
        }
        // Lottie 动画
        if (self.judgeLottieWithIndex(self.selectedIndex)) self.tabBar.animationLottieImageBy(index);
        // 震动反馈
        if (self.isFeedbackGenerator) NSObject.feedbackGenerator(nil);
        // 点击声音
        if (self.isPlaySound) self.playSoundWithFileName(@"Sound.wav");
        // 重力弹跳动画效果
        if (self.isShakerAnimation) [item.badgeView shakerAnimationWithDuration:2 height:20];
        // 点击增加标数
        if (self.isOpenPPBadge) [item pp_increase];
        // 图片从小放大
        if (self.isAnimationAlert) self.UITabBarButtonMutArr[index].图片从小放大();
    }
}
#pragma mark —— UITabBarControllerDelegate
/**
 【点击TabBarItem进行切换】return YES可以切换 | return NO 不可切换
 
 【调用先后次序】
    ①- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item；
 
    ②- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController；
 
 📢【注意】在①中，如果对self.selectedIndex进行修改，那么在②中，设置返回值为NO无效
 */
- (BOOL)tabBarController:(UITabBarController *)tabBarController
shouldSelectViewController:(UIViewController *)viewController {
    NSInteger index = [JobsTabBarVCViewControllers() indexOfObject:viewController];
    if ([viewController isKindOfClass:UIViewController.class] &&
        self.judgeLottieWithIndex(index)) {
        viewController.lottieImagePlay();
    }
    if (self.retBoolByUIntegerBlock) A = self.retBoolByUIntegerBlock(index);
    return self.forcedLoginIndex(index) ? (A && JobsTabBarVCIsLogin(self)) : A;
}

- (id<UIViewControllerAnimatedTransitioning>)tabBarController:(UITabBarController *)tabBarController
           animationControllerForTransitionFromViewController:(UIViewController *)fromVC
                                             toViewController:(UIViewController *)toVC{
    // 打开注释 可以屏蔽点击item时的动画效果
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        NSArray *viewControllers = tabBarController.viewControllers;
        return [TransitionAnimation.alloc initWithTargetEdge:
                [viewControllers indexOfObject:toVC] > [viewControllers indexOfObject:fromVC] ? UIRectEdgeLeft : UIRectEdgeRight];
    }else return nil;
}

- (void)tabBarController:(UITabBarController *)tabBarController
 didSelectViewController:(UIViewController *)viewController{
    JobsLog(@"");
}

- (id<UIViewControllerInteractiveTransitioning>)tabBarController:(UITabBarController *)tabBarController
                     interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController{
    if (self.view.panGR.state == UIGestureRecognizerStateBegan ||
        self.view.panGR.state == UIGestureRecognizerStateChanged) {
        return [TransitionController.alloc initWithGestureRecognizer:self.view.panGR];
    }else return nil;
}
#pragma mark —— lazyLoad
/// AppToolsProtocol
@synthesize viewModel = _viewModel;
-(UIViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = jobsMakeViewModel(^(__kindof UIViewModel * _Nullable data) {
            data.byBgCor(JobsWhiteColor)
    //        data.bgImage = isiPhoneX_series() ? @"底部导航栏背景(刘海屏.img") : @"底部导航栏背景(非刘海屏.img");
            .byIsTranslucent(NO)
                .byOffsetHeight(JobsWidth(5));
        });
    };return _viewModel;
}
@synthesize myTabBar = _myTabBar;
-(void)setMyTabBar:(JobsTabBar *)myTabBar{
    _myTabBar = myTabBar;
}

-(JobsTabBar *)myTabBar{
    if (!_myTabBar) {
        @jobs_weakify(self)
        _myTabBar = jobsMakeTabBar(^(JobsTabBar * _Nullable tabBar) {
            @jobs_strongify(self)
            tabBar
                .byAlignmentType(ImageTopTitleBottom)
                .jobsRichViewByModel(self.viewModel);
            self.jobsKVC(@"tabBar",tabBar);/// ❤️KVC 进行替换❤️
        });
    };return _myTabBar;
}

-(NSMutableArray <UIViewModel *>*)pullListAutoSizeViewMutArr{
    if (!_pullListAutoSizeViewMutArr) {
        _pullListAutoSizeViewMutArr = jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
            data.add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.byImage(@"".jobsTr().img);
                viewModel.textModel.byText(@"111".jobsTr());
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.byImage(@"".jobsTr().img);
                viewModel.textModel.byText(@"222".jobsTr());
            }))
            .add(jobsMakeViewModel(^(__kindof UIViewModel * _Nullable viewModel) {
                viewModel.byImage(@"".jobsTr().img);
                viewModel.textModel.byText(@"333".jobsTr());
            }));
        });
    };return _pullListAutoSizeViewMutArr;
}

-(NSMutableArray <UIView *>*)UITabBarButtonMutArr{
    if (!_UITabBarButtonMutArr) {
        _UITabBarButtonMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<UIView *> * _Nullable arr) {
        });
    };return _UITabBarButtonMutArr;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsTabBarVC
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byAnimationAlert{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsAnimationAlert:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byFeedbackGenerator{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsFeedbackGenerator:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byOpenPPBadge{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsOpenPPBadge:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byOpenScrollTabbar{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsOpenScrollTabbar:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byPlaySound{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsPlaySound:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByJobsTabBarBlock _Nonnull)byMyTabBar{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(JobsTabBar * _Nullable data){
        @jobs_strongify(self)
        [self setMyTabBar:data];
        return self;
    };
}
-(JobsRetJobsTabBarVCByBOOLBlock _Nonnull)byHiddenNavigationBar{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setIsHiddenNavigationBar:data];
        return self;
    };
}
-(JobsRetJobsTabBarVCByNSArrayUIViewControllerBlock _Nonnull)byViewControllers{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(NSArray<__kindof UIViewController *> * _Nullable data){
        @jobs_strongify(self)
        [self setViewControllers:data];
        return self;
    };
}

-(JobsRetJobsTabBarVCByNSUIntegerBlock _Nonnull)bySelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JobsTabBarVC * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setSelectedIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsTabBarVC
@end
