//
//  JobsStringUtils.m
//  JobsStringUtils
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsStringUtils.h"

NSMutableString *JobsMutableString(NSString * _Nullable value) {
    return [NSMutableString stringWithString:value ?: @""];
}

NSURL * _Nullable JobsUrl(NSString * _Nullable value) {
    if (!isValue(value)) return nil;
    return [NSURL URLWithString:value];
}

NSURL * _Nullable JobsFileUrl(NSString * _Nullable value) {
    if (!isValue(value)) return nil;
    return [NSURL fileURLWithPath:value];
}
/// 要判nil和NULL，必须用类方法或者内联函数，在实例方法里面nil和NULL会被包装为空串
BOOL isNull(id _Nullable value) {
    if (value == nil || value == NULL) return YES;
    if ((NSNull *)value == NSNull.null) return YES;
    if ([value isKindOfClass:NSNull.class]) return YES;
    if ([value isKindOfClass:NSString.class]) {
        NSString *string = (NSString *)value;
        if ([string isEqualToString:@"(null)"]) return YES;
        if ([string isEqualToString:@"null"]) return YES;
        if ([string isEqualToString:@"<null>"]) return YES;
        if ([string isEqualToString:@""]) return YES;
        return ![string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length;
    }

    NSString *string = [NSString stringWithFormat:@"%@", value];
    return ![string stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet].length;
}

BOOL isValue(id _Nullable value) {
    return !isNull(value);
}

BOOL JobsCanOpenUrl(NSString * _Nullable value) {
    NSURL *url = JobsUrl(value);
    if (!url) return NO;
    return [UIApplication.sharedApplication canOpenURL:url];
}

NSString *Guard(NSString * _Nullable value) {
    return isValue(value) ? value : @"";
}

NSString *_Nonnull toStringByFloatDecimalPlaces(float i, NSUInteger decimalPlaces) {
    return [NSString stringWithFormat:[NSString stringWithFormat:@"%%.%luf", (unsigned long)decimalPlaces], i];
}

NSString *_Nonnull StringWithUTF8String(const char * _Nullable value) {
    return value ? [NSString stringWithUTF8String:value] : @"";
}

NSString *_Nonnull JobsFormattedString(NSString *format, ...) {
    va_list args;
    va_start(args, format);
    NSString *formattedString = [NSString.alloc initWithFormat:format arguments:args];
    va_end(args);
    return formattedString;
}

NSString *_Nonnull toStringByID(id _Nullable i) {
    return FORMAT_STRING(@"%@", i);
}

NSString *_Nonnull toStringByInt(int i) {
    return FORMAT_STRING(@"%d", i);
}

NSString *_Nonnull toStringByFloat(float i) {
    return FORMAT_STRING(@"%f", i);
}

NSString *_Nonnull toStringByDouble(double i) {
    return FORMAT_STRING(@"%f", i);
}

NSString *_Nonnull toStringByShort(short i) {
    return FORMAT_STRING(@"%c", i);
}

NSString *_Nonnull toStringByUnsignedShort(unsigned short i) {
    return FORMAT_STRING(@"%c", i);
}

NSString *_Nonnull toStringByNSInteger(NSInteger i) {
    return FORMAT_STRING(@"%ld", (long)i);
}

NSString *_Nonnull toStringByNSUInteger(NSUInteger i) {
    return FORMAT_STRING(@"%lu", (unsigned long)i);
}

NSString *_Nonnull toStringByLong(long i) {
    return FORMAT_STRING(@"%ld", i);
}

NSString *_Nonnull toStringByLongLong(long long i) {
    return FORMAT_STRING(@"%lld", i);
}

NSString *_Nonnull toStringByChar(char i) {
    return FORMAT_STRING(@"%c", i);
}

NSString *_Nonnull toStringByUnsignedChar(unsigned char i) {
    return FORMAT_STRING(@"%c", i);
}
