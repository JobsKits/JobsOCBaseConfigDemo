//
//  FileNameModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_72DAE6341AA23823
#define JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_72DAE6341AA23823

#if __has_include(<JobsModel/FileNameModel.h>)
#import <JobsModel/FileNameModel.h>
#else
#import "FileNameModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface FileNameModel (DSL)

#pragma mark —— 来自 FileNameModel
-(__kindof FileNameModel *_Nonnull (^ _Nonnull)(NSString * data))byName;
-(__kindof FileNameModel *_Nonnull (^ _Nonnull)(NSString * data))byType;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_FILENAMEMODEL_DSL_72DAE6341AA23823 */
