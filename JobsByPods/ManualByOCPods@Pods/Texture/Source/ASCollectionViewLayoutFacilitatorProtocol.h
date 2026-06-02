//
//  ASCollectionViewLayoutFacilitatorProtocol.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#pragma once
#import <Foundation/Foundation.h>

/**
 * This facilitator protocol is intended to help Layout to better
 * gel with the CollectionView
 */
@protocol ASCollectionViewLayoutFacilitatorProtocol <NSObject>

/**
 * Inform that the collectionView is editing the cells at a list of indexPaths
 *
 * @param indexPaths an array of NSIndexPath objects of cells being/will be edited.
 * @param isBatched indicates whether the editing operation will be batched by the collectionView
 *
 * NOTE: when isBatched, used in combination with -collectionViewWillPerformBatchUpdates
 */
- (void)collectionViewWillEditCellsAtIndexPaths:(NSArray *)indexPaths batched:(BOOL)isBatched;

/**
 * Inform that the collectionView is editing the sections at a set of indexes
 *
 * @param indexes an NSIndexSet of section indexes being/will be edited.
 * @param batched indicates whether the editing operation will be batched by the collectionView
 *
 * NOTE: when batched, used in combination with -collectionViewWillPerformBatchUpdates
 */
- (void)collectionViewWillEditSectionsAtIndexSet:(NSIndexSet *)indexes batched:(BOOL)batched;

/**
 * Informs the delegate that the collectionView is about to call performBatchUpdates
 */
- (void)collectionViewWillPerformBatchUpdates;

@end
