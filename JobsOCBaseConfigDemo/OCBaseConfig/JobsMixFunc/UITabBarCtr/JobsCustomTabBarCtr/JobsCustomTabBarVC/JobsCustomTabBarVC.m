//
//  JobsCustomTabBarVC.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsCustomTabBarVC.h"

static NSArray<__kindof UIViewController *> *JobsCustomTabBarVCViewControllers(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (!appDelegateClass) return @[];
    @try {
        id value = [appDelegateClass valueForKey:@"viewCtrlMutArr"];
        return [value isKindOfClass:NSArray.class] ? value : @[];
    } @catch (__unused NSException *exception) {
        return @[];
    }
}

static NSArray<__kindof UIButton *> *JobsCustomTabBarVCButtons(void) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    if (!appDelegateClass) return @[];
    @try {
        id value = [appDelegateClass valueForKey:@"tabBarItemMutArr"];
        return [value isKindOfClass:NSArray.class] ? value : @[];
    } @catch (__unused NSException *exception) {
        return @[];
    }
}

static void JobsCustomTabBarVCBackTo(NSUInteger index) {
    Class appDelegateClass = NSClassFromString(@"AppDelegate");
    NSArray<__kindof UIButton *> *buttons = JobsCustomTabBarVCButtons();
    SEL selector = @selector(button:index:);
    if (!appDelegateClass || index >= buttons.count || ![appDelegateClass respondsToSelector:selector]) return;
    __kindof UIButton *button = buttons[index];
    NSMethodSignature *signature = [appDelegateClass methodSignatureForSelector:selector];
    if (!signature) return;
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = appDelegateClass;
    invocation.selector = selector;
    [invocation setArgument:&button atIndex:2];
    [invocation setArgument:&index atIndex:3];
    [invocation invoke];
}

@interface JobsCustomTabBarVC ()

Prop_strong()JobsCustomTabBar *customTabBar;

@end

@implementation JobsCustomTabBarVC
-(void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}
static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
static dispatch_once_t JobsCustomTabBarVCOnceToken;
+(instancetype)sharedManager{
    dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
        if(!JobsCustomTabBarVCInstance){
            JobsCustomTabBarVCInstance = [super allocWithZone:NULL].init;
        }
    });return JobsCustomTabBarVCInstance;
}
/// 单例的销毁
+(void)destroyInstance{
    JobsCustomTabBarVCOnceToken = 0;
    JobsCustomTabBarVCInstance = nil;
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return [self sharedManager];
}
/// 防止外部调用copy
-(instancetype)copyWithZone:(NSZone *)zone{
    return self;
}
/// 防止外部调用mutableCopy
-(instancetype)mutableCopyWithZone:(NSZone *)zone{
    return self;
}

-(void)loadView{
    [super loadView];
    self.viewControllers = JobsCustomTabBarVCViewControllers();
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabBar.byHidden(YES);
    self.delegate = self;
//    self.view.byBgColor(JobsGreenColor);
    self.customTabBar.byAlpha(1);
    extern NSUInteger DefaultIndex;
    self.selectedIndex = DefaultIndex;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    JobsCustomTabBarVCBackTo(self.selectedIndex);
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.resetSubVCViewHeight();
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
#pragma mark —— UITabBarControllerDelegate
-(void)tabBarController:(UITabBarController *)tabBarController
didSelectViewController:(UIViewController *)viewController{
    self.resetSubVCViewHeight();
}
#pragma mark —— 一些公有方法
-(jobsByNSUIntegerBlock _Nonnull)customSelectIndex{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        self.selectedIndex = index;
        /// TODO 系统的 UITabBarController 的切换方法没有暴露出来，但是实际情况是最好监控这个方法的运行机制，所以期望有一个高仿系统 self.selectedIndex 切换的逻辑
        JobsLog(@"");
    };
}
#pragma mark —— LazyLoad
-(JobsCustomTabBar *)customTabBar{
    if(!_customTabBar){
        _customTabBar = jobsMakeCustomTabBar(^(__kindof JobsCustomTabBar * _Nullable customTabBar) {
            customTabBar.byBgColor(JobsClearColor);
            customTabBar.configMasonryBy(self.view);
        });
    };return _customTabBar;
}

@end
