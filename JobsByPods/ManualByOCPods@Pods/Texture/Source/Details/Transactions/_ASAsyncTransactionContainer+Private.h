//
//  _ASAsyncTransactionContainer+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@class _ASAsyncTransaction;

@interface CALayer (ASAsyncTransactionContainerTransactions)
@property (nonatomic, nullable, setter=asyncdisplaykit_setAsyncLayerTransactions:) NSMutableSet<_ASAsyncTransaction *> *asyncdisplaykit_asyncLayerTransactions;

- (void)asyncdisplaykit_asyncTransactionContainerWillBeginTransaction:(_ASAsyncTransaction *)transaction;
- (void)asyncdisplaykit_asyncTransactionContainerDidCompleteTransaction:(_ASAsyncTransaction *)transaction;
@end

NS_ASSUME_NONNULL_END
