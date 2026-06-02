//
//  PageNode.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PageNode.h"

@implementation PageNode

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize
{
  return constrainedSize;
}

- (void)didEnterPreloadState
{
  [super didEnterPreloadState];
  NSLog(@"didEnterPreloadState for node: %@", self);
}

@end
