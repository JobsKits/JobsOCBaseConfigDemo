//
//  NSObject+image.m
//  JobsSuspend
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+image.h"

@implementation NSObject (image)

-(nullable UIImage *)img{
    if (![self isKindOfClass:NSString.class]) return nil;
    NSString *name = [(NSString *)self stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    if (!name.length) return nil;
    UIImage *image = [UIImage imageNamed:name];
    if (image) return image;
    if ([name hasPrefix:@"/"]) return [UIImage imageWithContentsOfFile:name];
    return nil;
}

@end
