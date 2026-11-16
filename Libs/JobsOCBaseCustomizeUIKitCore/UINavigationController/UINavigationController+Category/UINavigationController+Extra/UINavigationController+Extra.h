//
//  UINavigationController+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138
#define JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138

#import <UIKit/UIKit.h>
#import "JobsNavigationTransitionMgrHeader.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UINavigationController (Extra)

+(JobsRetNavCtrByVCBlock _Nonnull)initBy;
-(UIViewController *)rootViewController;
-(JobsRetVCByVoidBlock _Nonnull)jobsRootViewController;
-(jobsByNSIntegerBlock _Nonnull)navDirectionBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UINAVIGATIONCONTROLLER_EXTRA_2F8E870138 */
