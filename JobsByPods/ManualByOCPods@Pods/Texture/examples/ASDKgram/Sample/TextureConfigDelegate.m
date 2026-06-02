//
//  TextureConfigDelegate.m
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <AsyncDisplayKit/AsyncDisplayKit.h>

@interface TextureConfigDelegate : NSObject <ASConfigurationDelegate>

@end

@implementation ASConfiguration (UserProvided)

+ (ASConfiguration *)textureConfiguration
{
  ASConfiguration *config = [[ASConfiguration alloc] init];
  config.experimentalFeatures = ASExperimentalTextNode;
  config.delegate = [[TextureConfigDelegate alloc] init];
  return config;
}

@end

@implementation TextureConfigDelegate

- (void)textureDidActivateExperimentalFeatures:(ASExperimentalFeatures)features
{
  if (features & ASExperimentalTextNode) {
    NSLog(@"Texture activated experimental text node.");
  }
}

@end

