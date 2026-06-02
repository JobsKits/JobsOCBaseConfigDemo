//
//  UICollectionView+TABControlAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/UIView+TABControlAnimation.h>

NS_ASSUME_NONNULL_BEGIN

@class TABCollectionAnimated;

typedef void(^TABCollectionViewConfigBlock)(TABCollectionAnimated * _Nonnull tabAnimated);

@interface UICollectionView (TABControlAnimation)

- (void)tab_startAnimationWithConfigBlock:(nullable TABCollectionViewConfigBlock)configBlock
                              adjustBlock:(nullable TABAdjustBlock)adjustBlock
                               completion:(nullable void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
