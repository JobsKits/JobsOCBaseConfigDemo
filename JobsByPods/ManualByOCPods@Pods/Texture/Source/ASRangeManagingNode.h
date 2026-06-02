//
//  ASRangeManagingNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASTraitCollection.h>

@class ASCellNode;

NS_ASSUME_NONNULL_BEGIN

/**
 * Basically ASTableNode or ASCollectionNode.
 */
@protocol ASRangeManagingNode <NSObject, ASTraitEnvironment>

/**
 * Retrieve the index path for the given node, if it's a member of this container.
 *
 * @param node The node.
 * @return The index path, or nil if the node is not part of this container.
 */
- (nullable NSIndexPath *)indexPathForNode:(ASCellNode *)node;

@end

NS_ASSUME_NONNULL_END
