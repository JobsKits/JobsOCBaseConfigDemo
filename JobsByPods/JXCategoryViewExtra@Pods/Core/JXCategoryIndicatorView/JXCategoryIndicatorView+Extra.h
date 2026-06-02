//
//  JXCategoryIndicatorView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632
#define JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632

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

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryIndicatorView (Extra)

-(JobsReturnCategoryIndicatorViewByViewsBlock _Nonnull)byIndicators;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632 */
