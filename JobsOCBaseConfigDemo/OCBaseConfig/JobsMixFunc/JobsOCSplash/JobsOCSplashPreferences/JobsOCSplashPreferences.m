//
//  JobsOCSplashPreferences.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashPreferences.h"

static NSString * const JobsOCSplashEnabledKey = @"JobsOCSplash.isEnabledForNextLaunch";
static NSString * const JobsOCSplashContentTypeKey = @"com.jobs.splash.contentTypeForNextLaunch";

@implementation JobsOCSplashPreferences
+(JobsRetBOOLByVoidBlock _Nonnull)isEnabledForNextLaunch {
    return ^BOOL{
        if (![NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledKey]) return YES;
        return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCSplashEnabledKey];
    };
}

+(jobsByBOOLBlock _Nonnull)setEnabledForNextLaunch{
    return ^(BOOL enabled){
        [NSUserDefaults.standardUserDefaults setBool:enabled forKey:JobsOCSplashEnabledKey];
    };
}

+(JobsRetBOOLByVoidBlock _Nonnull)toggleForNextLaunch {
    return ^BOOL{
        BOOL enabled = !self.isEnabledForNextLaunch();
        self.setEnabledForNextLaunch(enabled);
        return enabled;
    };
}

+(JobsRetJobsOCSplashContentTypeByVoidBlock _Nonnull)contentTypeForNextLaunch {
    return ^JobsOCSplashContentType{
        NSInteger rawValue = [NSUserDefaults.standardUserDefaults integerForKey:JobsOCSplashContentTypeKey];
        if (rawValue < JobsOCSplashContentTypeLocalImage || rawValue > JobsOCSplashContentTypeRemoteVideo) {
            return JobsOCSplashContentTypeLocalImage;
        };return (JobsOCSplashContentType)rawValue;
    };
}

+(jobsByJobsOCSplashContentTypeBlock _Nonnull)setContentTypeForNextLaunch{
    return ^(JobsOCSplashContentType contentType){
        [NSUserDefaults.standardUserDefaults setInteger:contentType
                                                 forKey:JobsOCSplashContentTypeKey];
    };
}

@end
