//
//  JXCategoryTimelineCellModel.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELLMODEL_23ECD5297B
#define JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELLMODEL_23ECD5297B

#import <UIKit/UIKit.h>

#if __has_include(<JXCategoryView/JXCategoryTitleCellModel.h>)
#import <JXCategoryView/JXCategoryTitleCellModel.h>
#else
#import "JXCategoryTitleCellModel.h"
#endif

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

@interface JXCategoryTimelineCellModel : JXCategoryTitleCellModel

Prop_copy()NSString *timeTitle;
Prop_strong()UIColor *timeTitleNormalColor;
Prop_strong()UIColor *timeTitleSelectedColor;
Prop_strong()UIFont *timeTitleFont;
Prop_strong()UIFont *timeTitleSelectedFont;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryTimelineCellModel
-(JobsRetJXCategoryTimelineCellModelByNSStringBlock _Nonnull)byTimeTitle;
-(JobsRetJXCategoryTimelineCellModelByUIColorBlock _Nonnull)byTimeTitleNormalColor;
-(JobsRetJXCategoryTimelineCellModelByUIColorBlock _Nonnull)byTimeTitleSelectedColor;
-(JobsRetJXCategoryTimelineCellModelByUIFontBlock _Nonnull)byTimeTitleFont;
-(JobsRetJXCategoryTimelineCellModelByUIFontBlock _Nonnull)byTimeTitleSelectedFont;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryTimelineCellModel
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTIMELINECELLMODEL_23ECD5297B */
