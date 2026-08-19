//
//  JXCategoryTitleBackgroundCell.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELL_BDCF1331A0
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELL_BDCF1331A0

#if __has_include(<JXCategoryView/JXCategoryTitleCell.h>)
#import <JXCategoryView/JXCategoryTitleCell.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#else
#import "JXCategoryTitleCell.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/CALayer+DSL.h>)
#import <JobsOCDSL/CALayer+DSL.h>
#else
#import "CALayer+DSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JXCategoryTitleBackgroundCell : JXCategoryTitleCell

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCell
-(JobsRetJXCategoryTitleBackgroundCellByCALayerBlock _Nonnull)byBgLayer;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundCell
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELL_BDCF1331A0 */
