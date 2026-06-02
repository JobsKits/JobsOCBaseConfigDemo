#import "DKDiskSpace.h"

@implementation DKDiskSpace

+ (nullable NSDictionary<NSString *, NSNumber *> *)volumes {
    NSURL *homeURL = [NSURL fileURLWithPath:NSHomeDirectory() isDirectory:YES];
    NSError *error = nil;

    NSSet<NSURLResourceKey> *keys = [NSSet setWithArray:@[
        NSURLVolumeTotalCapacityKey,
        NSURLVolumeAvailableCapacityKey,
        NSURLVolumeAvailableCapacityForImportantUsageKey,
        NSURLVolumeAvailableCapacityForOpportunisticUsageKey
    ]];

    NSDictionary<NSURLResourceKey, id> *values = [homeURL resourceValuesForKeys:keys error:&error];
    if (error || !values) return nil;

    NSMutableDictionary<NSString *, NSNumber *> *out = [NSMutableDictionary dictionary];
    for (NSURLResourceKey key in keys) {
        id v = values[key];
        if ([v respondsToSelector:@selector(longLongValue)]) {
            out[key] = @([v longLongValue]);
        }
    }
    return out.copy;
}

@end
