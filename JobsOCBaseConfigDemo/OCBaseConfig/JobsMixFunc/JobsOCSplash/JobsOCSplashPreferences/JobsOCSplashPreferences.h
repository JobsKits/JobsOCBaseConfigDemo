//
//  JobsOCSplashPreferences.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashPreferences_h
#define JobsOCSplashPreferences_h

#import <Foundation/Foundation.h>
#import "JobsOCSplashConfiguration.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashPreferences : NSObject

+(BOOL)isEnabledForNextLaunch;
+(void)setEnabledForNextLaunch:(BOOL)enabled;
+(BOOL)toggleForNextLaunch;
+(JobsOCSplashContentType)contentTypeForNextLaunch;
+(void)setContentTypeForNextLaunch:(JobsOCSplashContentType)contentType;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashPreferences_h */
