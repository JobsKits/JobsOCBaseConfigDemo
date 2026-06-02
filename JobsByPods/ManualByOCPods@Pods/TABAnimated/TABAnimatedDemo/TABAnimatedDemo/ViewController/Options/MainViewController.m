//
//  MainViewController.m
//  TABAnimated
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "MainViewController.h"
#import <TABAnimated/TABDefine.h>
#import <TABAnimated/AppDelegate.h>
#import "SencondaryOptionViewController.h"

#import <TABAnimated/TABAnimatedControllerUIInterface.h>
#import <TABAnimated/TABAnimatedControllerUIImpl.h>

@interface MainViewController()

@property (nonatomic, strong) id <TABAnimatedControllerUIInterface> rightButtonInterface;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _rightButtonInterface = TABAnimatedControllerUIImpl.new;
    [_rightButtonInterface addRightButtonWithText:@"" controller:self clickButtonBlock:^(UIButton *btn) {
        
    }];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SencondaryOptionViewController *vc = SencondaryOptionViewController.new;
    vc.index = indexPath.row;
    vc.title = self.titleArray[indexPath.row];
    [kAPPDELEGATE.nav pushViewController:vc animated:YES];
}

- (NSArray *)titleArray {
    return @[
        kText(@"UITableView 示例"),
        kText(@"UICollectionView 示例"),
        kText(@"自定义UIView 示例"),
    ];
}

- (NSArray *)controllerClassArray {
    return @[
        @"SencondaryOptionViewController",
        @"SencondaryOptionViewController",
        @"SencondaryOptionViewController",
    ];
}

@end
