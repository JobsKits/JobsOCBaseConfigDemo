//
//  UINavigationController+SafeTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE

#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <JobsByOCPods/NSArray+Extra.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (SafeTransition)<UINavigationControllerDelegate>

Prop_assign()BOOL viewTransitionInProgress;

- (void)ty_popToRootViewControllerBySetControllersAnimated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE */
