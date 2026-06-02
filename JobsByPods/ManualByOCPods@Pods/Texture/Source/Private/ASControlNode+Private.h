//
//  ASControlNode+Private.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/ASControlNode.h>

@interface ASControlNode (Private)

#if TARGET_OS_TV
- (void)_pressDown;
#endif

@end
