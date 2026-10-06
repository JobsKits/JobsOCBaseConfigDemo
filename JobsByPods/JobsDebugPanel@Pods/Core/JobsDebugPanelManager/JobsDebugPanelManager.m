//
//  JobsDebugPanelManager.m
//  JobsDebugPanel
//
//  Created by Jobs on 2026年10月5日，星期一.
//

#import "JobsDebugPanelManager.h"
#import "JobsDebugOverlayWindow.h"
#import "JobsDebugPanelVC.h"
#import "JobsDebugPanelNavigationController.h"

#if DEBUG
NSNotificationName const JobsDebugEnvironmentDidChangeNotification = @"JobsDebugEnvironmentDidChangeNotification";
NSNotificationName const JobsDebugPanelVisibilityDidChangeNotification = @"JobsDebugPanelVisibilityDidChangeNotification";
static NSString *const JobsDebugEnvironmentDefaultsKey = @"com.jobs.debugPanel.environmentIdentifier";

@interface JobsDebugPanelManager ()

Prop_copy()NSString *defaultEnvironmentIdentifier;
Prop_copy(nullable)JobsDebugEnvironmentChangedHandler environmentChanged;
Prop_strong()NSMutableDictionary<NSString *,JobsDebugOverlayWindow *> *overlayWindows;
Prop_strong()NSMutableArray<id> *observers;
Prop_assign()BOOL started;
Prop_assign()BOOL hiddenForCurrentLaunch;

-(jobsByVoidBlock _Nonnull)refreshWindows;
-(JobsRetVCByVCBlock _Nonnull)openPanelFrom;

@end

@implementation JobsDebugPanelManager

+(JobsDebugPanelManager *)sharedPanel {
    static JobsDebugPanelManager *panel;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        panel = JobsDebugPanelManager.new;
    });
    return panel;
}

-(instancetype)init {
    if (self = [super init]) {
        _environments = @[];
        _actions = @[];
        _defaultEnvironmentIdentifier = @"";
        _overlayWindows = jobsMakeMutDic(nil);
        _observers = jobsMakeMutArr(nil);
    }
    return self;
}

-(JobsRetDebugPanelByEnvironmentsBlock _Nonnull)byEnvironments {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(NSArray<JobsDebugEnvironment *> *values) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        NSMutableArray<JobsDebugEnvironment *> *valid = jobsMakeMutArr(nil);
        NSMutableSet<NSString *> *identifiers = jobsMakeMutSet(nil);
        for (JobsDebugEnvironment *value in values) {
            NSURL *url = [NSURL URLWithString:value.baseURL];
            NSString *scheme = url.scheme.lowercaseString;
            if (!url.host.length || !([scheme isEqualToString:@"http"] || [scheme isEqualToString:@"https"])) {
                continue;
            }
            NSString *identifier = value.identifier.length ? value.identifier : value.baseURL;
            if ([identifiers containsObject:identifier]) {
                continue;
            }
            [identifiers addObject:identifier];
            [valid addObject:JobsDebugEnvironment.new
                .byIdentifier(identifier)
                .byTitle(value.title.length ? value.title : identifier)
                .byBaseURL(url.absoluteString)];
        }
        self->_environments = valid.copy;
        return self;
    };
}

-(JobsRetDebugPanelByStringBlock _Nonnull)byDefaultEnvironmentIdentifier {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(NSString *value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_defaultEnvironmentIdentifier = value.copy ?: @"";
        return self;
    };
}

-(JobsRetDebugPanelByChangedHandlerBlock _Nonnull)byEnvironmentChanged {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(JobsDebugEnvironmentChangedHandler value) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_environmentChanged = [value copy];
        return self;
    };
}

-(JobsRetDebugPanelByActionsBlock _Nonnull)byActions {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(NSArray<JobsDebugAction *> *values) {
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        NSMutableArray<JobsDebugAction *> *valid = jobsMakeMutArr(nil);
        for (JobsDebugAction *value in values) {
            if (value.title.length && value.handler) {
                [valid addObject:JobsDebugAction.new.byTitle(value.title).byImage(value.image).byAction(value.handler)];
            }
        }
        self->_actions = valid.copy;
        return self;
    };
}

-(JobsRetDebugPanelByVoidBlock _Nonnull)start {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *{
        @jobs_strongify(self)
        if (!self || self.started) {
            return self;
        }
        self->_started = YES;
        NSString *saved = [NSUserDefaults.standardUserDefaults stringForKey:JobsDebugEnvironmentDefaultsKey];
        JobsDebugEnvironment *selection = nil;
        for (JobsDebugEnvironment *value in self.environments) {
            if ([value.identifier isEqualToString:saved]) {
                selection = value;
                break;
            }
        }
        if (!selection) {
            for (JobsDebugEnvironment *value in self.environments) {
                if ([value.identifier isEqualToString:self.defaultEnvironmentIdentifier]) {
                    selection = value;
                    break;
                }
            }
        }
        self.selectEnvironment(selection ?: self.environments.firstObject);
        NSArray<NSNotificationName> *names = @[
            UIApplicationDidBecomeActiveNotification,
            UIWindowDidBecomeKeyNotification,
            UIWindowDidBecomeVisibleNotification
        ];
        if (@available(iOS 13.0, *)) {
            names = [names arrayByAddingObjectsFromArray:@[
                UISceneDidActivateNotification,
                UISceneWillDeactivateNotification,
                UISceneDidDisconnectNotification
            ]];
        }
        for (NSNotificationName name in names) {
            id observer = [NSNotificationCenter.defaultCenter addObserverForName:name object:nil queue:NSOperationQueue.mainQueue usingBlock:^(NSNotification *note) {
                @jobs_strongify(self)
                if (self && ![note.object isKindOfClass:JobsDebugOverlayWindow.class]) {
                    self.refreshWindows();
                }
            }];
            [self.observers addObject:observer];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            @jobs_strongify(self)
            if (self) {
                self.refreshWindows();
            }
        });
        return self;
    };
}

-(JobsRetDebugPanelByEnvironmentBlock _Nonnull)selectEnvironment {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(JobsDebugEnvironment *value) {
        @jobs_strongify(self)
        if (!self || !value) {
            return self;
        }
        if (![NSThread isMainThread]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self) {
                    self.selectEnvironment(value);
                }
            });
            return self;
        }
        JobsDebugEnvironment *selection = nil;
        for (JobsDebugEnvironment *configured in self.environments) {
            if ([configured.identifier isEqualToString:value.identifier]) {
                selection = configured;
                break;
            }
        }
        if (!selection) {
            return self;
        }
        self->_currentEnvironment = selection;
        [NSUserDefaults.standardUserDefaults setObject:selection.identifier forKey:JobsDebugEnvironmentDefaultsKey];
        if (self.environmentChanged) {
            self.environmentChanged(selection);
        }
        [NSNotificationCenter.defaultCenter postNotificationName:JobsDebugEnvironmentDidChangeNotification object:selection];
        return self;
    };
}

-(jobsByVoidBlock _Nonnull)refreshWindows {
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self || !self.started) {
            return;
        }
        NSMutableDictionary<NSString *,UIWindow *> *hosts = jobsMakeMutDic(nil);
        BOOL usesScenes = NO;
        if (@available(iOS 13.0, *)) {
            for (UIScene *scene in UIApplication.sharedApplication.connectedScenes) {
                if (![scene isKindOfClass:UIWindowScene.class]) {
                    continue;
                }
                usesScenes = YES;
                if (scene.activationState != UISceneActivationStateForegroundActive) {
                    continue;
                }
                for (UIWindow *window in ((UIWindowScene *)scene).windows) {
                    if ([window isKindOfClass:JobsDebugOverlayWindow.class] || window.hidden || !window.rootViewController || window.windowLevel != UIWindowLevelNormal) {
                        continue;
                    }
                    NSString *key = scene.session.persistentIdentifier;
                    if (!hosts[key] || window.isKeyWindow) {
                        hosts[key] = window;
                    }
                }
            }
        }
        if (!usesScenes && UIApplication.sharedApplication.applicationState == UIApplicationStateActive) {
            for (UIWindow *window in UIApplication.sharedApplication.windows) {
                if (![window isKindOfClass:JobsDebugOverlayWindow.class] && !window.hidden && window.rootViewController && window.windowLevel == UIWindowLevelNormal) {
                    hosts[@"legacy"] = window;
                    if (window.isKeyWindow) {
                        break;
                    }
                }
            }
        }
        for (NSString *key in self.overlayWindows.allKeys) {
            if (!hosts[key]) {
                self.overlayWindows[key].byHidden(YES);
                [self.overlayWindows removeObjectForKey:key];
            }
        }
        for (NSString *key in hosts) {
            JobsDebugOverlayWindow *previous = self.overlayWindows[key];
            if (previous && previous.hostWindow != hosts[key]) {
                previous.byHidden(YES);
                [self.overlayWindows removeObjectForKey:key];
            }
            if (!self.overlayWindows[key] && !self.hiddenForCurrentLaunch) {
                self.overlayWindows[key] = [[JobsDebugOverlayWindow alloc] initWithHostWindow:hosts[key] panel:self];
            }
            JobsDebugOverlayWindow *overlay = self.overlayWindows[key];
            if (overlay) {
                overlay.byHidden(self.hiddenForCurrentLaunch);
            }
        }
    };
}

-(JobsRetDebugPanelByVoidBlock _Nonnull)hideForCurrentLaunch {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *{
        @jobs_strongify(self)
        if (!self) {
            return nil;
        }
        self->_hiddenForCurrentLaunch = YES;
        for (JobsDebugOverlayWindow *window in self.overlayWindows.allValues) {
            window.byHidden(YES);
        }
        return self;
    };
}

-(JobsRetDebugPanelByViewControllerBlock _Nonnull)showFrom {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(UIViewController *source) {
        @jobs_strongify(self)
        if (!self || !source) {
            return self;
        }
        if (![NSThread isMainThread]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self) {
                    self.showFrom(source);
                }
            });
            return self;
        }
        if (self.openPanelFrom(source)) {
            return self;
        }
        UIViewController *visible = source;
        BOOL searching = YES;
        while (searching) {
            if (visible.presentedViewController && !visible.presentedViewController.isBeingDismissed) {
                visible = visible.presentedViewController;
            } else if ([visible isKindOfClass:UINavigationController.class]) {
                visible = ((UINavigationController *)visible).visibleViewController;
            } else if ([visible isKindOfClass:UITabBarController.class]) {
                visible = ((UITabBarController *)visible).selectedViewController;
            } else {
                searching = NO;
            }
            if (!visible) {
                return self;
            }
        }
        if ([visible isKindOfClass:JobsDebugPanelVC.class]) {
            return self;
        }
        if ([visible isKindOfClass:UIAlertController.class]) {
            UIViewController *presenter = visible.presentingViewController;
            [visible dismissViewControllerAnimated:YES completion:^{
                @jobs_strongify(self)
                if (self && presenter) {
                    self.showFrom(presenter);
                }
            }];
            return self;
        }
        UINavigationController *navigation = visible.navigationController;
        if (visible.transitionCoordinator || navigation.transitionCoordinator) {
            return self;
        }
        if (navigation) {
            [navigation pushViewController:[[JobsDebugPanelVC alloc] initWithPanel:self] animated:YES];
        } else {
            [visible presentViewController:[[JobsDebugPanelNavigationController alloc] initWithPanel:self] animated:YES completion:nil];
        }
        return self;
    };
}

// 查询实际导航栈，手动返回、动作页和多 Scene 不会留下另一份过期状态。
-(JobsRetVCByVCBlock _Nonnull)openPanelFrom {
    return ^__kindof UIViewController *(UIViewController *source) {
        UIViewController *root = source.viewIfLoaded.window.rootViewController ?: source.navigationController ?: source;
        NSMutableArray<UIViewController *> *pending = jobsMakeMutArr(nil);
        [pending addObject:root];
        while (pending.count) {
            UIViewController *controller = pending.firstObject;
            [pending removeObjectAtIndex:0];
            if ([controller isKindOfClass:JobsDebugPanelVC.class] && !controller.isBeingDismissed) {
                return controller;
            }
            if (controller.presentedViewController && !controller.presentedViewController.isBeingDismissed) {
                [pending addObject:controller.presentedViewController];
            }
            if ([controller isKindOfClass:UINavigationController.class]) {
                [pending addObjectsFromArray:((UINavigationController *)controller).viewControllers];
            } else if ([controller isKindOfClass:UITabBarController.class]) {
                UIViewController *selected = ((UITabBarController *)controller).selectedViewController;
                if (selected) {
                    [pending addObject:selected];
                }
            } else {
                [pending addObjectsFromArray:controller.childViewControllers];
            }
        }
        return nil;
    };
}

-(JobsRetBOOLByVCBlock _Nonnull)isShowingFrom {
    @jobs_weakify(self)
    return ^BOOL(UIViewController *source) {
        @jobs_strongify(self)
        return self && source && self.openPanelFrom(source) != nil;
    };
}

-(JobsRetDebugPanelByViewControllerBlock _Nonnull)toggleFrom {
    @jobs_weakify(self)
    return ^JobsDebugPanelManager *(UIViewController *source) {
        @jobs_strongify(self)
        if (!self || !source) {
            return self;
        }
        if (![NSThread isMainThread]) {
            dispatch_async(dispatch_get_main_queue(), ^{
                @jobs_strongify(self)
                if (self) {
                    self.toggleFrom(source);
                }
            });
            return self;
        }
        JobsDebugPanelVC *menu = self.openPanelFrom(source);
        if (!menu) {
            return self.showFrom(source);
        }
        UINavigationController *navigation = menu.navigationController;
        if (!navigation || navigation.transitionCoordinator || navigation.isBeingDismissed) {
            return self;
        }
        NSUInteger index = [navigation.viewControllers indexOfObject:menu];
        if (index == NSNotFound) {
            return self;
        }
        if (index == 0 && navigation.presentingViewController) {
            [navigation dismissViewControllerAnimated:YES completion:^{
                [NSNotificationCenter.defaultCenter postNotificationName:JobsDebugPanelVisibilityDidChangeNotification object:menu];
            }];
            return self;
        }
        if (index == 0) {
            return self;
        }
        UIViewController *destination = navigation.viewControllers[index - 1];
        // dismiss 会同时收起动作页叠上的 Alert / sheet，之后一次退回原业务页面。
        jobsByVoidBlock close = ^{
            [navigation popToViewController:destination animated:YES];
            // 菜单已被子页覆盖时不会再次收到消失回调，退栈后主动刷新入口动作。
            [NSNotificationCenter.defaultCenter postNotificationName:JobsDebugPanelVisibilityDidChangeNotification object:menu];
        };
        if (navigation.presentedViewController) {
            [navigation dismissViewControllerAnimated:YES completion:close];
        } else {
            close();
        }
        return self;
    };
}

@end
#endif
