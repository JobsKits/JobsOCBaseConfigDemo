//
//  JobsCountriesModel+DSL.h
//  JobsModelDSL
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_11CFA4A265AB8517
#define JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_11CFA4A265AB8517

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

@interface JobsCountriesModel (DSL)

-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byAbbr;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byChinese;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byCode;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byEnglish;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)bySpell;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byState;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byFrench;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byItalian;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)bySpanish;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byJapanese;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byRussian;
-(JobsRetJobsCountriesModelByStrBlock _Nonnull)byGermen;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_11CFA4A265AB8517 */
