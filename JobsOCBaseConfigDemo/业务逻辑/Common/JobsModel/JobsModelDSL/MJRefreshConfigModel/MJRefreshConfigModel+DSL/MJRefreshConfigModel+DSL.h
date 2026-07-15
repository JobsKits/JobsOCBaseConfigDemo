//
//  MJRefreshConfigModel+DSL.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月4日，星期四.
//

#ifndef JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_32C8B31DD0E2ACBB
#define JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_32C8B31DD0E2ACBB

#import "JobsModel.h"
#import "JobsBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface MJRefreshConfigModel (DSL)

-(JobsRetMJRefreshConfigModelByFontBlock _Nonnull)byFont;
-(JobsRetMJRefreshConfigModelByCorBlock _Nonnull)byTextColor;
-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byStateIdleDuration;
-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byPullingDuration;
-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byRefreshingDuration;
-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byWillRefreshDuration;
-(JobsRetMJRefreshConfigModelByCGFloatBlock _Nonnull)byNoMoreDataDuration;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byStateIdleTitle;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byPullingTitle;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byRefreshingTitle;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byWillRefreshTitle;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byNoMoreDataTitle;
-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byStateIdlePicsMutArr;
-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byPullingPicsMutArr;
-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byRefreshingPicsMutArr;
-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byWillRefreshPicsMutArr;
-(JobsRetMJRefreshConfigModelByMutableArrayBlock _Nonnull)byNoMoreDataPicsMutArr;
-(JobsRetMJRefreshConfigModelByStrBlock _Nonnull)byJsonLottiefilePaths;
-(JobsRetMJRefreshConfigModelByJobsRetIDByIDBlockBlock _Nonnull)byLoadBlock;
-(JobsRetMJRefreshConfigModelByBOOLBlock _Nonnull)byAutomaticallyChangeAlpha;
-(JobsRetMJRefreshConfigModelByBOOLBlock _Nonnull)byIsShake;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_MJREFRESHCONFIGMODEL_DSL_32C8B31DD0E2ACBB */
