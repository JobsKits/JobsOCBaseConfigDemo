//
//  ItemNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "ItemViewModel.h"

@interface ItemNode : ASCellNode

+ (CGSize)sizeForWidth:(CGFloat)width;
+ (CGSize)preferredViewSize;

@end
