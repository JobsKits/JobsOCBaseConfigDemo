//
//  JobsParagraphStyleModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_9CEF4DD521754943
#define JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_9CEF4DD521754943

#if __has_include(<JobsModel/JobsParagraphStyleModel.h>)
#import <JobsModel/JobsParagraphStyleModel.h>
#else
#import "JobsParagraphStyleModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsParagraphStyleModel (DSL)

#pragma mark —— 来自 JobsParagraphStyleModel
-(__kindof JobsParagraphStyleModel *_Nonnull (^ _Nonnull)(id data))byValue;
-(__kindof JobsParagraphStyleModel *_Nonnull (^ _Nonnull)(NSRange data))byRange;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSPARAGRAPHSTYLEMODEL_DSL_9CEF4DD521754943 */
