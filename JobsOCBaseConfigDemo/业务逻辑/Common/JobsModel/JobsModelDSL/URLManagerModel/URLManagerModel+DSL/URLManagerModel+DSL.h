//
//  URLManagerModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516
#define JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516

#import "JobsModel.h"

#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface URLManagerModel (DSL)

-(JobsRetURLManagerModelByStrBlock _Nonnull)byUrl;
-(JobsRetURLManagerModelByStrBlock _Nonnull)byFuncName;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_URLMANAGERMODEL_DSL_1A8898E569E0B516 */
