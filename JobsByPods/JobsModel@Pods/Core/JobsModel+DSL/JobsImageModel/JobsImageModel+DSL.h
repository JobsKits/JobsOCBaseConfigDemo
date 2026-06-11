//
//  JobsImageModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_64D4F10276AE040E
#define JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_64D4F10276AE040E

#if __has_include(<JobsModel/JobsImageModel.h>)
#import <JobsModel/JobsImageModel.h>
#else
#import "JobsImageModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsImageModel (DSL)

#pragma mark —— 来自 JobsImageModel
-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(UIImage * data))byImage;
-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byInfo;
-(__kindof JobsImageModel *_Nonnull (^ _Nonnull)(NSDictionary * data))byTimeDic;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSIMAGEMODEL_DSL_64D4F10276AE040E */
