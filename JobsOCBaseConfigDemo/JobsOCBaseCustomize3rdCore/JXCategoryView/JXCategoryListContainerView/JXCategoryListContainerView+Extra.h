//
//  JXCategoryListContainerView+Extra.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYLISTCONTAINERVIEW_EXTRA_D270227160
#define JOBS_HEADER_GUARD_JXCATEGORYLISTCONTAINERVIEW_EXTRA_D270227160

#if __has_include(<JXCategoryView/JXCategoryView.h>)
#import <JXCategoryView/JXCategoryView.h>
#else
#import "JXCategoryView.h"
#endif

#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryListContainerView (Extra)

-(JobsRetCategoryListContainerViewByNSIntegerBlock _Nonnull)byDefaultSelectedIndex;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYLISTCONTAINERVIEW_EXTRA_D270227160 */
