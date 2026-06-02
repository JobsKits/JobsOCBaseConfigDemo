//
//  ViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController.h"

#import "MapHandlerNode.h"

@interface ViewController ()

@end

@implementation ViewController


#pragma mark - Lifecycle

- (instancetype)init
{
  self = [super initWithNode:[[MapHandlerNode alloc] init]];
  if (self == nil) { return self; }

  return self;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  
  self.navigationController.navigationBarHidden = YES;
}

@end
