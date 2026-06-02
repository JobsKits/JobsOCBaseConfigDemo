//
//  AsyncViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AsyncViewController.h"
#import "RandomCoreGraphicsNode.h"

@implementation AsyncViewController

- (instancetype)init
{
  if (!(self = [super initWithNode:[[RandomCoreGraphicsNode alloc] init]])) {
    return nil;
  }

  self.neverShowPlaceholders = YES;
  self.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:0];
  return self;
}

- (void)viewWillAppear:(BOOL)animated
{
  // FIXME: This is only being called on the first time the UITabBarController shows us.
  [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [self.node recursivelyClearContents];
  [super viewDidDisappear:animated];
}

@end
