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

/// 非法节点或未来 epoch 返回 nil；同节点跨实例/进程需由调用方唯一分配。
-(instancetype _Nullable)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine;
/// 注入毫秒时钟用于确定性回归；生产默认使用系统墙钟。
-(instancetype _Nullable)initWithPublishMillisecond:(uint64_t)publishMillisecond
                                             IDCID:(uint32_t)IDC
                                         machineID:(uint32_t)machine
                                             clock:(JobsRetuint64_tByVoidBlock _Nullable)clock;
/// 逻辑时钟最多领先墙钟 5 秒；超过容忍值或41位时间耗尽时返回 nil。
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
