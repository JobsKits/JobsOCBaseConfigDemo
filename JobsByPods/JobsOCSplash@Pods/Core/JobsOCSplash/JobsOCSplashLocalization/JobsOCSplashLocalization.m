//
//  JobsOCSplashLocalization.m
//  JobsOCSplash
//
//  Created by Jobs on 2026年6月23日，星期二.
//

#import "JobsOCSplashLocalization.h"

@interface JobsOCSplashBundleToken : NSObject

@end

@implementation JobsOCSplashBundleToken

@end

@implementation JobsOCSplashLocalization
+(NSString *)skipTitleWithLanguageCode:(NSString *)languageCode
                      remainingSeconds:(NSNumber *)remainingSeconds {
    NSBundle *bundle = [self localizedBundleWithLanguageCode:languageCode];
    NSString *skip = [bundle localizedStringForKey:@"jobs_splash_skip" value:@"Skip" table:nil];
    if (!remainingSeconds) return skip;
    NSString *format = [bundle localizedStringForKey:@"jobs_splash_countdown_format" value:@"%@ %ld" table:nil];
    return [NSString stringWithFormat:format, skip, remainingSeconds.integerValue];
}

+(NSBundle *)localizedBundleWithLanguageCode:(NSString *)languageCode {
    NSBundle *resourceBundle = [self resourceBundle];
    NSString *rawCode = languageCode.length ? languageCode : NSLocale.preferredLanguages.firstObject ?: @"en";
    for (NSString *candidate in [self languageCandidates:rawCode]) {
        NSString *path = [resourceBundle pathForResource:candidate ofType:@"lproj"];
        NSBundle *bundle = path ? [NSBundle bundleWithPath:path] : nil;
        if (bundle) return bundle;
    };return resourceBundle;
}

+(NSBundle *)resourceBundle {
    NSBundle *sourceBundle = [NSBundle bundleForClass:JobsOCSplashBundleToken.class];
    NSURL *url = [sourceBundle URLForResource:@"JobsOCSplashResources" withExtension:@"bundle"];
    NSBundle *bundle = url ? [NSBundle bundleWithURL:url] : nil;
    return bundle ?: sourceBundle;
}

+(NSArray<NSString *> *)languageCandidates:(NSString *)rawCode {
    NSString *code = [rawCode stringByReplacingOccurrencesOfString:@"_" withString:@"-"];
    NSString *lowercaseCode = code.lowercaseString;
    if ([lowercaseCode hasPrefix:@"zh-hant"] || [lowercaseCode hasPrefix:@"zh-tw"] || [lowercaseCode hasPrefix:@"zh-hk"]) {
        return @[@"zh-Hant", @"zh-Hans", @"en"];
    }
    if ([lowercaseCode hasPrefix:@"zh"]) {
        return @[@"zh-Hans", @"zh-Hant", @"en"];
    }
    NSString *language = [code componentsSeparatedByString:@"-"].firstObject ?: @"en";
    return @[code, language, @"en"];
}

@end
