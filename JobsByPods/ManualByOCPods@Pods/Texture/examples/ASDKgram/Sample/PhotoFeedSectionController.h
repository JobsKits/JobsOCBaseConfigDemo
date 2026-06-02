//
//  PhotoFeedSectionController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <IGListKit/IGListKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "RefreshingSectionControllerType.h"
#import "ASCollectionSectionController.h"

@class PhotoFeedModel;

NS_ASSUME_NONNULL_BEGIN

@interface PhotoFeedSectionController : ASCollectionSectionController <ASSectionController, RefreshingSectionControllerType>

@property (nonatomic, strong, nullable) PhotoFeedModel *photoFeed;

@end

NS_ASSUME_NONNULL_END
