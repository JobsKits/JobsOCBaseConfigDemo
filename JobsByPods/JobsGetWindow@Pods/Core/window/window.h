//
//  window.h
//  JobsGetWindow
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_WINDOW_9AE162DC9A
#define JOBS_HEADER_GUARD_WINDOW_9AE162DC9A

#import <UIKit/UIKit.h>

/// ⚠️废弃声明 —— 方法
#ifndef SuppressWdeprecatedDeclarationsWarning
#define SuppressWdeprecatedDeclarationsWarning(Stuff) \
    do { \
        _Pragma("clang diagnostic push") \
        _Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
        Stuff; \
        _Pragma("clang diagnostic pop") \
    } while (0)
#endif /* SuppressWdeprecatedDeclarationsWarning */

/// UI 查询在主线程执行；有调用方 view / controller 时优先其所属窗口。
NS_INLINE UIWindow *_Nullable jobsGetWindowForView(UIView *_Nullable view) {
    return NSThread.isMainThread ? view.window : nil;
}

NS_INLINE UIWindow *_Nullable jobsGetWindowForViewController(UIViewController *_Nullable controller) {
    return NSThread.isMainThread && controller.isViewLoaded ? controller.view.window : nil;
}

NS_INLINE UIWindow *_Nullable jobsGetMainWindowBefore13(void) {
    if (!NSThread.isMainThread) {
        return nil;
    }
    UIWindow *window = UIApplication.sharedApplication.delegate.window;
    if (!window) {
        SuppressWdeprecatedDeclarationsWarning(window = UIApplication.sharedApplication.keyWindow;);
    }
    return window;
}

NS_INLINE UIWindow *_Nullable jobsGetWindowForScene(UIWindowScene *_Nullable scene) {
    if (!NSThread.isMainThread) {
        return nil;
    }
    if (@available(iOS 13.0, *)) {
        if (![scene isKindOfClass:UIWindowScene.class]) {
            return nil;
        }
        UIWindow *fallback = nil;
        for (UIWindow *window in scene.windows) {
            if (window.hidden || window.alpha <= 0 || window.windowLevel != UIWindowLevelNormal) {
                continue;
            }
            if (window.isKeyWindow) {
                return window;
            }
            if (!fallback) {
                fallback = window;
            }
        }
        return fallback;
    }
    return nil;
}

/// 全局回退只挑前台 Scene；完整搜索同一状态的 keyWindow 后再选择普通窗口。
NS_INLINE UIWindow *_Nullable jobsGetMainWindowFromScenes(NSArray<UIScene *> *_Nullable connectedScenes) {
    if (!NSThread.isMainThread) {
        return nil;
    }
    if (@available(iOS 13.0, *)) {
        NSArray *scenes = [connectedScenes sortedArrayUsingComparator:^NSComparisonResult(UIScene *left, UIScene *right) {
            return [left.session.persistentIdentifier compare:right.session.persistentIdentifier];
        }];
        for (NSNumber *state in @[@(UISceneActivationStateForegroundActive), @(UISceneActivationStateForegroundInactive)]) {
            UIWindow *fallback = nil;
            for (UIScene *scene in scenes) {
                if (![scene isKindOfClass:UIWindowScene.class] || scene.activationState != state.integerValue) {
                    continue;
                }
                UIWindow *window = jobsGetWindowForScene((UIWindowScene *)scene);
                if (window.isKeyWindow) {
                    return window;
                }
                if (!fallback) {
                    fallback = window;
                }
            }
            if (fallback) {
                return fallback;
            }
        }
    }
    return nil;
}

NS_INLINE UIWindow *_Nullable jobsGetMainWindowAfter13(void) {
    if (!NSThread.isMainThread) {
        return nil;
    }
    if (@available(iOS 13.0, *)) {
        return jobsGetMainWindowFromScenes(UIApplication.sharedApplication.connectedScenes.allObjects);
    }
    return nil;
}

NS_INLINE UIWindow *_Nullable jobsGetMainWindow(void) {
    if (!NSThread.isMainThread) {
        return nil;
    }
    if (@available(iOS 13.0, *)) {
        UIWindow *window = jobsGetMainWindowAfter13();
        if (window || UIApplication.sharedApplication.connectedScenes.count) {
            return window;
        }
    }
    return jobsGetMainWindowBefore13();
}

NS_INLINE UIWindow *_Nullable jobsGetMainWindowWithSize(void) {
    UIWindow *window = jobsGetMainWindow();
    return window && !CGRectIsEmpty(window.bounds) ? window : nil;
}

NS_INLINE UIWindowScene *_Nullable jobsGetkeyWindowScene(void) {
    if (@available(iOS 13.0, *)) {
        return jobsGetMainWindowAfter13().windowScene;
    }
    return nil;
}

/// 兼容历史布局判断；以实际窗口 safe area 为准，横屏同时考虑底部。
NS_INLINE BOOL isiPhoneX_series(void) {
    if (!NSThread.isMainThread || UIDevice.currentDevice.userInterfaceIdiom != UIUserInterfaceIdiomPhone) {
        return NO;
    }
    UIWindow *window = jobsGetMainWindow();
    return window.safeAreaInsets.top > 20 || window.safeAreaInsets.bottom > 0;
}

#endif /* JOBS_HEADER_GUARD_WINDOW_9AE162DC9A */
