//
//  ViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface ViewController ()
@property (nonatomic, strong) ASTextNode *textNode;
@end

@implementation ViewController

- (void)viewDidLoad
{
  self.textNode = [[ASTextNode alloc] init];
  self.textNode.attributedText = [[NSAttributedString alloc] initWithString:@"Testing, testing." attributes:@{ NSForegroundColorAttributeName: [UIColor redColor] }];
  [self.textNode layoutThatFits:ASSizeRangeMake(CGSizeZero, self.view.bounds.size)];
  self.textNode.frame = (CGRect){ .origin = CGPointZero, .size = self.textNode.calculatedSize };
  [self.view addSubnode:self.textNode];
}

@end
