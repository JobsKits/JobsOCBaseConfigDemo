//
//  NSObject+UUID.m
//  JobsDeviceInfo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+UUID.h"

#import "NSString+Replace.h"

@implementation NSObject (UUID)
-(JobsRetStrByVoidBlock _Nonnull)UUID{
    @jobs_weakify(self)
    return ^NSString *_Nullable{
        @jobs_strongify(self)
        if (!self) return nil;
        CFUUIDRef uuid_ref = CFUUIDCreate(kCFAllocatorDefault);
        CFStringRef uuid_string_ref = CFUUIDCreateString(kCFAllocatorDefault, uuid_ref);
        CFRelease(uuid_ref);
        NSString *uuid = JobsNonnullString([NSString stringWithString:(__bridge NSString*)uuid_string_ref], @"".jobsTr());
        CFRelease(uuid_string_ref);
        return uuid.lowercaseString;
    };
}

@end
