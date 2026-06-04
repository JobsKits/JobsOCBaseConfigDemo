//
//  UINavigationController+SafeTransition.h
//  FirefoxGames
//
//  Created by Billie on 2020/3/8.
//  Copyright © 2020 FirefoxGames. All rights reserved.
//

/* 解决Can't add self as subview 的崩溃 */

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "NSObject+Swizzling.h"

#import "DefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (SafeTransition)<UINavigationControllerDelegate>

Prop_assign()BOOL viewTransitionInProgress;

- (void)ty_popToRootViewControllerBySetControllersAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
