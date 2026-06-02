//
//  ASMainSerialQueue.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASBaseDefines.h>

AS_SUBCLASSING_RESTRICTED
@interface ASMainSerialQueue : NSObject

@property (nonatomic, readonly) NSUInteger numberOfScheduledBlocks;
- (void)performBlockOnMainThread:(dispatch_block_t)block;

@end
