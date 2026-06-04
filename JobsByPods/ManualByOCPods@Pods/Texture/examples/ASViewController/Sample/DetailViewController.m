//
//  DetailViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "DetailViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

#import "DetailRootNode.h"

@implementation DetailViewController

#pragma mark - Rotation

- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator
{
    [super viewWillTransitionToSize:size withTransitionCoordinator:coordinator];
    [self.node.collectionNode.view.collectionViewLayout invalidateLayout];
}

@end
