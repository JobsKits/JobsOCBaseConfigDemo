//
//  KittenNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

/**
 * Social media-style node that displays a kitten picture and a random length
 * of lorem ipsum text.  Uses a placekitten.com kitten of the specified size.
 */
@interface KittenNode : ASCellNode

- (instancetype)initWithKittenOfSize:(CGSize)size;

- (void)toggleImageEnlargement;

@end
