//
//  ImageCollectionViewCell.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ImageCollectionViewCell.h"

@implementation ImageCollectionViewCell
{
  UILabel *_title;
  UILabel *_description;
}

- (id)initWithFrame:(CGRect)aRect
{
  self = [super initWithFrame:aRect];
  if (self) {
    _title = [[UILabel alloc] init];
    _title.text = @"UICollectionViewCell";
    [self.contentView addSubview:_title];
    
    _description = [[UILabel alloc] init];
    _description.text = @"description for cell";
    [self.contentView addSubview:_description];
    
    self.contentView.backgroundColor = [UIColor orangeColor];
  }
  return self;
}

- (void)layoutSubviews
{
  [super layoutSubviews];
  
  [_title sizeToFit];
  [_description sizeToFit];
  
  CGRect frame = _title.frame;
  frame.origin.y = _title.frame.size.height;
  _description.frame = frame;
}

@end
