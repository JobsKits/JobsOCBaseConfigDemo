//
//  JobsOCRefreshConfig.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshDefines.h"

#if __has_include(<JobsFuseAnimation/JobsFuseAnimation.h>)
#import <JobsFuseAnimation/JobsFuseAnimation.h>
#else
#import "JobsFuseAnimation.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCRefreshConfig : NSObject

Prop_assign() CGFloat triggerDistance;
Prop_assign() CGFloat viewLength;
Prop_assign() BOOL showsInfo;
Prop_assign() BOOL showsText;
Prop_assign() BOOL enablesHaptics;
Prop_assign() JobsOCRefreshHorizontalMode horizontalMode;
Prop_strong(nullable) id<JobsRefreshAnimatorProtocol> animator;
Prop_copy() NSString *idleText;
Prop_copy() NSString *pullingText;
Prop_copy() NSString *readyRefreshText;
Prop_copy() NSString *readyLoadMoreText;
Prop_copy() NSString *refreshingText;
Prop_copy() NSString *loadingMoreText;
Prop_copy() NSString *failedText;
Prop_copy() NSString *disabledText;
Prop_copy() NSString *noMoreDataText;
Prop_copy() NSString *lastRefreshPrefix;
Prop_copy(nullable) NSString *soundName;

-(JobsRetJobsOCRefreshConfigByCGFloatBlock _Nonnull)byTriggerDistance;
-(JobsRetJobsOCRefreshConfigByCGFloatBlock _Nonnull)byViewLength;
-(JobsRetJobsOCRefreshConfigByBOOLBlock _Nonnull)byShowsInfo;
-(JobsRetJobsOCRefreshConfigByBOOLBlock _Nonnull)byShowsText;
-(JobsRetJobsOCRefreshConfigByBOOLBlock _Nonnull)byEnablesHaptics;
-(JobsRetJobsOCRefreshConfigByHorizontalModeBlock _Nonnull)byHorizontalMode;
-(JobsRetJobsOCRefreshConfigByIDBlock _Nonnull)byAnimator;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byIdleText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byPullingText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byReadyRefreshText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byReadyLoadMoreText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byRefreshingText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byLoadingMoreText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byFailedText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byDisabledText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byNoMoreDataText;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)byLastRefreshPrefix;
-(JobsRetJobsOCRefreshConfigByStrBlock _Nonnull)bySoundName;

+ (JobsRetIDByVoidBlock _Nonnull)defaultHeaderConfig;
+ (JobsRetIDByVoidBlock _Nonnull)defaultFooterConfig;
+(JobsRetIDByJobsOCRefreshHorizontalModeBlock _Nonnull)defaultLeftConfigWithMode;
+(JobsRetIDByJobsOCRefreshHorizontalModeBlock _Nonnull)defaultRightConfigWithMode;
-(JobsRetNSStringByJobsOCRefreshRoleBlock _Nonnull)readyTextForRole;
-(JobsRetNSStringByJobsOCRefreshRoleBlock _Nonnull)refreshingTextForRole;

@end

NS_INLINE __kindof JobsOCRefreshConfig *_Nonnull
jobsMakeOCRefreshConfig(jobsByOCRefreshConfigBlock _Nullable block) {
    JobsOCRefreshConfig *config = JobsOCRefreshConfig.alloc.init;
    if (block) block(config);
    return config;
}

NS_ASSUME_NONNULL_END
