//
//  JobsAlertModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_F4276300B610D457
#define JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_F4276300B610D457

#if __has_include(<JobsModel/JobsAlertModel.h>)
#import <JobsModel/JobsAlertModel.h>
#else
#import "JobsAlertModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAlertModel (DSL)

#pragma mark —— 来自 JobsAlertModel
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byAlertControllerTitle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byMessage;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertControllerStyle data))byPreferredStyle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byAlertActionTitle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertActionStyle data))byAlertActionStyle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(jobsByAlertActionBlock data))byAlertActionBlock;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(NSString * data))byCancelAlertActionTitle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(UIAlertActionStyle data))byCancelAlertActionStyle;
-(__kindof JobsAlertModel *_Nonnull (^ _Nonnull)(jobsByAlertActionBlock data))byCancelAlertActionBlock;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSALERTMODEL_DSL_F4276300B610D457 */
