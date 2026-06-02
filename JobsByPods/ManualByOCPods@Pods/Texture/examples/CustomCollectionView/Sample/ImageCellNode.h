//
//  ImageCellNode.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ImageCellNode : ASCellNode

- (instancetype)initWithImage:(UIImage *)image;
@property (nonatomic, strong) UIImage *image;

@end
