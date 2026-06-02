//
//  JXCategoryCollectionView.h
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <TABAnimated/JXCategoryIndicatorProtocol.h>

@interface JXCategoryCollectionView : UICollectionView

@property (nonatomic, strong) NSArray <UIView<JXCategoryIndicatorProtocol> *> *indicators;

@end
