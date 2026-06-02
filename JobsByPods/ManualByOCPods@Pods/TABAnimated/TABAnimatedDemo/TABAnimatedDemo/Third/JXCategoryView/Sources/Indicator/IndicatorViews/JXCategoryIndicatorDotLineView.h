//
//  JXCategoryIndicatorDotLineView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorComponentView.h>

@interface JXCategoryIndicatorDotLineView : JXCategoryIndicatorComponentView

//点的尺寸。默认：CGSizeMake(10, 10)
@property (nonatomic, assign) CGSize dotSize;
//线状态的最大宽度。默认：50
@property (nonatomic, assign) CGFloat lineWidth;
//点线的颜色值。默认为[UIColor redColor]
@property (nonatomic, strong) UIColor *dotLineViewColor;

@end
