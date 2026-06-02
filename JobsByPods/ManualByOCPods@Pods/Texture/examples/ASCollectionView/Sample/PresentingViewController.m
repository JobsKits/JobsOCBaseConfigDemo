//
//  PresentingViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "PresentingViewController.h"
#import "ViewController.h"

@interface PresentingViewController ()

@end

@implementation PresentingViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Push Details"
                                                                            style:UIBarButtonItemStylePlain
                                                                           target:self
                                                                           action:@selector(pushNewViewController)];
}

- (void)pushNewViewController
{
  ViewController *controller = [[ViewController alloc] init];
  [self.navigationController pushViewController:controller animated:true];
}

@end
