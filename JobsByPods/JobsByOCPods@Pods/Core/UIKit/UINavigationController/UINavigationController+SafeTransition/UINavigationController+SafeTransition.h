//
//  UINavigationController+SafeTransition.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE

#import <objc/runtime.h>

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsBaseUI/UIViewController+BaseNavigationBar.h>)
#import <JobsBaseUI/UIViewController+BaseNavigationBar.h>
#else
#import "UIViewController+BaseNavigationBar.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSArray+Extra.h>
#import <JobsByOCPods/UIViewController+BaseNavigationBar.h>

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

-(jobsByBOOLBlock _Nonnull)ty_popToRootViewControllerBySetControllersAnimated;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_SAFETRANSITION_8072586AFE */
