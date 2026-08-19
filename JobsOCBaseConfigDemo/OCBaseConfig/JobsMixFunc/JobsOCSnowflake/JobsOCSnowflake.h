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
-(JobsRetNSNumberByVoidBlock _Nonnull)nextID;
-(JobsRetuint64_tByuint64_tBlock _Nonnull)timeWithID;
-(JobsRetuint32_tByuint64_tBlock _Nonnull)IDCWithID;
-(JobsRetuint32_tByuint64_tBlock _Nonnull)machineWithID;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsOCSnowflake
-(JobsRetJobsOCSnowflakeByuint32_tBlock _Nonnull)bySequence;
-(JobsRetJobsOCSnowflakeByuint64_tBlock _Nonnull)byLastGeneralMillisecond;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsOCSnowflake
@end
#endif /* JOBS_HEADER_GUARD_JOBSOCSNOWFLAKE_41ABEDCD2D */
