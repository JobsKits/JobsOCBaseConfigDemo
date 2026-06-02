//
//  ItemNode.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ItemNode.h"

@implementation ItemNode

- (instancetype)initWithString:(NSString *)string
{
  self = [super init];
  
  if (self != nil) {
    self.text = string;
    [self updateBackgroundColor];
  }
  
  return self;
}

- (void)updateBackgroundColor
{
  if (self.highlighted) {
    self.backgroundColor = [UIColor grayColor];
  } else if (self.selected) {
    self.backgroundColor = [UIColor darkGrayColor];
  } else {
    self.backgroundColor = [UIColor lightGrayColor];
  }
}

- (void)setSelected:(BOOL)selected
{
  [super setSelected:selected];
  
  [self updateBackgroundColor];
}

- (void)setHighlighted:(BOOL)highlighted
{
  [super setHighlighted:highlighted];
  
  [self updateBackgroundColor];
}

@end
