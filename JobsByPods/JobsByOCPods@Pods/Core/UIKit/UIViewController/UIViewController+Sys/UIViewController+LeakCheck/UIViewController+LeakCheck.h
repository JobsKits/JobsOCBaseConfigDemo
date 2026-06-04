//
//  UIViewController+LeakCheck.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LEAKCHECK_692034DC92
#define JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LEAKCHECK_692034DC92

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsByOCPods/NSPointerArray+Extra.h>
#import <JobsByOCPods/NSMutableSet+Extra.h>

#if __has_include(<JobsTimeUtils/JobsTimeUtils.h>)
#import <JobsTimeUtils/JobsTimeUtils.h>
#else
#import "JobsTimeUtils.h"
#endif

/// 参考资料来源：https://github.com/fengzhiyinxiang/UIViewControllerLeakCheck
NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (LeakCheck)

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEWCONTROLLER_LEAKCHECK_692034DC92 */
