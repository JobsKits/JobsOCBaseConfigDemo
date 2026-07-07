//
//  JobsOCRefreshConfig.m
//  JobsOCRefresher
//
//  Created by Jobs on 2026年6月25日，星期四.
//

#import "JobsOCRefreshConfig.h"

@implementation JobsOCRefreshConfig

+ (instancetype)baseConfig {
    return jobsMakeOCRefreshConfig(^(__kindof JobsOCRefreshConfig * _Nullable config) {
        config.triggerDistance = 60;
        config.viewLength = 60;
        config.showsInfo = YES;
        config.enablesHaptics = YES;
        config.horizontalMode = JobsOCRefreshHorizontalModeRefreshRightLoadLeft;
        config.animationType = JobsOCRefreshAnimationTypeSystem;
        config.frameImageInterval = 0.08;
        config.readyRefreshText = @"松开立即刷新".tr;
        config.readyLoadMoreText = @"松开立即加载更多".tr;
        config.refreshingText = @"正在刷新...".tr;
        config.loadingMoreText = @"正在加载更多的数据...".tr;
        config.failedText = @"加载失败，松手重试".tr;
        config.disabledText = @"刷新已关闭".tr;
        config.noMoreDataText = @"没有更多了".tr;
        config.lastRefreshPrefix = @"最后更新：".tr;
    });
}

+ (instancetype)defaultHeaderConfig {
    JobsOCRefreshConfig *config = self.baseConfig;
    config.idleText = @"下拉可以刷新".tr;
    config.pullingText = @"继续下拉".tr;
    return config;
}

+ (instancetype)defaultFooterConfig {
    JobsOCRefreshConfig *config = self.baseConfig;
    config.idleText = @"上拉可以加载更多".tr;
    config.pullingText = @"继续上拉".tr;
    return config;
}

+ (instancetype)defaultLeftConfigWithMode:(JobsOCRefreshHorizontalMode)mode {
    JobsOCRefreshConfig *config = self.baseConfig;
    config.horizontalMode = mode;
    JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionLeft);
    config.idleText = role == JobsOCRefreshRoleRefresh ? @"右拉可以刷新".tr : @"右拉可以加载更多".tr;
    config.pullingText = @"继续右拉".tr;
    return config;
}

+ (instancetype)defaultRightConfigWithMode:(JobsOCRefreshHorizontalMode)mode {
    JobsOCRefreshConfig *config = self.baseConfig;
    config.horizontalMode = mode;
    JobsOCRefreshRole role = JobsOCRefreshRoleForPosition(mode, JobsOCRefreshPositionRight);
    config.idleText = role == JobsOCRefreshRoleRefresh ? @"左拉可以刷新".tr : @"左拉可以加载更多".tr;
    config.pullingText = @"继续左拉".tr;
    return config;
}

- (NSString *)readyTextForRole:(JobsOCRefreshRole)role {
    return role == JobsOCRefreshRoleRefresh ? self.readyRefreshText : self.readyLoadMoreText;
}

- (NSString *)refreshingTextForRole:(JobsOCRefreshRole)role {
    return role == JobsOCRefreshRoleRefresh ? self.refreshingText : self.loadingMoreText;
}

@end
