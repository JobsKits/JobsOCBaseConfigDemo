//
//  SupplementaryNode.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "SupplementaryNode.h"

#import <AsyncDisplayKit/ASDisplayNode+Subclasses.h>
#import <AsyncDisplayKit/ASInsetLayoutSpec.h>
#import <AsyncDisplayKit/ASCenterLayoutSpec.h>

static CGFloat kInsets = 15.0;

@interface SupplementaryNode ()
@property (nonatomic, strong) ASTextNode *textNode;

@end

@implementation SupplementaryNode

- (instancetype)initWithText:(NSString *)text
{
  self = [super init];
  
  if (self != nil) {
    _textNode = [[ASTextNode alloc] init];
    _textNode.attributedText = [[NSAttributedString alloc] initWithString:text
                                                                 attributes:[self textAttributes]];
    [self addSubnode:_textNode];
  }
  
  return self;
}

- (ASLayoutSpec *)layoutSpecThatFits:(ASSizeRange)constrainedSize
{
  ASCenterLayoutSpec *center = [[ASCenterLayoutSpec alloc] init];
  center.centeringOptions = ASCenterLayoutSpecCenteringXY;
  center.child = self.textNode;
  UIEdgeInsets insets = UIEdgeInsetsMake(kInsets, kInsets, kInsets, kInsets);
  
  return [ASInsetLayoutSpec insetLayoutSpecWithInsets:insets child:center];
}

#pragma mark - Text Formatting

- (NSDictionary *)textAttributes
{
  return @{
    NSFontAttributeName: [UIFont systemFontOfSize:18.0],
    NSForegroundColorAttributeName: [UIColor whiteColor],
  };
}

@end
