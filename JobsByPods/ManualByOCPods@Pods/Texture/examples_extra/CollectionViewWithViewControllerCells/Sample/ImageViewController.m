//
//  ImageViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ImageViewController.h"

@interface ImageViewController ()
@property (nonatomic) UIImageView *imageView;

@end

@implementation ImageViewController

- (instancetype)initWithImage:(UIImage *)image {
  if (!(self = [super init])) { return nil; }
  
  self.imageView = [[UIImageView alloc] initWithImage:image];
  
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  [self.view addSubview:self.imageView];
  
  UIGestureRecognizer *tap = [[UIGestureRecognizer alloc] initWithTarget:self action:@selector(tapped)];
  [self.view addGestureRecognizer:tap];

  self.imageView.contentMode = UIViewContentModeScaleAspectFill;
}

- (void)tapped
{
  NSLog(@"tapped!");
}

- (void)viewWillLayoutSubviews
{
  self.imageView.frame = self.view.bounds;
}

@end
