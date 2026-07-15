//
//  UINavigationController+FDFullscreenPopGesture.m
//  FDFullscreenPopGesture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UINavigationController+FDFullscreenPopGesture.h"
#import "NSObject+Extra.h"
#import "UIViewController+BaseNavigationBar.h"

@interface _FDFullscreenPopGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate>

Prop_weak()UINavigationController *navigationController;

@end

@implementation _FDFullscreenPopGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    // Ignore when no view controller is pushed into the navigation stack.
    if (self.navigationController.viewControllers.count <= 1) return NO;
    // Ignore when the active view controller doesn't allow interactive pop.
    UIViewController *topViewController = self.navigationController.viewControllers.lastObject;
    if (topViewController.fd_interactivePopDisabled) return NO;
    // Ignore when the beginning location is beyond max allowed initial distance to left edge.
    CGPoint beginningLocation = [gestureRecognizer locationInView:gestureRecognizer.view];
    CGFloat maxAllowedInitialDistance = topViewController.fd_interactivePopMaxAllowedInitialDistanceToLeftEdge;
    if (maxAllowedInitialDistance > 0 && beginningLocation.x > maxAllowedInitialDistance) return NO;
    // Ignore pan gesture when the navigation controller is currently in transition.
    if ([self.navigationController.valueForKey(@"_isTransitioning") boolValue]) return NO;
    // Prevent calling the handler when the gesture begins in an opposite direction.
    CGPoint translation = [gestureRecognizer translationInView:gestureRecognizer.view];
    BOOL isLeftToRight = [UIApplication sharedApplication].userInterfaceLayoutDirection == UIUserInterfaceLayoutDirectionLeftToRight;
    CGFloat multiplier = isLeftToRight ? 1 : - 1;
    return (translation.x * multiplier) > 0;
}

@end

typedef void (^_FDViewControllerWillAppearInjectBlock)(UIViewController *viewController, BOOL animated);
@interface UIViewController (FDFullscreenPopGesturePrivate)

Prop_copy()_FDViewControllerWillAppearInjectBlock fd_willAppearInjectBlock;

@end

@implementation UIViewController (FDFullscreenPopGesturePrivate)
+ (void)load{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method viewWillAppear_originalMethod = class_getInstanceMethod(self, @selector(viewWillAppear:));
        Method viewWillAppear_swizzledMethod = class_getInstanceMethod(self, @selector(fd_viewWillAppear:));
        method_exchangeImplementations(viewWillAppear_originalMethod, viewWillAppear_swizzledMethod);
        Method viewWillDisappear_originalMethod = class_getInstanceMethod(self, @selector(viewWillDisappear:));
        Method viewWillDisappear_swizzledMethod = class_getInstanceMethod(self, @selector(fd_viewWillDisappear:));
        method_exchangeImplementations(viewWillDisappear_originalMethod, viewWillDisappear_swizzledMethod);
    });
}

- (void)fd_viewWillAppear:(BOOL)animated{
    // Forward to primary implementation.
    [self fd_viewWillAppear:animated];
    if (self.fd_willAppearInjectBlock) self.fd_willAppearInjectBlock(self, animated);
}

- (void)fd_viewWillDisappear:(BOOL)animated{
    // Forward to primary implementation.
    [self fd_viewWillDisappear:animated];
}

JobsKey(_fd_willAppearInjectBlock)
@dynamic fd_willAppearInjectBlock;
- (_FDViewControllerWillAppearInjectBlock)fd_willAppearInjectBlock{
    return Jobs_getAssociatedObject(_fd_willAppearInjectBlock);
}

- (void)setFd_willAppearInjectBlock:(_FDViewControllerWillAppearInjectBlock)block{
    Jobs_setAssociatedCOPY_NONATOMIC(_fd_willAppearInjectBlock, block)
}

@end

@implementation UINavigationController (FDFullscreenPopGesture)
+ (void)load{
    // Inject "-pushViewController:animated:"
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = self.class;
        SEL originalSelector = @selector(pushViewController:animated:);
        SEL swizzledSelector = @selector(fd_pushViewController:animated:);
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        BOOL success = class_addMethod(class,
                                       originalSelector,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod));
        if (success) {
            class_replaceMethod(class,
                                swizzledSelector,
                                method_getImplementation(originalMethod),
                                method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
}

- (void)fd_pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (![self.interactivePopGestureRecognizer.view.gestureRecognizers containsObject:self.fd_fullscreenPopGestureRecognizer]) {
        // Add our own gesture recognizer to where the onboard screen edge pan gesture recognizer is attached to.
        [self.interactivePopGestureRecognizer.view addGestureRecognizer:self.fd_fullscreenPopGestureRecognizer];
        // Forward the gesture events to the private handler of the onboard gesture recognizer.
        NSArray *internalTargets = [self.interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        self.fd_fullscreenPopGestureRecognizer.delegate = self.fd_popGestureRecognizerDelegate;
        [self.fd_fullscreenPopGestureRecognizer addTarget:internalTarget
                                                   action:internalAction];
        // Disable the onboard gesture recognizer.
        self.interactivePopGestureRecognizer.enabled = NO;
    }
    // Handle perferred navigation bar appearance.
    [self fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded:viewController];
    // Forward to primary implementation.
    if (![self.viewControllers containsObject:viewController]) {
        [self fd_pushViewController:viewController animated:animated];
    }
}

- (void)fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded:(UIViewController *)appearingViewController{
    if (!self.fd_viewControllerBasedNavigationBarAppearanceEnabled) return;
    __weak typeof(self) weakSelf = self;
    _FDViewControllerWillAppearInjectBlock block = ^(UIViewController *viewController,
                                                     BOOL animated) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf setNavigationBarHidden:viewController.isHiddenNavigationBar animated:animated];
    };
    // Setup will appear inject block to appearing view controller.
    // Setup disappearing view controller as well, because not every view controller is added into
    // stack by pushing, maybe by "-setViewControllers:".
    appearingViewController.fd_willAppearInjectBlock = block;
    UIViewController *disappearingViewController = self.viewControllers.lastObject;
    if (disappearingViewController && !disappearingViewController.fd_willAppearInjectBlock) {
        disappearingViewController.fd_willAppearInjectBlock = block;
    }
}

JobsKey(_fd_popGestureRecognizerDelegate)
- (_FDFullscreenPopGestureRecognizerDelegate *)fd_popGestureRecognizerDelegate{
    _FDFullscreenPopGestureRecognizerDelegate *delegate = Jobs_getAssociatedObject(_fd_popGestureRecognizerDelegate);
    if (!delegate) {
        delegate = _FDFullscreenPopGestureRecognizerDelegate.new;
        delegate.navigationController = self;
        Jobs_setAssociatedRETAIN_NONATOMIC(_fd_popGestureRecognizerDelegate, delegate)
    };return delegate;
}

JobsKey(_fd_viewControllerBasedNavigationBarAppearanceEnabled)
- (BOOL)fd_viewControllerBasedNavigationBarAppearanceEnabled{
    NSNumber *number = Jobs_getAssociatedObject(_fd_viewControllerBasedNavigationBarAppearanceEnabled);
    if (number) return number.boolValue;
    self.fd_viewControllerBasedNavigationBarAppearanceEnabled = YES;
    return YES;
}

- (void)setFd_viewControllerBasedNavigationBarAppearanceEnabled:(BOOL)enabled{
    Jobs_setAssociatedRETAIN_NONATOMIC(_fd_viewControllerBasedNavigationBarAppearanceEnabled, @(enabled))
}

PROP_STRONG_OBJECT_LAZY(UIPanGestureRecognizer,
                        fd_fullscreenPopGestureRecognizer,
                        Fd_fullscreenPopGestureRecognizer,
                        {
                            obj.maximumNumberOfTouches = 1;
                        })

@end

@implementation UIViewController (FDFullscreenPopGesture)
/// BOOL —— 使用 PROP_BOOL
PROP_BOOL(fd_interactivePopDisabled, Fd_interactivePopDisabled)
/// CGFloat —— 使用 PROP_CGFloat
PROP_CGFloat(fd_interactivePopMaxAllowedInitialDistanceToLeftEdge,
             Fd_interactivePopMaxAllowedInitialDistanceToLeftEdge)

@end
