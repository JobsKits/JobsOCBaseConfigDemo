//
//  ViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController.h"
#import "KittenNode.h"
#import "OverrideViewController.h"

#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import <AsyncDisplayKit/ASAssert.h>

@interface ViewController ()
@end

@implementation ViewController

#pragma mark -
#pragma mark UIViewController.

- (instancetype)init
{
  KittenNode *displayNode = [[KittenNode alloc] init];
  if (!(self = [super initWithNode:displayNode]))
    return nil;

  self.title = @"Display Node";
  displayNode.imageTappedBlock = ^{
    [KittenNode defaultImageTappedAction:self];
  };
  return self;
}

- (void)viewWillLayoutSubviews
{
  [super viewWillLayoutSubviews];
}

@end
