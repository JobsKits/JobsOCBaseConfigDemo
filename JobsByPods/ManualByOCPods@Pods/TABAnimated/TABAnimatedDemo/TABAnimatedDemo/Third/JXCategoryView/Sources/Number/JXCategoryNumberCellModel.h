//
//  JXCategoryNumberCellModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryTitleCellModel.h>

@interface JXCategoryNumberCellModel : JXCategoryTitleCellModel

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *numberString;
@property (nonatomic, copy) void(^numberStringFormatterBlock)(NSInteger number);
@property (nonatomic, strong) UIColor *numberBackgroundColor;
@property (nonatomic, strong) UIColor *numberTitleColor;
@property (nonatomic, assign) CGFloat numberLabelWidthIncrement;
@property (nonatomic, assign) CGFloat numberLabelHeight;
@property (nonatomic, strong) UIFont *numberLabelFont;

@end
