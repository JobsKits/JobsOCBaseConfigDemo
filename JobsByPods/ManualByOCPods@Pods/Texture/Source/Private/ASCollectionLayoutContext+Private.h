//
//  ASCollectionLayoutContext+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASCollectionLayoutContext.h>

@class ASCollectionLayoutCache;
@protocol ASCollectionLayoutDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ASCollectionLayoutContext (Private)

@property (nonatomic, readonly) Class<ASCollectionLayoutDelegate> layoutDelegateClass;
@property (nonatomic, weak, readonly) ASCollectionLayoutCache *layoutCache;

- (instancetype)initWithViewportSize:(CGSize)viewportSize
                initialContentOffset:(CGPoint)initialContentOffset
                scrollableDirections:(ASScrollDirection)scrollableDirections
                            elements:(ASElementMap *)elements
                 layoutDelegateClass:(Class<ASCollectionLayoutDelegate>)layoutDelegateClass
                         layoutCache:(ASCollectionLayoutCache *)layoutCache
                      additionalInfo:(nullable id)additionalInfo;

@end

NS_ASSUME_NONNULL_END
