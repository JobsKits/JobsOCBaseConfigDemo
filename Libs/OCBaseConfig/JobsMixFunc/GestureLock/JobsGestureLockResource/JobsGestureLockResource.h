//
//  JobsGestureLockResource.h
//  JobsGestureLock
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSGESTURELOCKRESOURCE_5D61FB08EC
#define JOBS_HEADER_GUARD_JOBSGESTURELOCKRESOURCE_5D61FB08EC

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsGestureLockResource : NSObject

+ (nullable UIImage *)imageNamed:(NSString *)name;
+(JobsRetImageByStrBlock _Nonnull)imageNamed;
+ (JobsRetNSBundleByVoidBlock _Nonnull)resourceBundle;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSGESTURELOCKRESOURCE_5D61FB08EC */
