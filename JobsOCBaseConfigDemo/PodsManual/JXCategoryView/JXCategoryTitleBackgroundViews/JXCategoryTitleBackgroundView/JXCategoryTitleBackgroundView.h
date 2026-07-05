//
//  JXCategoryTitleBackgroundView.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0

#import <UIKit/UIKit.h>
#import "JXCategoryTitleBackgroundCellModel.h"
#import "JXCategoryTitleBackgroundCell.h"

#if __has_include(<JXCategoryView/JXCategoryDotView.h>)
#import <JXCategoryView/JXCategoryDotView.h>
#else
#import "JXCategoryDotView.h"
#endif

#import "JobsBlock.h"

#import "JobsDefines.h"

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

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDVIEW_A0BD6078D0 */
