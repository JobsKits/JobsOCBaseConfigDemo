//
//  LZTabBarController.m
//  JobsOCTools
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LZTabBarController.h"

@interface LZTabBarController ()

Prop_strong()LZTabBar *customTabBar;
Prop_strong()LZTabBarConfig *config;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN LZTabBarController
@interface LZTabBarController (JobsPropertyDSLSetterAutogen_34a0a746f8)
-(void)setSelectedIndex:(NSUInteger)data;
-(void)setViewControllers:(NSArray<__kindof UIViewController *> * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END LZTabBarController

@implementation LZTabBarController
+(JobsRetIDByVoidBlock _Nonnull)defaultTabBarController{
    return ^id _Nonnull{
        return LZTabBarController.createTabBarController(nil);
    };
}

+(JobsRetIDBytabBarBlockBlock _Nonnull)createTabBarController{
    return ^id _Nonnull(tabBarBlock _Nullable block){
        static dispatch_once_t onceToken;
        static LZTabBarController *tabBar;
        dispatch_once(&onceToken, ^{
            tabBar = [LZTabBarController.alloc initWithBlock:block];
        });return tabBar;
    };
}

-(instancetype)initWithBlock:(tabBarBlock _Nullable)block{
    if (self = [super init]) {
        NSAssert(block, @"Param 'block' in zhe function, can not be nil");
        if (block) _config = block(jobsMakeLZTabBarConfig(^(__kindof LZTabBarConfig * _Nullable data) {
        }));
        NSAssert(_config.viewControllers, @"Param 'viewControllers' in the 'config', can not be nil");
        self.setupViewControllers();
        self.setupTabBar();
        _isAutoRotation = YES;
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarController.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarController.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarController.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        extern NSUInteger DefaultIndex;
        self.bySelectedIndex(DefaultIndex);
    };
}
#pragma mark —— 一些公有方法
/// 切换
-(jobsByNSUIntegerBlock _Nonnull)customSelectIndex{
    @jobs_weakify(self)
    return ^(NSUInteger index){
        @jobs_strongify(self)
        self.bySelectedIndex(index);
        /// TODO 系统的 UITabBarController 的切换方法没有暴露出来，但是实际情况是最好监控这个方法的运行机制，所以期望有一个高仿系统 self.selectedIndex 切换的逻辑
    };
}

-(jobsByBOOLBlock _Nonnull)hiddenTabBarWithAnimation{
    @jobs_weakify(self)
    return ^(BOOL isAnimation){
        @jobs_strongify(self)
        if (!self) return;
        if (isAnimation) {
            @jobs_weakify(self)
            [UIView animateWithDuration:0.2
                             animations:^{
                @jobs_strongify(self)
                self.customTabBar.byAlpha(0);
            }];
        } else {
            self.customTabBar.byAlpha(0);
        }
    };
}

-(jobsByBOOLBlock _Nonnull)showTabBarWithAnimation{
    @jobs_weakify(self)
    return ^(BOOL isAnimation){
        @jobs_strongify(self)
        if (!self) return;
        if (isAnimation) {
            @jobs_weakify(self)
            [UIView animateWithDuration:0.2 animations:^{
                @jobs_strongify(self)
                self.customTabBar.byAlpha(1.0);
            }];
        } else {
            self.customTabBar.byAlpha(1.0);
        }
    };
}

- (jobsByVoidBlock _Nonnull)setupViewControllers {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (_config.isNavigation) {
            NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:_config.viewControllers.count];
            for (UIViewController *vc in _config.viewControllers) {
                if (![vc isKindOfClass:UINavigationController.class]) {
                    vcs.add(vc.navCtrl());
                } else vcs.add(vc);
            }self.viewControllers = vcs.copy;
        } else {
            self.byViewControllers(_config.viewControllers.copy);
        }
    };
}

- (jobsByVoidBlock _Nonnull)setupTabBar {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        LZTabBarItemType type;
        if ((self.config.selectedImages.count > 0 || self.config.normalImages.count > 0) && self.config.titles.count > 0) {
            type = LZTabBarItemTypeDefault;
        } else if ((self.config.selectedImages.count > 0 || self.config.normalImages.count > 0) && self.config.titles.count <= 0) {
            type = LZTabBarItemTypeImage;
        } else if ((self.config.selectedImages.count <= 0 && self.config.normalImages.count <= 0) && self.config.titles.count > 0) {
            type = LZTabBarItemTypeText;
        } else {
            type = LZTabBarItemTypeDefault;
        }
        /// 隐藏掉系统的tabBar
        self.tabBar.byHidden(YES);
        self.customTabBar.items = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            @jobs_strongify(self)
            for (int i = 0; i < self.config.viewControllers.count; i++) {
                LZTabBarItem *item = jobsMakeLZTabBarItem(^(__kindof LZTabBarItem * _Nullable tabBarItem) {
                    @jobs_strongify(self)
                    tabBarItem.byType(type);
                    if (i == 0) {
                        tabBarItem.byIcon(self.config.selectedImages[i]);
                        if (self.config.titles.count > 0) {
                            tabBarItem.byTitleColor(self.config.selectedColor);
                        }
                    } else {
                        tabBarItem.byIcon(self.config.normalImages[i]);
                        if (self.config.titles.count > 0) {
                            tabBarItem.byTitleColor(self.config.normalColor);
                        }
                    }
                    if (i < self.config.titles.count) {
                        tabBarItem.byTitle(self.config.titles[i]);
                    }
                });
                arr.add(item);
                item.byTag(i);
            }
        }).copy;
        self.customTabBar.frame = CGRectMake(0,
                                             CGRectGetHeight(self.view.frame) - JobsTabBarHeightByBottomSafeArea(self),
                                             CGRectGetWidth(self.view.frame),
                                             JobsTabBarHeightByBottomSafeArea(self));
        self.view.addSubview(self.customTabBar);
    };
}
#pragma mark —— LZTabBarDelegate
-(void)tabBar:(LZTabBar *_Nonnull)tab
didSelectItem:(LZTabBarItem *_Nonnull)item
      atIndex:(NSInteger)index{
    NSMutableArray *items = jobsMakeMutArr(^(__kindof NSMutableArray<UIView *> * _Nullable arr) {
        for (UIView *view in tab.subviews) {
            if ([view isKindOfClass:LZTabBarItem.class]) {
                arr.add(view);
            }
        }
    });
    for (int i = 0; i < items.count; i++) {
        UIView *view = items[i];
        if ([view isKindOfClass:LZTabBarItem.class]) {
            LZTabBarItem *item = (LZTabBarItem *)view;
            item.byIcon(self.config.normalImages[i]);
            if (self.config.titles.count > 0) {
                item.byTitleColor(_config.normalColor);
            }
        }
    }
    item.byIcon(self.config.selectedImages[index]);
    if (self.config.titles.count > 0) {
        item.byTitleColor(self.config.selectedColor);
    }
//    self.selectedIndex = index;
    self.customSelectIndex(index);
    JobsLog(@"SSS = %lu",(unsigned long)self.selectedIndex);
}
/// 屏幕旋转时调整tabbar
- (void)viewWillTransitionToSize:(CGSize)size
       withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    self.customTabBar.frame = CGRectMake(0,
                                         size.height - JobsTabBarHeightByBottomSafeArea(self),
                                         size.width,
                                         JobsTabBarHeightByBottomSafeArea(self));
}
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-implementations"
/// 适配横屏
-(BOOL)shouldAutorotate{
    return (((JobsRetBOOLByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarController.class, @selector(jobsShouldAutorotate)))(self, @selector(jobsShouldAutorotate)))();
}

- (JobsRetBOOLByVoidBlock _Nonnull)jobsShouldAutorotate {
    @jobs_weakify(self)
    return ^BOOL{
        @jobs_strongify(self)
        if (!self) return (BOOL){0};
        return self.isAutoRotation;
    };
}
#pragma clang diagnostic pop
-(UIInterfaceOrientationMask)supportedInterfaceOrientations {
    JobsRetUIInterfaceOrientationMaskByVoidBlock action = ((JobsRetUIInterfaceOrientationMaskByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(LZTabBarController.class, @selector(jobsSupportedInterfaceOrientations)))(self, @selector(jobsSupportedInterfaceOrientations));
    return action ? action() : (UIInterfaceOrientationMask){0};
}

-(JobsRetUIInterfaceOrientationMaskByVoidBlock _Nonnull)jobsSupportedInterfaceOrientations{
    @jobs_weakify(self)
    return ^UIInterfaceOrientationMask{
        @jobs_strongify(self)
        if (!self) return (UIInterfaceOrientationMask){0};
        if (self.isAutoRotation) {
            return UIInterfaceOrientationMaskAllButUpsideDown;
        } else {
            return UIInterfaceOrientationMaskPortrait;
        }
    };
}

-(LZTabBar *)customTabBar {
    if (!_customTabBar) {
        @jobs_weakify(self)
        _customTabBar = jobsMakeLZTabBar(^(__kindof LZTabBar * _Nullable tabBar) {\
            @jobs_strongify(self)
            tabBar.byDelegate(self);
        });
    };return _customTabBar;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN LZTabBarController
-(JobsRetLZTabBarControllerByNSArrayUIViewControllerBlock _Nonnull)byViewControllers{
    @jobs_weakify(self)
    return ^__kindof LZTabBarController * _Nullable(NSArray<__kindof UIViewController *> * _Nullable data){
        @jobs_strongify(self)
        [self setViewControllers:data];
        return self;
    };
}

-(JobsRetLZTabBarControllerByNSUIntegerBlock _Nonnull)bySelectedIndex{
    @jobs_weakify(self)
    return ^__kindof LZTabBarController * _Nullable(NSUInteger data){
        @jobs_strongify(self)
        [self setSelectedIndex:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END LZTabBarController
@end
