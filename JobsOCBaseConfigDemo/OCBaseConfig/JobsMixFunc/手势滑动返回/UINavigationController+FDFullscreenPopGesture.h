//
//  UINavigationController+FDFullscreenPopGesture.h
//  FDFullscreenPopGesture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_FDFULLSCREENPOPGESTURE_0E81449114
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_FDFULLSCREENPOPGESTURE_0E81449114

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIScrollView+FDFullscreenPopGesture.h"

#import "JobsDefines.h"

/// https://github.com/forkingdog/FDFullscreenPopGesture/issues/177
/// "UINavigation+FDFullscreenPopGesture" extends UINavigationController's swipe-
/// to-pop behavior in iOS 7+ by supporting fullscreen pan gesture. Instead of
/// screen edge, you can now swipe from any place on the screen and the onboard
/// interactive pop transition works seamlessly.
///
/// Adding the implementation file of this category to your target will
/// automatically patch UINavigationController with this feature.
@interface UINavigationController (FDFullscreenPopGesture)<UIGestureRecognizerDelegate>

/// The gesture recognizer that actually handles interactive pop.
Prop_strong(readonly)UIPanGestureRecognizer *fd_fullscreenPopGestureRecognizer;
/// A view controller is able to control navigation bar's appearance by itself,
/// rather than a global way, checking "fd_prefersNavigationBarHidden" property.
/// Default to YES, disable it if you don't want so.
Prop_assign()BOOL fd_viewControllerBasedNavigationBarAppearanceEnabled;

@end
/// Allows any view controller to disable interactive pop gesture, which might
/// be necessary when the view controller itself handles pan gesture in some
/// cases.
@interface UIViewController (FDFullscreenPopGesture)
/// Whether the interactive pop gesture is disabled when contained in a navigation
/// stack.
Prop_assign()BOOL fd_interactivePopDisabled;
/// Max allowed initial distance to left edge when you begin the interactive pop
/// gesture. 0 by default, which means it will ignore this limit.
Prop_assign()CGFloat fd_interactivePopMaxAllowedInitialDistanceToLeftEdge;

@end
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_FDFULLSCREENPOPGESTURE_0E81449114 */
