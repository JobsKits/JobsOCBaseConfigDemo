//
//  JXCategoryIndicatorComponentView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryIndicatorProtocol.h>
#import <TABAnimated/JXCategoryViewDefines.h>

@interface JXCategoryIndicatorComponentView : UIView <JXCategoryIndicatorProtocol>

//指示器的位置。底部或者顶部
@property (nonatomic, assign) JXCategoryComponentPosition componentPosition;
//垂直方向偏移。数值越大越靠近中心。默认：0。
@property (nonatomic, assign) CGFloat verticalMargin;
//手势滚动、点击切换的时候，是否允许滚动，默认YES
@property (nonatomic, assign) BOOL scrollEnabled;
//滚动动画的时间。默认0.25
@property (nonatomic, assign) NSTimeInterval scrollAnimationDuration;

@end
