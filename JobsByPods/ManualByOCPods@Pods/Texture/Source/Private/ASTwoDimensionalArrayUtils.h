//
//  ASTwoDimensionalArrayUtils.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#import <AsyncDisplayKit/ASBaseDefines.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Helper functions for two-dimensional array, where the objects of the root array are each arrays.
 */

/**
 * Deep mutable copy of an array that contains arrays, which contain objects.  It will go one level deep into the array to copy.
 * This method is substantially faster than the generalized version, e.g. about 10x faster, so use it whenever it fits the need.
 */
ASDK_EXTERN NSMutableArray<NSMutableArray *> *ASTwoDimensionalArrayDeepMutableCopy(NSArray<NSArray *> *array) AS_WARN_UNUSED_RESULT;

/**
 * Delete the elements of the mutable two-dimensional array at given index paths – sorted in descending order!
 */
ASDK_EXTERN void ASDeleteElementsInTwoDimensionalArrayAtIndexPaths(NSMutableArray *mutableArray, NSArray<NSIndexPath *> *indexPaths);

/**
 * Return all the index paths of a two-dimensional array, in ascending order.
 */
ASDK_EXTERN NSArray<NSIndexPath *> *ASIndexPathsForTwoDimensionalArray(NSArray<NSArray *>* twoDimensionalArray) AS_WARN_UNUSED_RESULT;

/**
 * Return all the elements of a two-dimensional array, in ascending order.
 */
ASDK_EXTERN NSArray *ASElementsInTwoDimensionalArray(NSArray<NSArray *>* twoDimensionalArray) AS_WARN_UNUSED_RESULT;

/**
 * Attempt to get the object at the given index path. Returns @c nil if the index path is out of bounds.
 */
ASDK_EXTERN id _Nullable ASGetElementInTwoDimensionalArray(NSArray<NSArray *> *array, NSIndexPath *indexPath) AS_WARN_UNUSED_RESULT;

NS_ASSUME_NONNULL_END
