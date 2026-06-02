//
//  ASTableNode+Beta.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASTableNode.h>

@protocol ASBatchFetchingDelegate;

NS_ASSUME_NONNULL_BEGIN

@interface ASTableNode (Beta)

@property (nonatomic, weak) id<ASBatchFetchingDelegate> batchFetchingDelegate;

@end

NS_ASSUME_NONNULL_END
