//
//  JobsOCSnowflake.h
//  JobsOCSnowflake
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCSNOWFLAKE_41ABEDCD2D
#define JOBS_HEADER_GUARD_JOBSOCSNOWFLAKE_41ABEDCD2D

#import <Foundation/Foundation.h>
#include <unistd.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

@interface JobsOCSnowflake : NSObject

-(instancetype _Nonnull)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine;
-(nullable NSNumber *)nextID;
-(uint64_t)timeWithID:(uint64_t)id;
-(uint32_t)IDCWithID:(uint64_t)id;
-(uint32_t)machineWithID:(uint64_t)id;

@end
#endif /* JOBS_HEADER_GUARD_JOBSOCSNOWFLAKE_41ABEDCD2D */
