//
//  URLManagerModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_80CF02CE70505918
#define JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_80CF02CE70505918

#if __has_include(<JobsModel/URLManagerModel.h>)
#import <JobsModel/URLManagerModel.h>
#else
#import "URLManagerModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface URLManagerModel (DSL)

#pragma mark —— 来自 URLManagerModel
-(__kindof URLManagerModel *_Nonnull (^ _Nonnull)(NSString * data))byUrl;
-(__kindof URLManagerModel *_Nonnull (^ _Nonnull)(NSString * data))byFuncName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_80CF02CE70505918 */
