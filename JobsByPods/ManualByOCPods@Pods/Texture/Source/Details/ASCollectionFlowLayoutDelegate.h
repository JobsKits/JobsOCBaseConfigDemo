//
//  ASCollectionFlowLayoutDelegate.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASCollectionLayoutDelegate.h>

NS_ASSUME_NONNULL_BEGIN

AS_SUBCLASSING_RESTRICTED

/**
 * A thread-safe, high performant layout delegate that arranges items into a flow layout. 
 * It uses a concurrent and multi-line ASStackLayoutSpec under the hood. Thus, per-child flex properties (i.e alignSelf, 
 * flexShrink, flexGrow, etc - see @ASStackLayoutElement) can be set directly on cell nodes to be used
 * to calculate the final collection layout.
 */
@interface ASCollectionFlowLayoutDelegate : NSObject <ASCollectionLayoutDelegate>

- (instancetype)initWithScrollableDirections:(ASScrollDirection)scrollableDirections NS_DESIGNATED_INITIALIZER;

@end

NS_ASSUME_NONNULL_END
