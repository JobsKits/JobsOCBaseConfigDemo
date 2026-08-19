//
//  JXCategoryTitleBackgroundCellModel.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JXCategoryView/JXCategoryTitleCellModel.h>)
#import <JXCategoryView/JXCategoryTitleCellModel.h>
#else
#import "JXCategoryTitleCellModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

@interface JXCategoryTitleBackgroundCellModel : JXCategoryTitleCellModel

Prop_strong()UIColor *normalBackgroundColor;
Prop_strong()UIColor *normalBorderColor;
Prop_strong()UIColor *selectedBackgroundColor;
Prop_strong()UIColor *selectedBorderColor;
Prop_assign()CGFloat borderLineWidth;
Prop_assign()CGFloat backgroundCornerRadius;
Prop_assign()CGFloat backgroundWidth;
Prop_assign()CGFloat backgroundHeight;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundCellModel
-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundCornerRadius;
-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundHeight;
-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBackgroundWidth;
-(JobsRetJXCategoryTitleBackgroundCellModelByCGFloatBlock _Nonnull)byBorderLineWidth;
-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)byNormalBackgroundColor;
-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)byNormalBorderColor;
-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)bySelectedBackgroundColor;
-(JobsRetJXCategoryTitleBackgroundCellModelByUIColorBlock _Nonnull)bySelectedBorderColor;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundCellModel
@end
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B */
