//
//  JXCategoryIndicatorImageView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryIndicatorComponentView.h>

@interface JXCategoryIndicatorImageView : JXCategoryIndicatorComponentView
//显示指示器图片的UIImageView
@property (nonatomic, strong, readonly) UIImageView *indicatorImageView;
//图片是否开启滚动。默认NO
@property (nonatomic, assign) BOOL indicatorImageViewRollEnabled;
//图片的尺寸。默认：CGSizeMake(30, 20)
@property (nonatomic, assign) CGSize indicatorImageViewSize;

@end
