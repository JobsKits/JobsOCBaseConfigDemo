//
//  JobsCountriesModel+DSL.h
//  JobsModel
//
//  Created by Jobs on 2026年6月11日，星期四.
//

#ifndef JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_DBE9A67580787742
#define JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_DBE9A67580787742

#if __has_include(<JobsModel/JobsCountriesModel.h>)
#import <JobsModel/JobsCountriesModel.h>
#else
#import "JobsCountriesModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCountriesModel (DSL)

#pragma mark —— 来自 JobsCountriesModel
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byAbbr;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byChinese;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byCode;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byEnglish;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))bySpell;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byState;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byFrench;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byItalian;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))bySpanish;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byJapanese;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byRussian;
-(__kindof JobsCountriesModel *_Nonnull (^ _Nonnull)(NSString * data))byGermen;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSCOUNTRIESMODEL_DSL_DBE9A67580787742 */
