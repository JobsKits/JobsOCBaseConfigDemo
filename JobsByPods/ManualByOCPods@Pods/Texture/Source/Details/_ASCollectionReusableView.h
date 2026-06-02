//
//  _ASCollectionReusableView.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/ASBaseDefines.h>

@class ASCellNode, ASCollectionElement;

NS_ASSUME_NONNULL_BEGIN

AS_SUBCLASSING_RESTRICTED // Note: ASDynamicCastStrict is used on instances of this class based on this restriction.
@interface _ASCollectionReusableView : UICollectionReusableView

@property (nullable, nonatomic, readonly) ASCellNode *node;
@property (nullable, nonatomic) ASCollectionElement *element;
@property (nullable, nonatomic) UICollectionViewLayoutAttributes *layoutAttributes;

@end

NS_ASSUME_NONNULL_END
