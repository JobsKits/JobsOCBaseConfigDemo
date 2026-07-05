//
//  JobsGestureLockStorage.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockStorage.h"

@implementation JobsGestureLockStorage

+ (NSString *)gesturePasswordForKey:(NSString *)key {
    return [[NSUserDefaults standardUserDefaults] stringForKey:key];
}

+ (void)saveGesturePassword:(NSString *)password forKey:(NSString *)key {
    if (key.length == 0) {
        return;
    }

    [[NSUserDefaults standardUserDefaults] setObject:password forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)deleteGesturePasswordForKey:(NSString *)key {
    if (key.length == 0) {
        return;
    }

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
