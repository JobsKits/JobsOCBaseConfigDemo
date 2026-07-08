//
//  JXCategoryBaseView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYBASEVIEW_EXTRA_8CBB208D74
#define JOBS_HEADER_GUARD_JXCATEGORYBASEVIEW_EXTRA_8CBB208D74

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryBaseView (Extra)

-(JobsRetCategoryBaseViewByDelegateBlock _Nonnull)byDelegate;
-(JobsRetCategoryBaseViewByCGFloatBlock _Nonnull)byCellSpacing;
-(JobsRetCategoryBaseViewByViewBlock _Nonnull)byContentScrollView;
-(JobsRetCategoryTitleViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex;
-(JobsRetCategoryBaseViewByListContainerBlock _Nonnull)byListContainer;
-(JobsRetCategoryBaseViewByVoidBlock _Nonnull)reloadDatasWithoutListContainer;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYBASEVIEW_EXTRA_8CBB208D74 */
