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
    invocation.byTarget(appDelegateClass);
    invocation.bySelector(selector);
    [invocation setArgument:&button atIndex:2];
    [invocation setArgument:&index atIndex:3];
    [invocation invoke];
}

@interface JobsCustomTabBarVC ()

Prop_strong()JobsCustomTabBar *customTabBar;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsCustomTabBarVC
@interface JobsCustomTabBarVC (JobsPropertyDSLSetterAutogen_6ebacc2947)
-(void)setSelectedIndex:(NSUInteger)data;
-(void)setViewControllers:(NSArray<__kindof UIViewController *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsCustomTabBarVC

@implementation JobsCustomTabBarVC
-(JobsRetJobsCustomTabBarVCByDelegateBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarVC *_Nullable(id<UITabBarControllerDelegate> _Nullable delegate){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setDelegate:delegate];
        return self;
    };
}

-(void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}
static JobsCustomTabBarVC *JobsCustomTabBarVCInstance = nil;
static dispatch_once_t JobsCustomTabBarVCOnceToken;
+(instancetype)sharedManager{
    JobsRetIDByVoidBlock action = ((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCustomTabBarVC.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager));
    return action ? action() : nil;
}

+(JobsRetIDByVoidBlock _Nonnull)jobsSharedManager{
    return ^id{
        dispatch_once(&JobsCustomTabBarVCOnceToken, ^{
            if(!JobsCustomTabBarVCInstance){
                JobsCustomTabBarVCInstance = [super allocWithZone:NULL].init;
            }
        });return JobsCustomTabBarVCInstance;
    };
}
/// 单例的销毁
+(jobsByVoidBlock _Nonnull)destroyInstance{
    return ^{
        JobsCustomTabBarVCOnceToken = 0;
        JobsCustomTabBarVCInstance = nil;
    };
}
/// 防止外部使用 alloc/init 等创建新实例
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    return (((JobsRetIDByVoidBlock (*)(__typeof__(self), SEL))JobsBlockClassMethodIMP(JobsCustomTabBarVC.class, @selector(jobsSharedManager)))(self, @selector(jobsSharedManager)))();
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        self.byViewControllers(JobsCustomTabBarVCViewControllers());
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
            [super viewDidLoad];
            self.tabBar.byHidden(YES);
            self.byDelegate(self);
        //    self.view.byBgColor(JobsGreenColor);
            self.customTabBar.byAlpha(1);
            extern NSUInteger DefaultIndex;
            self.bySelectedIndex(DefaultIndex);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        JobsCustomTabBarVCBackTo(self.selectedIndex);
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.resetSubVCViewHeight();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsCustomTabBarVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
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
        self.bySelectedIndex(index);
        /// TODO 系统的 UITabBarController 的切换方法没有暴露出来，但是实际情况是最好监控这个方法的运行机制，所以期望有一个高仿系统 self.selectedIndex 切换的逻辑
        JobsLog(@"");
    };
}
#pragma mark —— LazyLoad
-(JobsCustomTabBar *)customTabBar{
    if(!_customTabBar){
        _customTabBar = jobsMakeCustomTabBar(^(__kindof JobsCustomTabBar * _Nullable customTabBar) {
            customTabBar
                .configMasonryBy(self.view)
                .byBgColor(JobsClearColor);
        });
    };return _customTabBar;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsCustomTabBarVC
-(JobsRetJobsCustomTabBarVCByNSArrayUIViewControllerBlock _Nonnull)byViewControllers{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarVC * _Nullable(NSArray<__kindof UIViewController *> * _Nullable data){
        @jobs_strongify(self)
        [self setViewControllers:data];
        return self;
    };
}

-(JobsRetJobsCustomTabBarVCByNSUIntegerBlock _Nonnull)bySelectedIndex{
    @jobs_weakify(self)
    return ^__kindof JobsCustomTabBarVC * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setSelectedIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsCustomTabBarVC
@end
