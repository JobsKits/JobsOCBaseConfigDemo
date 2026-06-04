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

@interface JXCategoryTitleBackgroundCellModel : JXCategoryTitleCellModel

@property (nonatomic, strong) UIColor *normalBackgroundColor;
@property (nonatomic, strong) UIColor *normalBorderColor;
@property (nonatomic, strong) UIColor *selectedBackgroundColor;
@property (nonatomic, strong) UIColor *selectedBorderColor;
@property (nonatomic, assign) CGFloat borderLineWidth;
@property (nonatomic, assign) CGFloat backgroundCornerRadius;
@property (nonatomic, assign) CGFloat backgroundWidth;
@property (nonatomic, assign) CGFloat backgroundHeight;
@end
#endif /* JOBS_HEADER_GUARD_JXCATEGORYTITLEBACKGROUNDCELLMODEL_6A7712F42B */
