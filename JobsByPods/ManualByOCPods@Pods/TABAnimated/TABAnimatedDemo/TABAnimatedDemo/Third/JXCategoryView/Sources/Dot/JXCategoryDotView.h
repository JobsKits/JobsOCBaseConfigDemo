//
//  JXCategoryDotView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryTitleView.h>
#import <TABAnimated/JXCategoryDotCell.h>
#import <TABAnimated/JXCategoryDotCellModel.h>

@interface JXCategoryDotView : JXCategoryTitleView

//相对于titleLabel的位置，默认：JXCategoryDotRelativePosition_TopRight
@property (nonatomic, assign) JXCategoryDotRelativePosition relativePosition;
//@[@(布尔值)]数组，控制红点是否显示
@property (nonatomic, strong) NSArray <NSNumber *> *dotStates;
//红点的尺寸。默认：CGSizeMake(10, 10)
@property (nonatomic, assign) CGSize dotSize;
//红点的圆角值。默认：JXCategoryViewAutomaticDimension（self.dotSize.height/2）
@property (nonatomic, assign) CGFloat dotCornerRadius;
//红点的颜色。默认：[UIColor redColor]
@property (nonatomic, strong) UIColor *dotColor;

@end
