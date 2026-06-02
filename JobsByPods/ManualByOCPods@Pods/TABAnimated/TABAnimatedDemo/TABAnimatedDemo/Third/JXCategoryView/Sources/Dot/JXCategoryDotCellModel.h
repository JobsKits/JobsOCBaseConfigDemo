//
//  JXCategoryDotCellModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <TABAnimated/JXCategoryTitleCellModel.h>

typedef NS_ENUM(NSUInteger, JXCategoryDotRelativePosition) {
    JXCategoryDotRelativePosition_TopLeft = 0,
    JXCategoryDotRelativePosition_TopRight,
    JXCategoryDotRelativePosition_BottomLeft,
    JXCategoryDotRelativePosition_BottomRight,
};

@interface JXCategoryDotCellModel : JXCategoryTitleCellModel

@property (nonatomic, assign) BOOL dotHidden;

@property (nonatomic, assign) JXCategoryDotRelativePosition relativePosition;

@property (nonatomic, assign) CGSize dotSize;

@property (nonatomic, assign) CGFloat dotCornerRadius;

@property (nonatomic, strong) UIColor *dotColor;

@end
