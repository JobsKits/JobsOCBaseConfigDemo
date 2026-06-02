//
//  UITableView+TABControlAnimation.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/UIView+TABControlAnimation.h>

NS_ASSUME_NONNULL_BEGIN

@class TABTableAnimated;

typedef void(^TABTableViewConfigBlock)(TABTableAnimated * _Nonnull tabAnimated);

@interface UITableView (TABControlAnimation)

- (void)tab_startAnimationWithConfigBlock:(nullable TABTableViewConfigBlock)configBlock
                              adjustBlock:(nullable TABAdjustBlock)adjustBlock
                               completion:(nullable void (^)(void))completion;

@end

NS_ASSUME_NONNULL_END
