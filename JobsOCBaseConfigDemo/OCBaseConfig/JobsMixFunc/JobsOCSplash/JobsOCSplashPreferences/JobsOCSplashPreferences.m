//
//  JobsOCSplashPreferences.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashPreferences.h"

static NSString * const JobsOCSplashEnabledKey = @"JobsOCSplash.isEnabledForNextLaunch";

@implementation JobsOCSplashPreferences
+(BOOL)isEnabledForNextLaunch {
    if (![NSUserDefaults.standardUserDefaults objectForKey:JobsOCSplashEnabledKey]) return YES;
    return [NSUserDefaults.standardUserDefaults boolForKey:JobsOCSplashEnabledKey];
}

+(void)setEnabledForNextLaunch:(BOOL)enabled {
    [NSUserDefaults.standardUserDefaults setBool:enabled forKey:JobsOCSplashEnabledKey];
}

+(BOOL)toggleForNextLaunch {
    BOOL enabled = !self.isEnabledForNextLaunch;
    [self setEnabledForNextLaunch:enabled];
    return enabled;
}

@end
