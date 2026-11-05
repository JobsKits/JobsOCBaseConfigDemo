//
//  JobsGestureLockStorage.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockStorage.h"

static NSUserDefaults *JobsGestureLockDefaultsForKey(NSString *key) {
#if DEBUG
    if ([NSProcessInfo.processInfo.arguments containsObject:@"--jobs-coverage-route"] && [key hasPrefix:@"jobs.coverage.gesture."]) {
        static NSUserDefaults *defaults;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            NSString *suite = [(NSBundle.mainBundle.bundleIdentifier ?: @"com.jobs.demo") stringByAppendingString:@".jobs.coverage.gesture"];
            defaults = [NSUserDefaults.alloc initWithSuiteName:suite];
            [defaults removePersistentDomainForName:suite];
        });
        return defaults;
    }
#endif
    return NSUserDefaults.standardUserDefaults;
}

@implementation JobsGestureLockStorage

+(JobsRetStrByStrBlock _Nonnull)gesturePasswordForKey{
    return ^NSString *(NSString * key){
        return [JobsGestureLockDefaultsForKey(key) stringForKey:key];
    };
}

+ (void)saveGesturePassword:(NSString *)password forKey:(NSString *)key {
    if (key.length == 0) {
        return;
    }
    [JobsGestureLockDefaultsForKey(key) setObject:password forKey:key];
    [JobsGestureLockDefaultsForKey(key) synchronize];
}

+(jobsByStrBlock _Nonnull)deleteGesturePasswordForKey{
    return ^(NSString * key){
        if (key.length == 0) {
            return;
        }
        [JobsGestureLockDefaultsForKey(key) removeObjectForKey:key];
        [JobsGestureLockDefaultsForKey(key) synchronize];
    };
}

@end
