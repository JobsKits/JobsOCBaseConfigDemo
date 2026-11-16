//
//  JobsGestureLockStorage.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2

#import <Foundation/Foundation.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockStorage : NSObject

+(JobsRetStrByStrBlock _Nonnull)gesturePasswordForKey;
+ (void)saveGesturePassword:(NSString *)password forKey:(NSString *)key;
+(jobsByStrBlock _Nonnull)deleteGesturePasswordForKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKSTORAGE_71F4ED9BD2 */
