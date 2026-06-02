//
//  ASCollectionLayoutCache.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASBaseDefines.h>

NS_ASSUME_NONNULL_BEGIN

@class ASCollectionLayoutContext, ASCollectionLayoutState;

/// A thread-safe cache for ASCollectionLayoutContext-ASCollectionLayoutState pairs
AS_SUBCLASSING_RESTRICTED
@interface ASCollectionLayoutCache : NSObject

- (nullable ASCollectionLayoutState *)layoutForContext:(ASCollectionLayoutContext *)context;

- (void)setLayout:(ASCollectionLayoutState *)layout forContext:(ASCollectionLayoutContext *)context;

- (void)removeLayoutForContext:(ASCollectionLayoutContext *)context;

- (void)removeAllLayouts;

@end

NS_ASSUME_NONNULL_END
