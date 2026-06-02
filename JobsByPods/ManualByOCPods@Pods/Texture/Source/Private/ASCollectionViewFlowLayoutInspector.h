//
//  ASCollectionViewFlowLayoutInspector.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASCollectionViewLayoutInspector.h>

NS_ASSUME_NONNULL_BEGIN

@class ASCollectionView;
@class UICollectionViewFlowLayout;

/**
 * A layout inspector implementation specific for the sizing behavior of UICollectionViewFlowLayouts
 */
AS_SUBCLASSING_RESTRICTED
@interface ASCollectionViewFlowLayoutInspector : NSObject <ASCollectionViewLayoutInspecting>

@property (nonatomic, weak, readonly) UICollectionViewFlowLayout *layout;

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithFlowLayout:(UICollectionViewFlowLayout *)flowLayout NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
