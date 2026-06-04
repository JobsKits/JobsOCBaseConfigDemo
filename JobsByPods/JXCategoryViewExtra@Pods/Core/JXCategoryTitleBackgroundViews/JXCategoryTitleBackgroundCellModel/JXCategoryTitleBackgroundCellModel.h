//
//  JXCategoryTitleBackgroundCellModel.h
//  JobsBy3rdExtras
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B
#define JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B

#import <UIKit/UIKit.h>

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
@end
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B */
