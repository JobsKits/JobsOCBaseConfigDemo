//
//  KittenNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface KittenNode : ASCellNode
@property (nonatomic, strong, readonly) ASNetworkImageNode *imageNode;
@property (nonatomic, strong, readonly) ASTextNode *textNode;

@property (nonatomic, copy) dispatch_block_t imageTappedBlock;

// The default action when an image node is tapped. This action will create an
// OverrideVC and override its display traits to always be compact.
+ (void)defaultImageTappedAction:(ASDKViewController *)sourceViewController;
@end
