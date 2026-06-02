//
//  ASSectionContext.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

@class ASCollectionView;

@protocol ASSectionContext

/**
 * Custom name of this section, for debugging only.
 */
@property (nonatomic, copy, nullable) NSString *sectionName;
@property (nonatomic, weak, nullable) ASCollectionView *collectionView;

@end
