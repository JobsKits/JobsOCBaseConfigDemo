//
//  JobsGestureLockStorage.m
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsGestureLockStorage.h"

@implementation JobsGestureLockStorage
+(JobsRetStrByStrBlock _Nonnull)gesturePasswordForKey{
    return ^NSString *(NSString * key){
        return [[NSUserDefaults standardUserDefaults] stringForKey:key];
    };
}

+ (void)saveGesturePassword:(NSString *)password forKey:(NSString *)key {
    if (key.length == 0) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:password forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(jobsByStrBlock _Nonnull)deleteGesturePasswordForKey{
    return ^(NSString * key){
        if (key.length == 0) {
            return;
        }
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    };
}

@end
