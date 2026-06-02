//
//  UIView+TABControlModel.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class TABViewAnimated;
@interface UIView (TABControlModel)
@property (nonatomic, strong) TABViewAnimated * _Nullable tabAnimated;
@end

@class TABTableAnimated;
@interface UITableView (TABControlModel)
@property (nonatomic, strong) TABTableAnimated * _Nullable tabAnimated;
@end

@class TABCollectionAnimated;
@interface UICollectionView (TABControlModel)
@property (nonatomic, strong) TABCollectionAnimated * _Nullable tabAnimated;
@end

@class TABCollectionAnimated;
@interface UICollectionViewLayout (TABAnimated)
@property (nonatomic, strong) TABCollectionAnimated * _Nullable tabAnimated;
@end

NS_ASSUME_NONNULL_END
