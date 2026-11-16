//
//  JXCategoryTimelineCell.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELL_D781CDA80D
#define JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELL_D781CDA80D

#import "JXCategoryTimelineCellModel.h"

#if __has_include(<JXCategoryView/JXCategoryTitleCell.h>)
#import <JXCategoryView/JXCategoryTitleCell.h>
#else
#import "JXCategoryTitleCell.h"
#endif

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTimelineCell : JXCategoryTitleCell

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELL_D781CDA80D */
