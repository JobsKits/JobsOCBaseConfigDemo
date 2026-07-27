//
//  UINavigationController+SafeTransition.m
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UINavigationController+SafeTransition.h"

static BOOL JobsIsSystemNavigationBarDemo(UIViewController *viewController) {
    return [NSStringFromClass(viewController.class) isEqualToString:@"JobsNavigationDemoVC"];
}

static void JobsInstallNavigationDefaults(UINavigationController *navigationController,
                                          UIViewController *viewController) {
    if ([viewController isKindOfClass:UIAlertController.class]) return;
    BOOL isNavigationChild = navigationController &&
        [navigationController.viewControllers containsObject:viewController] &&
        viewController.navigationController == navigationController &&
        navigationController.viewControllers.firstObject != viewController;
    BOOL isPresentedPage = viewController.presentingViewController ||
        (navigationController.viewControllers.firstObject == viewController &&
         navigationController.presentingViewController);
    if (!isNavigationChild && !isPresentedPage) return;
    if (JobsIsSystemNavigationBarDemo(viewController)) {
        [navigationController setNavigationBarHidden:NO animated:NO];
        navigationController.navigationBar.hidden = NO;
        [viewController jobs_ensureDemoThemeButton];
        return;
    }
    if (!viewController.title.length) viewController.title = NSStringFromClass(viewController.class);
    if (!viewController.gk_navTitle.length && !viewController.gk_navTitleView) {
        if (viewController.navigationItem.titleView) {
            viewController.gk_navTitleView = viewController.navigationItem.titleView;
        }else viewController.gk_navTitle = viewController.title;
    }
    if (!viewController.gk_navRightBarButtonItem && !viewController.gk_navRightBarButtonItems.count) {
        if (viewController.navigationItem.rightBarButtonItems.count) {
            viewController.gk_navRightBarButtonItems = viewController.navigationItem.rightBarButtonItems;
        }else if (viewController.navigationItem.rightBarButtonItem) {
            viewController.gk_navRightBarButtonItem = viewController.navigationItem.rightBarButtonItem;
        }
    }
    [viewController jobs_ensureDemoThemeButton];
    if (!viewController.gk_navLeftBarButtonItem && !viewController.gk_navLeftBarButtonItems.count) {
        viewController.gk_navLeftBarButtonItem = viewController.backBtnCategoryItem;
    }
    UIView *navigationBar = viewController.gk_navigationBar;
    navigationBar.hidden = NO;
    navigationBar.alpha = 1;
    viewController.gk_navBarAlpha = 1;
    [navigationController setNavigationBarHidden:YES animated:NO];
    [viewController.view bringSubviewToFront:navigationBar];
}

@interface UINavigationController ()

@end

@implementation UINavigationController (SafeTransition)
+ (void)load {
    TYFFSwizzleMethod(self.class,
                      @selector(pushViewController:animated:),
                      self.class,
                      @selector(safePushViewController:animated:));
    TYFFSwizzleMethod(self.class,
                      @selector(setViewControllers:animated:),
                      self.class,
                      @selector(safeSetViewControllers:animated:));
    TYFFSwizzleMethod(self.class,
                      @selector(popViewControllerAnimated:),
                      self.class,
                      @selector(safePopViewControllerAnimated:));
    TYFFSwizzleMethod(self.class,
                      @selector(popToRootViewControllerAnimated:),
                      self.class,
                      @selector(safePopToRootViewControllerAnimated:));
    TYFFSwizzleMethod(self.class,
                      @selector(popToViewController:animated:),
                      self.class,
                      @selector(safePopToViewController:animated:));
}
#pragma mark —— setter & getter
JobsKey(_viewTransitionInProgress)
@dynamic viewTransitionInProgress;
- (void)setViewTransitionInProgress:(BOOL)property {
    NSNumber *number = [NSNumber numberWithBool:property];
    Jobs_setAssociatedRETAIN(_viewTransitionInProgress, number)
}

- (BOOL)viewTransitionInProgress {
    NSNumber *number = Jobs_getAssociatedObject(_viewTransitionInProgress);
    return number.boolValue;
}
#pragma mark —— Intercept Pop, Push, PopToRootVC
- (NSArray *)safePopToRootViewControllerAnimated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    if (animated) self.viewTransitionInProgress = YES;
    NSArray *viewControllers = [self safePopToRootViewControllerAnimated:animated];
    if (viewControllers.count == 0) {
        self.viewTransitionInProgress = NO;
    };return viewControllers;
}

- (NSArray *)safePopToViewController:(UIViewController *)viewController
                            animated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    if (animated) self.viewTransitionInProgress = YES;
    NSArray *viewControllers = [self safePopToViewController:viewController animated:animated];
    if (viewControllers.count == 0) {
        self.viewTransitionInProgress = NO;
    };return viewControllers;
}

- (UIViewController *)safePopViewControllerAnimated:(BOOL)animated {
    if (self.viewTransitionInProgress) return nil;
    if (animated) self.viewTransitionInProgress = YES;
    UIViewController *viewController = [self safePopViewControllerAnimated:animated];
    if (!viewController) self.viewTransitionInProgress = NO;
    return viewController;
}

- (void)safePushViewController:(UIViewController *)viewController
                      animated:(BOOL)animated {
    // 如果当前controller已经在栈里了，则不要继续push
    if(self.childViewControllers.containsObject(viewController)) return;
    if (self.viewTransitionInProgress == NO) {
        [self safePushViewController:viewController animated:animated];
        JobsInstallNavigationDefaults(self, viewController);
        if (animated) self.viewTransitionInProgress = YES;
    }
}

- (void)safeSetViewControllers:(NSArray<__kindof UIViewController *> *)viewControllers
                      animated:(BOOL)animated {
    [self safeSetViewControllers:viewControllers animated:animated];
    [viewControllers enumerateObjectsUsingBlock:^(__kindof UIViewController * _Nonnull viewController,
                                                   NSUInteger idx,
                                                   BOOL * _Nonnull stop) {
        if (idx > 0) JobsInstallNavigationDefaults(self, viewController);
    }];
}

- (void)ty_popToRootViewControllerBySetControllersAnimated:(BOOL)animated {
    if (!animated) {
        NSArray *list = @[self.childViewControllers.firstObject];
        [self setViewControllers:list animated:animated];
    }else [self ty_popToRootViewControllerBySetControllersAnimated:animated];
}

@end

@implementation UIViewController (SafeTransitionLock)
+ (void)load {
    TYFFSwizzleMethod(self.class,
                      @selector(viewDidAppear:),
                      self.class,
                      @selector(safeViewDidAppear:));
}

- (void)safeViewDidAppear:(BOOL)animated {
    self.navigationController.viewTransitionInProgress = NO;
    [self safeViewDidAppear:animated];
    JobsInstallNavigationDefaults(self.navigationController, self);
}

@end
