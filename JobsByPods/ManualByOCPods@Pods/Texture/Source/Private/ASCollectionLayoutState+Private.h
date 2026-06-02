//
//  ASCollectionLayoutState+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASCollectionLayoutState.h>
#import <AsyncDisplayKit/ASPageTable.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASCollectionLayoutState (Private)

/**
 * Remove and returns layout attributes for unmeasured elements that intersect the specified rect
 *
 * @discussion This method is atomic and thread-safe
 */
- (nullable ASPageToLayoutAttributesTable *)getAndRemoveUnmeasuredLayoutAttributesPageTableInRect:(CGRect)rect;

@end

NS_ASSUME_NONNULL_END
