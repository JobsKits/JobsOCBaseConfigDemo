//
//  JXCategoryBaseCellModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryViewDefines.h>

@interface JXCategoryBaseCellModel : NSObject

@property (nonatomic, assign) NSUInteger index;

@property (nonatomic, assign) BOOL selected;

@property (nonatomic, assign) CGFloat cellWidth;

@property (nonatomic, assign) CGFloat cellSpacing;

@property (nonatomic, assign) BOOL cellWidthZoomEnabled;

@property (nonatomic, assign) CGFloat cellWidthNormalZoomScale;

@property (nonatomic, assign) CGFloat cellWidthCurrentZoomScale;

@property (nonatomic, assign) CGFloat cellWidthSelectedZoomScale;

@property (nonatomic, assign) BOOL selectedAnimationEnabled;

@property (nonatomic, assign) NSTimeInterval selectedAnimationDuration;

@property (nonatomic, assign) JXCategoryCellSelectedType selectedType;

@property (nonatomic, assign, getter=isTransitionAnimating) BOOL transitionAnimating;

@end
