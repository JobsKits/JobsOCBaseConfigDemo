//
//  JXCategoryTitleBackgroundView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0

#import <UIKit/UIKit.h>
#import <JXCategoryViewExtra/JXCategoryTitleBackgroundCellModel.h>
#import <JXCategoryViewExtra/JXCategoryTitleBackgroundCell.h>

#if __has_include(<JXCategoryView/JXCategoryDotView.h>)
#import <JXCategoryView/JXCategoryDotView.h>
#else
#import "JXCategoryDotView.h"
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

@interface JXCategoryTitleBackgroundView : JXCategoryTitleView

Prop_strong()UIColor *normalBackgroundColor;
Prop_strong()UIColor *normalBorderColor;
Prop_strong()UIColor *selectedBackgroundColor;
Prop_strong()UIColor *selectedBorderColor;
Prop_assign()CGFloat borderLineWidth;
Prop_assign()CGFloat backgroundCornerRadius;
Prop_assign()CGFloat backgroundWidth;
Prop_assign()CGFloat backgroundHeight;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JXCategoryTitleBackgroundView
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundCornerRadius;
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundHeight;
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBackgroundWidth;
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byBorderLineWidth;
-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)byNormalBackgroundColor;
-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)byNormalBorderColor;
-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)bySelectedBackgroundColor;
-(JobsRetJXCategoryTitleBackgroundViewByUIColorBlock _Nonnull)bySelectedBorderColor;
-(JobsRetJXCategoryTitleBackgroundViewByCGFloatBlock _Nonnull)byCellWidthIncrement;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JXCategoryTitleBackgroundView
@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0 */
