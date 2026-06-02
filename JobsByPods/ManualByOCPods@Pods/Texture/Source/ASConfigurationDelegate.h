//
//  ASConfigurationDelegate.h
//  Texture
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/ASConfiguration.h>

NS_ASSUME_NONNULL_BEGIN

/**
 * Used to communicate configuration-related events to the client.
 */
@protocol ASConfigurationDelegate <NSObject>

/**
 * Texture performed its first behavior related to the feature(s).
 * This can be useful for tracking the impact of the behavior (A/B testing).
 */
- (void)textureDidActivateExperimentalFeatures:(ASExperimentalFeatures)features;

@optional

/**
 * Texture framework initialized. This method is called synchronously
 * on the main thread from ASInitializeFrameworkMainThread if you defined
 * AS_INITIALIZE_FRAMEWORK_MANUALLY or otherwise from the default initialization point
 * (currently a static constructor, called before main()).
 */
- (void)textureDidInitialize;

@end

NS_ASSUME_NONNULL_END
