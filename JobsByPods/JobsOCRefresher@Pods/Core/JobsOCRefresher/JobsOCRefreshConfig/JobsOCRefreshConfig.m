//
//  JobsOCRefreshConfig.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshConfig.h"

@implementation JobsOCRefreshConfig
#define JobsOCRefreshConfigDSL(_selector, _property, _blockType, _valueType) \
- (_blockType _Nonnull)_selector { \
    @jobs_weakify(self) \
    return ^__kindof JobsOCRefreshConfig *_Nullable(_valueType data) { \
        @jobs_strongify(self) \
        if (!self) return nil; \
        self._property = data; \
        return self; \
    }; \
}

JobsOCRefreshConfigDSL(byTriggerDistance, triggerDistance, JobsRetJobsOCRefreshConfigByCGFloatBlock, CGFloat)
JobsOCRefreshConfigDSL(byViewLength, viewLength, JobsRetJobsOCRefreshConfigByCGFloatBlock, CGFloat)
JobsOCRefreshConfigDSL(byShowsInfo, showsInfo, JobsRetJobsOCRefreshConfigByBOOLBlock, BOOL)
JobsOCRefreshConfigDSL(byShowsText, showsText, JobsRetJobsOCRefreshConfigByBOOLBlock, BOOL)
JobsOCRefreshConfigDSL(byEnablesHaptics, enablesHaptics, JobsRetJobsOCRefreshConfigByBOOLBlock, BOOL)
JobsOCRefreshConfigDSL(byHorizontalMode, horizontalMode, JobsRetJobsOCRefreshConfigByHorizontalModeBlock, JobsOCRefreshHorizontalMode)
JobsOCRefreshConfigDSL(byAnimator, animator, JobsRetJobsOCRefreshConfigByIDBlock, id<JobsRefreshAnimatorProtocol> _Nullable)
JobsOCRefreshConfigDSL(byIdleText, idleText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byPullingText, pullingText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byReadyRefreshText, readyRefreshText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byReadyLoadMoreText, readyLoadMoreText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byRefreshingText, refreshingText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byLoadingMoreText, loadingMoreText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byFailedText, failedText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byDisabledText, disabledText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byNoMoreDataText, noMoreDataText, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(byLastRefreshPrefix, lastRefreshPrefix, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)
JobsOCRefreshConfigDSL(bySoundName, soundName, JobsRetJobsOCRefreshConfigByStrBlock, NSString *_Nullable)

+ (JobsRetIDByVoidBlock _Nonnull)baseConfig {
    return ^id{
        return jobsMakeOCRefreshConfig(^(__kindof JobsOCRefreshConfig * _Nullable config) {
            config
                .byTriggerDistance(60)
                .byViewLength(60)
                .byShowsInfo(YES)
                .byShowsText(YES)
                .byEnablesHaptics(YES)
                .byHorizontalMode(JobsOCRefreshHorizontalModeRefreshRightLoadLeft)
                .byAnimator(JobsSystemRefreshView.refreshView())
                .byReadyRefreshText(@"松开立即刷新".jobsTr())
                .byReadyLoadMoreText(@"松开立即加载更多".jobsTr())
                .byRefreshingText(@"正在刷新...".jobsTr())
                .byLoadingMoreText(@"正在加载更多的数据...".jobsTr())
                .byFailedText(@"加载失败，松手重试".jobsTr())
                .byDisabledText(@"刷新已关闭".jobsTr())
                .byNoMoreDataText(@"没有更多了".jobsTr())
                .byLastRefreshPrefix(@"最后更新：".jobsTr());
        });
    };
}

+ (JobsRetIDByVoidBlock _Nonnull)defaultHeaderConfig {
    return ^id{
        JobsOCRefreshConfig *config = self.baseConfig();
        config.byIdleText(@"下拉可以刷新".jobsTr());
        config.byPullingText(@"继续下拉".jobsTr());
        return config;
    };
}

+ (JobsRetIDByVoidBlock _Nonnull)defaultFooterConfig {
    return ^id{
        JobsOCRefreshConfig *config = self.baseConfig();
        config.byIdleText(@"上拉可以加载更多".jobsTr());
        config.byPullingText(@"继续上拉".jobsTr());
        return config;
    };
}

+(JobsRetIDByJobsOCRefreshHorizontalModeBlock _Nonnull)defaultLeftConfigWithMode{
    return ^id(JobsOCRefreshHorizontalMode mode){
        JobsOCRefreshConfig *config = self.baseConfig();
        config.byHorizontalMode(mode);
        JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionLeft);
        config.byIdleText(role == JobsOCRefreshRoleRefresh ? @"右拉可以刷新".jobsTr() : @"右拉可以加载更多".jobsTr());
        config.byPullingText(@"继续右拉".jobsTr());
        return config;
    };
}

+(JobsRetIDByJobsOCRefreshHorizontalModeBlock _Nonnull)defaultRightConfigWithMode{
    return ^id(JobsOCRefreshHorizontalMode mode){
        JobsOCRefreshConfig *config = self.baseConfig();
        config.byHorizontalMode(mode);
        JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionRight);
        config.byIdleText(role == JobsOCRefreshRoleRefresh ? @"左拉可以刷新".jobsTr() : @"左拉可以加载更多".jobsTr());
        config.byPullingText(@"继续左拉".jobsTr());
        return config;
    };
}

-(JobsRetNSStringByJobsOCRefreshRoleBlock _Nonnull)readyTextForRole{
    @jobs_weakify(self)
    return ^NSString *(JobsOCRefreshRole role){
        @jobs_strongify(self)
        if (!self) return nil;
        return role == JobsOCRefreshRoleRefresh ? self.readyRefreshText : self.readyLoadMoreText;
    };
}

-(JobsRetNSStringByJobsOCRefreshRoleBlock _Nonnull)refreshingTextForRole{
    @jobs_weakify(self)
    return ^NSString *(JobsOCRefreshRole role){
        @jobs_strongify(self)
        if (!self) return nil;
        return role == JobsOCRefreshRoleRefresh ? self.refreshingText : self.loadingMoreText;
    };
}

#undef JobsOCRefreshConfigDSL

@end
