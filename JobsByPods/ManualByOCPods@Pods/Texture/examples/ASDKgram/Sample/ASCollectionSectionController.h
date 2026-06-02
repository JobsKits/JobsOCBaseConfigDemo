//
//  ASCollectionSectionController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ASCollectionSectionController : IGListSectionController

/**
 * The items managed by this section controller.
 */
@property (nonatomic, strong, readonly) NSArray<id<IGListDiffable>> *items;

- (void)setItems:(NSArray<id<IGListDiffable>> *)newItems
        animated:(BOOL)animated
      completion:(nullable void(^)())completion;

- (NSInteger)numberOfItems;

@end

NS_ASSUME_NONNULL_END
