//
//  UINavigationController+SafeTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "NSArray+Extra.h"
#import "UIViewController+BaseNavigationBar.h"
#import "JobsOCRuntimeKits.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (SafeTransition)<UINavigationControllerDelegate>

Prop_assign()BOOL viewTransitionInProgress;

- (void)ty_popToRootViewControllerBySetControllersAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE */
