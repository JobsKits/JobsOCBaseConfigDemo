//
//  NSString+Extra.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSString+Extra.h"

@implementation NSString (Extra)
+(NSString *)nullableString:(id)nullableString
              replaceString:(NSString *)replaceString{
    NSString *fallback = replaceString.length ? replaceString : @"No Data";
    if (!nullableString || nullableString == NSNull.null) return fallback;
    if ([nullableString isKindOfClass:NSString.class]) {
        NSString *str = ((NSString *)nullableString).byTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet);
        return str.length ? str : fallback;
    }
    if ([nullableString isKindOfClass:NSNumber.class]) {
        return [(NSNumber *)nullableString stringValue];
    };return fallback;
}

@end
