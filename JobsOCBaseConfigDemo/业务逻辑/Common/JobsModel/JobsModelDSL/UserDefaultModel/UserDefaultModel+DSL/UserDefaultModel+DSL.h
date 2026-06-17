//
//  UserDefaultModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_15A5E379F5C6BF94
#define JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_15A5E379F5C6BF94

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

@interface UserDefaultModel (DSL)

-(JobsRetUserDefaultModelByNSObjectPointerBlock _Nonnull)byObj;
-(JobsRetUserDefaultModelByIntBlock _Nonnull)byIntValue;
-(JobsRetUserDefaultModelByFloatBlock _Nonnull)byFloatValue;
-(JobsRetUserDefaultModelByBOOLBlock _Nonnull)byBooLValue;
-(JobsRetUserDefaultModelByNSIntegerBlock _Nonnull)byNSIntValue;
-(JobsRetUserDefaultModelByCGFloatBlock _Nonnull)byCGfloatValue;
-(JobsRetUserDefaultModelByStrBlock _Nonnull)byKey;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_USERDEFAULTMODEL_DSL_15A5E379F5C6BF94 */
