//
//  JXCategoryTitleCellModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorCellModel.h>
#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryViewDefines.h>

@interface JXCategoryTitleCellModel : JXCategoryIndicatorCellModel

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger titleNumberOfLines;

@property (nonatomic, strong) UIColor *titleNormalColor;

@property (nonatomic, strong) UIColor *titleCurrentColor;

@property (nonatomic, strong) UIColor *titleSelectedColor;

@property (nonatomic, strong) UIFont *titleFont;

@property (nonatomic, strong) UIFont *titleSelectedFont;

@property (nonatomic, assign) BOOL titleLabelMaskEnabled;

@property (nonatomic, assign) BOOL titleLabelZoomEnabled;

@property (nonatomic, assign) CGFloat titleLabelNormalZoomScale;

@property (nonatomic, assign) CGFloat titleLabelCurrentZoomScale;

@property (nonatomic, assign) CGFloat titleLabelSelectedZoomScale;

@property (nonatomic, assign) BOOL titleLabelStrokeWidthEnabled;

@property (nonatomic, assign) CGFloat titleLabelNormalStrokeWidth;

@property (nonatomic, assign) CGFloat titleLabelCurrentStrokeWidth;

@property (nonatomic, assign) CGFloat titleLabelSelectedStrokeWidth;

@property (nonatomic, assign) CGFloat titleLabelVerticalOffset;

@property (nonatomic, assign) JXCategoryTitleLabelAnchorPointStyle titleLabelAnchorPointStyle;

@end
