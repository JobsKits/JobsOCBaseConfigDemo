//
//  AppDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"

#import "AsyncTableViewController.h"
#import "AsyncViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  
  UITabBarController *tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
  self.window.rootViewController = tabBarController;
  
  [tabBarController setViewControllers:@[[[AsyncTableViewController alloc] init], [[AsyncViewController alloc] init]]];
  
  [self.window makeKeyAndVisible];
  return YES;
}

@end
