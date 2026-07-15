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

#import "JobsDefines.h"
#import "JobsBlock.h"

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
