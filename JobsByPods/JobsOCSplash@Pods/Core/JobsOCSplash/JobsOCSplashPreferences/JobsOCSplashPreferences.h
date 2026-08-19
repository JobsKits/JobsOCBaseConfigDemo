//
//  JobsOCSplashPreferences.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashPreferences_h
#define JobsOCSplashPreferences_h

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCSplash/JobsOCSplashConfiguration.h>)
#import <JobsOCSplash/JobsOCSplashConfiguration.h>
#else
#import "JobsOCSplashConfiguration.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashPreferences : NSObject

+(JobsRetBOOLByVoidBlock _Nonnull)isEnabledForNextLaunch;
+(jobsByBOOLBlock _Nonnull)setEnabledForNextLaunch;
+(JobsRetBOOLByVoidBlock _Nonnull)toggleForNextLaunch;
+(JobsRetJobsOCSplashContentTypeByVoidBlock _Nonnull)contentTypeForNextLaunch;
+(jobsByJobsOCSplashContentTypeBlock _Nonnull)setContentTypeForNextLaunch;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashPreferences_h */
