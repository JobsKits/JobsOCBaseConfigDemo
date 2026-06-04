//
//  URLManagerModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516
#define JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface URLManagerModel (DSL)

-(JobsRetURLManagerModelByStrBlock _Nonnull)byUrl;
-(JobsRetURLManagerModelByStrBlock _Nonnull)byFuncName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516 */
