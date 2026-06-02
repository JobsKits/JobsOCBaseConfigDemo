//
//  _ASCollectionViewCell.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/ASBaseDefines.h>
#import <AsyncDisplayKit/ASCellNode.h>

@class ASCollectionElement;

NS_ASSUME_NONNULL_BEGIN

AS_SUBCLASSING_RESTRICTED // Note: ASDynamicCastStrict is used on instances of this class based on this restriction.
@interface _ASCollectionViewCell : UICollectionViewCell

@property (nonatomic, nullable) ASCollectionElement *element;
@property (nullable, nonatomic, readonly) ASCellNode *node;
@property (nonatomic, nullable) UICollectionViewLayoutAttributes *layoutAttributes;

/**
 * Whether or not this cell is interested in cell node visibility events.
 * -cellNodeVisibilityEvent:inScrollView: should be called only if this property is YES.
 */
@property (nonatomic, readonly) BOOL consumesCellNodeVisibilityEvents;

- (void)cellNodeVisibilityEvent:(ASCellNodeVisibilityEvent)event inScrollView:(UIScrollView *)scrollView;

@end

NS_ASSUME_NONNULL_END
