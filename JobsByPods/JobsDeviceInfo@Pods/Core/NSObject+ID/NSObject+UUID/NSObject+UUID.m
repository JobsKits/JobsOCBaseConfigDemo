//
//  NSObject+UUID.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+UUID.h"
#import <JobsDeviceInfo/NSString+Replace.h>

@implementation NSObject (UUID)

-(NSString *)UUID{
    CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
    CFStringRef uuid_string_ref = CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = JobsNonnullString([NSString stringWithString:(__bridge NSString*)uuid_string_ref], @"".tr);
    CFRelease(uuid_string_ref);
    return uuid.lowercaseString;
}

@end
