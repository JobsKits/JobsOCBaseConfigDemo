//
//  ImageCellNode.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ImageCellNode.h"

@implementation ImageCellNode {
  ASImageNode *_imageNode;
}

- (id)initWithImage:(UIImage *)image
{
  self = [super init];
  if (self != nil) {
    _imageNode = [[ASImageNode alloc] init];
    _imageNode.image = image;
    [self addSubnode:_imageNode];
  }
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  CGSize imageSize = self.image.size;
  return [ASInsetLayoutSpec insetLayoutSpecWithInsets:UIEdgeInsetsZero
                                                child:[ASRatioLayoutSpec ratioLayoutSpecWithRatio:imageSize.height/imageSize.width
                                                                                            child:_imageNode]];
}

- (void)setImage:(UIImage *)image
{
  _imageNode.image = image;
}

- (UIImage *)image
{
  return _imageNode.image;
}

@end
