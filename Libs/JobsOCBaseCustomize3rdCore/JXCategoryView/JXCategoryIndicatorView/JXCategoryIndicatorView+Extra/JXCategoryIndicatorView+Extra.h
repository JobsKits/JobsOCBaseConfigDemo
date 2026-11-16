//
//  JXCategoryIndicatorView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#define JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryIndicatorView (Extra)

-(JobsRetCategoryIndicatorViewByViewsBlock _Nonnull)byIndicators;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYINDICATORVIEW_EXTRA_45157AE632 */
