//
//  AppDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"

#import "TabBarController.h"
#import "CollectionViewController.h"
#import "ViewController.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];

  ViewController *viewController = [[ViewController alloc] init];
  viewController.tabBarItem.title = @"TextStress";

  CollectionViewController *cvc = [[CollectionViewController alloc] init];
  cvc.tabBarItem.title = @"Flexbox";

  TabBarController *tabBarController = [[TabBarController alloc] init];
  tabBarController.viewControllers = @[cvc, viewController];

  self.window.rootViewController = tabBarController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
