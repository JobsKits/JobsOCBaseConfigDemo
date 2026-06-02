//
//  UIActivityIndicatorView+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UIACTIVITYINDICATORVIEW_EXTRA_F79690E8DB
#define JOBS_HEADER_GUARD_UIACTIVITYINDICATORVIEW_EXTRA_F79690E8DB

#import <UIKit/UIKit.h>

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

@interface UIActivityIndicatorView (Extra)

+(JobsRetActivityIndicatorViewByNSInteger _Nonnull)initBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_UIACTIVITYINDICATORVIEW_EXTRA_F79690E8DB */
