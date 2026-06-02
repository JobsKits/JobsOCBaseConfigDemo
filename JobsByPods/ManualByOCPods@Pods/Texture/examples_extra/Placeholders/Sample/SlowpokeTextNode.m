//
//  SlowpokeTextNode.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SlowpokeTextNode.h"

#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>

@interface ASTextNode (ForwardWorkaround)
// This is a workaround until subclass overriding of custom drawing class methods is fixed
- (void)drawRect:(CGRect)bounds withParameters:(id<NSObject>)parameters isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock isRasterizing:(BOOL)isRasterizing;
@end

@implementation SlowpokeTextNode

- (void)drawRect:(CGRect)bounds withParameters:(id<NSObject>)parameters isCancelled:(asdisplaynode_iscancelled_block_t)isCancelledBlock isRasterizing:(BOOL)isRasterizing
{
  usleep( (long)(1.0 * USEC_PER_SEC) ); // artificial delay of 1.0

  [super drawRect:bounds withParameters:parameters isCancelled:isCancelledBlock isRasterizing:isRasterizing];
}

@end
