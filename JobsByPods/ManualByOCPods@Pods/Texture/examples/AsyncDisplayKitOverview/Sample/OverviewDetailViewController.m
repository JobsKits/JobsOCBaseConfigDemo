//
//  OverviewDetailViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "OverviewDetailViewController.h"

@interface OverviewDetailViewController ()
@property (nonatomic, strong) ASDisplayNode *node;
@end

@implementation OverviewDetailViewController

#pragma mark - Lifecycle

- (instancetype)initWithNode:(ASDisplayNode *)node
{
    self = [super initWithNibName:nil bundle:nil];
    if (self == nil) { return self; }
    _node = node;
    return self;
}

#pragma mark - UIViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubnode:self.node];
}

- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    
    // Center node frame
    CGRect bounds = self.view.bounds;
    CGSize nodeSize = [self.node layoutThatFits:ASSizeRangeMake(CGSizeZero, bounds.size)].size;
    self.node.frame = CGRectMake(CGRectGetMidX(bounds) - (nodeSize.width / 2.0),
                                 CGRectGetMidY(bounds) - (nodeSize.height / 2.0),
                                 nodeSize.width,
                                 nodeSize.height);
}

@end
