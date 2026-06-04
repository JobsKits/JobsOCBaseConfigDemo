//
//  TableViewController.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TableViewController.h"
#import "KittenNode.h"

@interface TableViewController () <ASTableViewDataSource, ASTableViewDelegate>
@property (nonatomic, strong) ASTableNode *tableNode;

@end

@implementation TableViewController

- (instancetype)init
{
  ASTableNode *tableNode = [[ASTableNode alloc] init];
  if (!(self = [super initWithNode:tableNode]))
    return nil;
  
  _tableNode = tableNode;
  tableNode.delegate = self;
  tableNode.dataSource = self;
  self.title = @"Table Node";
  return self;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  self.tableNode.view.contentInset = UIEdgeInsetsMake(CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame]), 0, CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
}

#pragma mark -
#pragma mark ASTableView.

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (ASCellNode *)tableView:(ASTableView *)tableView nodeForRowAtIndexPath:(NSIndexPath *)indexPath
{
  KittenNode *cell = [[KittenNode alloc] init];
  cell.imageTappedBlock = ^{
    [KittenNode defaultImageTappedAction:self];
  };
  return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return 15;
}

@end
