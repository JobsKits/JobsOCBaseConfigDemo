//
//  PhotoFeedModel.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PhotoModel.h"
#import <IGListKit/IGListKit.h>

typedef NS_ENUM(NSInteger, PhotoFeedModelType) {
  PhotoFeedModelTypePopular,
  PhotoFeedModelTypeLocation,
  PhotoFeedModelTypeUserPhotos
};

@interface PhotoFeedModel : NSObject <IGListDiffable>

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithPhotoFeedModelType:(PhotoFeedModelType)type imageSize:(CGSize)size NS_DESIGNATED_INITIALIZER;

@property (nonatomic, readonly) NSArray<PhotoModel *> *photos;

- (NSUInteger)totalNumberOfPhotos;
- (NSUInteger)numberOfItemsInFeed;
- (PhotoModel *)objectAtIndex:(NSUInteger)index;
- (NSInteger)indexOfPhotoModel:(PhotoModel *)photoModel;

- (void)updatePhotoFeedModelTypeUserId:(NSUInteger)userID;

- (void)clearFeed;
- (void)requestPageWithCompletionBlock:(void (^)(NSArray *))block numResultsToReturn:(NSUInteger)numResults;
- (void)refreshFeedWithCompletionBlock:(void (^)(NSArray *))block numResultsToReturn:(NSUInteger)numResults;

@end
