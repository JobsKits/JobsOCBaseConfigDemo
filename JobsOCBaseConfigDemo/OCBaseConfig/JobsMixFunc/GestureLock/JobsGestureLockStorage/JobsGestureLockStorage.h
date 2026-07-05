//
//  JobsGestureLockStorage.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockStorage : NSObject

+ (nullable NSString *)gesturePasswordForKey:(NSString *)key;
+ (void)saveGesturePassword:(NSString *)password forKey:(NSString *)key;
+ (void)deleteGesturePasswordForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2 */
