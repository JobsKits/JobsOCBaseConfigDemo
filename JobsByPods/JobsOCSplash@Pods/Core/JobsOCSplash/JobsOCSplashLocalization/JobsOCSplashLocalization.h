//
//  JobsOCSplashLocalization.h
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#ifndef JobsOCSplashLocalization_h
#define JobsOCSplashLocalization_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCSplashLocalization : NSObject

+(NSString *)skipTitleWithLanguageCode:(NSString *_Nullable)languageCode
                      remainingSeconds:(NSNumber *_Nullable)remainingSeconds;

@end

NS_ASSUME_NONNULL_END

#endif /* JobsOCSplashLocalization_h */
