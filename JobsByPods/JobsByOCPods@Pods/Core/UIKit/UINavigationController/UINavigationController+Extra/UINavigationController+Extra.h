//
//  UINavigationController+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138

#import <UIKit/UIKit.h>

#if __has_include(<JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.h>)
#import <JobsNavigationTransitionMgr/JobsNavigationTransitionMgr.h>
#else
#import "JobsNavigationTransitionMgr.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Extra)

+(JobsRetNavCtrByVCBlock _Nonnull)initBy;
-(UIViewController *)rootViewController;
-(jobsByNSIntegerBlock _Nonnull)navDirectionBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138 */
