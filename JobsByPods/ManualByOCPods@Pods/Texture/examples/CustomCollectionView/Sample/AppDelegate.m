//
//  AppDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "AppDelegate.h"

#import "ViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:UIScreen.mainScreen.bounds];
  self.window.backgroundColor = [UIColor whiteColor];
  self.window.rootViewController = [[ViewController alloc] init];

  [self.window makeKeyAndVisible];
  
  return YES;
}

@end
