//
//  UINavigationController+FDFullscreenPopGesture.m
//  FDFullscreenPopGesture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "UINavigationController+FDFullscreenPopGesture.h"

#import "NSObject+Extra.h"
#import "UIViewController+BaseNavigationBar.h"

@interface UIGestureRecognizer (JobsFDFullscreenPopGestureDSL)
-(JobsRetIDByIDBlock _Nonnull)byDelegate;
-(JobsRetIDByBOOLBlock _Nonnull)byEnabled;
-(JobsRetIDByUIntegerBlock _Nonnull)byMaximumNumberOfTouches;
@end

@implementation UIGestureRecognizer (JobsFDFullscreenPopGestureDSL)
-(JobsRetIDByUIntegerBlock _Nonnull)byMaximumNumberOfTouches{
    @jobs_weakify(self)
    return ^id _Nullable(NSUInteger data){
        @jobs_strongify(self)
        if (!self) return nil;
        if ([self isKindOfClass:UIPanGestureRecognizer.class]) {
            ((UIPanGestureRecognizer *)self).maximumNumberOfTouches = data;
        };return self;
    };
}
@end

@interface _FDFullscreenPopGestureRecognizerDelegate : NSObject<UIGestureRecognizerDelegate>

Prop_weak()UINavigationController *navigationController;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN _FDFullscreenPopGestureRecognizerDelegate
-(JobsRetFDFullscreenPopGestureRecognizerDelegateByUINavigationControllerBlock _Nonnull)byNavigationController;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END _FDFullscreenPopGestureRecognizerDelegate
@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN _FDFullscreenPopGestureRecognizerDelegate
@interface _FDFullscreenPopGestureRecognizerDelegate (JobsPropertyDSLSetterAutogen_322b86f298)
-(void)setNavigationController:(UINavigationController * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END _FDFullscreenPopGestureRecognizerDelegate

@implementation _FDFullscreenPopGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIPanGestureRecognizer *)gestureRecognizer{
    JobsRetBOOLByUIPanGestureRecognizerBlock action = ((JobsRetBOOLByUIPanGestureRecognizerBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(_FDFullscreenPopGestureRecognizerDelegate.class, @selector(jobsGestureRecognizerShouldBegin)))(self, @selector(jobsGestureRecognizerShouldBegin));
    return action ? action(gestureRecognizer) : NO;
}

-(JobsRetBOOLByUIPanGestureRecognizerBlock _Nonnull)jobsGestureRecognizerShouldBegin{
    @jobs_weakify(self)
    return ^BOOL(UIPanGestureRecognizer * gestureRecognizer){
        @jobs_strongify(self)
        if (!self) return NO;
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
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN _FDFullscreenPopGestureRecognizerDelegate
-(JobsRetFDFullscreenPopGestureRecognizerDelegateByUINavigationControllerBlock _Nonnull)byNavigationController{
    @jobs_weakify(self)
    return ^__kindof _FDFullscreenPopGestureRecognizerDelegate * _Nullable(UINavigationController * _Nullable data){
        @jobs_strongify(self)
        [self setNavigationController:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END _FDFullscreenPopGestureRecognizerDelegate
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsFd_viewWillAppear)))(self, @selector(jobsFd_viewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsFd_viewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        // Forward to primary implementation.
        [self fd_viewWillAppear:animated];
        if (self.fd_willAppearInjectBlock) self.fd_willAppearInjectBlock(self, animated);
    };
}

- (void)fd_viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UIViewController.class, @selector(jobsFd_viewWillDisappear)))(self, @selector(jobsFd_viewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsFd_viewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        // Forward to primary implementation.
        [self fd_viewWillDisappear:animated];
    };
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

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UINavigationController
@interface UINavigationController (JobsPropertyDSLSetterAutogen_322b86f298)
-(void)setFd_viewControllerBasedNavigationBarAppearanceEnabled:(BOOL)data;
-(void)setModalPresentationStyle:(UIModalPresentationStyle)data;
-(void)setViewTransitionInProgress:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UINavigationController

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
    UIGestureRecognizer *interactivePopGestureRecognizer = self.interactivePopGestureRecognizer;
    UIView *interactivePopGestureHostView = interactivePopGestureRecognizer.view;
    if (interactivePopGestureRecognizer &&
        interactivePopGestureHostView &&
        ![interactivePopGestureHostView.gestureRecognizers containsObject:self.fd_fullscreenPopGestureRecognizer]) {
        // Add our own gesture recognizer to where the onboard screen edge pan gesture recognizer is attached to.
        [interactivePopGestureHostView addGestureRecognizer:self.fd_fullscreenPopGestureRecognizer];
        // Forward the gesture events to the private handler of the onboard gesture recognizer.
        NSArray *internalTargets = [interactivePopGestureRecognizer valueForKey:@"targets"];
        id internalTarget = [internalTargets.firstObject valueForKey:@"target"];
        SEL internalAction = NSSelectorFromString(@"handleNavigationTransition:");
        self.fd_fullscreenPopGestureRecognizer.byDelegate(self.fd_popGestureRecognizerDelegate());
        [self.fd_fullscreenPopGestureRecognizer addTarget:internalTarget
                                                   action:internalAction];
        // Disable the onboard gesture recognizer.
        interactivePopGestureRecognizer.byEnabled(NO);
    }
    // Handle perferred navigation bar appearance.
    self.fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded(viewController);
    // Forward to primary implementation.
    if (![self.viewControllers containsObject:viewController]) {
        [self fd_pushViewController:viewController animated:animated];
    }
}

-(jobsByVCBlock _Nonnull)fd_setupViewControllerBasedNavigationBarAppearanceIfNeeded{
    @jobs_weakify(self)
    return ^(UIViewController * appearingViewController){
        @jobs_strongify(self)
        if (!self) return;
        if (!self.fd_viewControllerBasedNavigationBarAppearanceEnabled) return;
        @jobs_weakify(self)
        _FDViewControllerWillAppearInjectBlock block = ^(UIViewController *viewController,
                                                         BOOL animated) {
            @jobs_strongify(self)
            [self setNavigationBarHidden:viewController.isHiddenNavigationBar animated:animated];
        };
        // Setup will appear inject block to appearing view controller.
        // Setup disappearing view controller as well, because not every view controller is added into
        // stack by pushing, maybe by "-setViewControllers:".
        appearingViewController.byFd_willAppearInjectBlock(block);
        UIViewController *disappearingViewController = self.viewControllers.lastObject;
        if (disappearingViewController && !disappearingViewController.fd_willAppearInjectBlock) {
            disappearingViewController.byFd_willAppearInjectBlock(block);
        }
    };
}

JobsKey(_fd_popGestureRecognizerDelegate)
- (JobsRetFDFullscreenPopGestureRecognizerDelegateByVoidBlock _Nonnull)fd_popGestureRecognizerDelegate{
    @jobs_weakify(self)
    return ^_FDFullscreenPopGestureRecognizerDelegate *{
        @jobs_strongify(self)
        if (!self) return nil;
        _FDFullscreenPopGestureRecognizerDelegate *delegate = Jobs_getAssociatedObject(_fd_popGestureRecognizerDelegate);
        if (!delegate) {
            delegate = _FDFullscreenPopGestureRecognizerDelegate.new;
            delegate.byNavigationController(self);
            Jobs_setAssociatedRETAIN_NONATOMIC(_fd_popGestureRecognizerDelegate, delegate)
        };return delegate;
    };
}

JobsKey(_fd_viewControllerBasedNavigationBarAppearanceEnabled)
- (BOOL)fd_viewControllerBasedNavigationBarAppearanceEnabled{
    NSNumber *number = Jobs_getAssociatedObject(_fd_viewControllerBasedNavigationBarAppearanceEnabled);
    if (number) return number.boolValue;
    self.byFd_viewControllerBasedNavigationBarAppearanceEnabled(YES);
    return YES;
}

- (void)setFd_viewControllerBasedNavigationBarAppearanceEnabled:(BOOL)enabled{
    Jobs_setAssociatedRETAIN_NONATOMIC(_fd_viewControllerBasedNavigationBarAppearanceEnabled, @(enabled))
}

PROP_STRONG_OBJECT_LAZY(UIPanGestureRecognizer,
                        fd_fullscreenPopGestureRecognizer,
                        Fd_fullscreenPopGestureRecognizer,
                        {
                            obj.byMaximumNumberOfTouches(1);
                        })

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UINavigationController
-(JobsRetUINavigationControllerByBOOLBlock _Nonnull)byFd_viewControllerBasedNavigationBarAppearanceEnabled{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setFd_viewControllerBasedNavigationBarAppearanceEnabled:data];
        return self;
    };
}

-(JobsRetUINavigationControllerByBOOLBlock _Nonnull)byViewTransitionInProgress{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setViewTransitionInProgress:data];
        return self;
    };
}
-(JobsRetUINavigationControllerByUIModalPresentationStyleBlock _Nonnull)byModalPresentationStyle{
    @jobs_weakify(self)
    return ^__kindof UINavigationController * _Nullable(UIModalPresentationStyle data){
        @jobs_strongify(self)
        [self setModalPresentationStyle:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UINavigationController
@end

@implementation UIViewController (FDFullscreenPopGesture)
/// BOOL —— 使用 PROP_BOOL
PROP_BOOL(fd_interactivePopDisabled, Fd_interactivePopDisabled)
/// CGFloat —— 使用 PROP_CGFloat
PROP_CGFloat(fd_interactivePopMaxAllowedInitialDistanceToLeftEdge,
             Fd_interactivePopMaxAllowedInitialDistanceToLeftEdge)

@end
