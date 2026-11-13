//
//  JobsARKitText.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年11月12日，星期四.
//

#import "JobsARKitText.h"

@implementation JobsARKitText

+(NSString *)text:(NSString *)key language:(NSString *)language {
    static NSDictionary *catalog;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSBundle.mainBundle URLForResource:@"JobsARKit" withExtension:@"json"];
        NSData *data = url ? [NSData dataWithContentsOfURL:url] : nil;
        catalog = data ? [NSJSONSerialization JSONObjectWithData:data options:0 error:nil] : @{};
    });
    return catalog[language][key] ?: catalog[@"en"][key] ?: key;
}

+(NSArray<NSString *> *)languageCodes {
    return @[@"zh-Hans", @"zh-Hant", @"bo", @"en", @"ja", @"fr", @"es", @"de", @"ru", @"ko"];
}

+(NSArray<NSString *> *)languageNames {
    return @[@"简体中文", @"繁體中文", @"བོད་ཡིག", @"English", @"日本語", @"Français", @"Español", @"Deutsch", @"Русский", @"한국어"];
}

@end
