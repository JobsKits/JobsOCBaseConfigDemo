//
//  PhotoFeedBaseController.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PhotoFeedControllerProtocol.h"

@protocol PhotoFeedControllerProtocol;
@class PhotoFeedModel;

@interface PhotoFeedBaseController : ASDKViewController <PhotoFeedControllerProtocol>

@property (nonatomic, strong, readonly) PhotoFeedModel *photoFeed;
@property (nonatomic, strong, readonly) UITableView *tableView;

- (void)refreshFeed;
- (void)insertNewRows:(NSArray *)newPhotos;

#pragma mark - Subclasses must override these methods

- (void)loadPage;

@end
