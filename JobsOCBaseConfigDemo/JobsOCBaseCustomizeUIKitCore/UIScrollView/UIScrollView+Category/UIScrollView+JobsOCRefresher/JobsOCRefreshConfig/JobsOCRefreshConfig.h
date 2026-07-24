//
//  JobsOCRefreshConfig.h
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshDefines.h"
#import "JobsFuseAnimation.h"

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import "JobsLanMgr.h"
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import "JobsBlock.h"
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
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
Prop_assign() JobsOCRefreshAnimationType animationType;
Prop_assign() NSTimeInterval frameImageInterval;
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
Prop_copy(nullable) NSString *lottieName;
Prop_copy(nullable) NSString *gifName;
Prop_copy(nullable) NSString *networkImageURLString;
Prop_copy(nullable) NSString *soundName;
Prop_copy(nullable) NSArray<NSString *> *frameImageNames;
Prop_strong(nullable) id<JobsRefreshAnimatorProtocol> animator;

+ (instancetype)defaultHeaderConfig;
+ (instancetype)defaultFooterConfig;
+ (instancetype)defaultLeftConfigWithMode:(JobsOCRefreshHorizontalMode)mode;
+ (instancetype)defaultRightConfigWithMode:(JobsOCRefreshHorizontalMode)mode;
- (NSString *)readyTextForRole:(JobsOCRefreshRole)role;
- (NSString *)refreshingTextForRole:(JobsOCRefreshRole)role;

@end

NS_INLINE __kindof JobsOCRefreshConfig *_Nonnull
jobsMakeOCRefreshConfig(jobsByOCRefreshConfigBlock _Nullable block) {
    JobsOCRefreshConfig *config = JobsOCRefreshConfig.alloc.init;
    if (block) block(config);
    return config;
}

NS_ASSUME_NONNULL_END
