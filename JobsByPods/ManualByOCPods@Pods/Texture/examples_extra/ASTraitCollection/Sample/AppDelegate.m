//
//  AppDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import "TableViewController.h"
#import "CollectionViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  UITabBarController *tabController = [[UITabBarController alloc] init];
  [tabController setViewControllers:@[[[ViewController alloc] init], [[TableViewController alloc] init], [[CollectionViewController alloc] init]]];
  self.window.rootViewController = tabController;
  [self.window makeKeyAndVisible];
  return YES;
}

@end
