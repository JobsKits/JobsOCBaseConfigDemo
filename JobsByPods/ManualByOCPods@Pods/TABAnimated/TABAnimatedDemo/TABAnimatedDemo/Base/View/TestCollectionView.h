//
//  TestCollectionView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestCollectionView : UICollectionView

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, copy) NSString *cellName;

@end

NS_ASSUME_NONNULL_END
