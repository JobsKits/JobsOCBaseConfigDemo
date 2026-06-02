//
//  JXCategoryIndicatorBallView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorComponentView.h>

@interface JXCategoryIndicatorBallView : JXCategoryIndicatorComponentView

//球的尺寸。默认：CGSizeMake(15, 15)
@property (nonatomic, assign) CGSize ballViewSize;
//球的X轴偏移量。默认：20
@property (nonatomic, assign) CGFloat ballScrollOffsetX;
//球的颜色值。默认为[UIColor redColor]
@property (nonatomic, strong) UIColor *ballViewColor;

@end
