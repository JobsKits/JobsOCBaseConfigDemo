//
//  UIView+Extra.h
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月17日，星期日.
//

#ifndef JOBS_HEADER_GUARD_UIVIEW_EXTRA_460B92A343
#define JOBS_HEADER_GUARD_UIVIEW_EXTRA_460B92A343

#pragma once

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extra)

Prop_assign()CGFloat jobsVisible;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIVIEW_EXTRA_460B92A343 */
