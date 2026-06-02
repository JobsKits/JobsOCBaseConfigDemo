//
//  JXCategoryIndicatorTriangleView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorComponentView.h>

@interface JXCategoryIndicatorTriangleView : JXCategoryIndicatorComponentView
//三角形的尺寸。默认：CGSizeMake(14, 10)
@property (nonatomic, assign) CGSize triangleViewSize;
//三角形的颜色值。默认：[UIColor redColor]
@property (nonatomic, strong) UIColor *triangleViewColor;

@end
