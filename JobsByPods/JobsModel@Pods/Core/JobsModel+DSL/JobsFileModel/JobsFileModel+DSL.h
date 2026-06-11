//
//  JobsFileModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_AB5AA8E11CF4D256
#define JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_AB5AA8E11CF4D256

#if __has_include(<JobsModel/JobsFileModel.h>)
#import <JobsModel/JobsFileModel.h>
#else
#import "JobsFileModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsFileModel (DSL)

#pragma mark —— 来自 JobsFileModel
-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSInteger data))byID;
-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSString * data))byFileName;
-(__kindof JobsFileModel *_Nonnull (^ _Nonnull)(NSData * data))byFile;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSFILEMODEL_DSL_AB5AA8E11CF4D256 */
