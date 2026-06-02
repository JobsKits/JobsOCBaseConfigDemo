//
//  ScreenNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ScreenNode : ASDisplayNode

@property (nonatomic, strong) ASMultiplexImageNode *imageNode;
@property (nonatomic, strong) ASButtonNode *buttonNode;

- (void)start;
- (void)reload;

@end
