//
//  AppDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"

#import "ViewController.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  self.window.backgroundColor = [UIColor whiteColor];
  self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[ViewController alloc] init]];
  [self.window makeKeyAndVisible];
  return YES;
}

@end

@implementation ASConfiguration (UserProvided)

+ (ASConfiguration *)textureConfiguration
{
  ASConfiguration *configuration = [ASConfiguration new];
  return configuration;
  
}

@end
