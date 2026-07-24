//
//  JobsOCCommentConfig.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentConfig.h"

@implementation JobsOCCommentConfig
+(instancetype)defaultConfig{
    JobsOCCommentConfig *config = JobsOCCommentConfig.new;
    config.mode = JobsOCCommentModeNetEase;
    config.title = @"评论";
    config.showsDevice = YES;
    config.showsLocation = YES;
    config.showsReplyEntrance = YES;
    config.maxVisibleChildReplyCount = JobsOCCommentDefaultMaxVisibleChildReplyCount;
    config.enablesPullRefresh = YES;
    config.enablesLoadMore = YES;
    config.pullRefreshConfig = JobsOCRefreshConfig.defaultHeaderConfig;
    config.loadMoreConfig = JobsOCRefreshConfig.defaultFooterConfig;
    return config;
}

+(NSString *)titleByMode:(JobsOCCommentMode)mode{
    switch (mode) {
        /// 处理 JobsOCCommentModeNetEase 分支
        case JobsOCCommentModeNetEase:
            return @"模式一：网易新闻回复风格";
        /// 处理 JobsOCCommentModeToutiao 分支
        case JobsOCCommentModeToutiao:
            return @"模式二：今日头条回复风格";
        /// 处理 JobsOCCommentModeCustom 分支
        case JobsOCCommentModeCustom:
            return @"模式三：自定义回复风格";
    }
}

+(NSString *)subtitleByMode:(JobsOCCommentMode)mode{
    switch (mode) {
        /// 处理 JobsOCCommentModeNetEase 分支
        case JobsOCCommentModeNetEase:
            return @"同页展示一级评论与楼中楼回复";
        /// 处理 JobsOCCommentModeToutiao 分支
        case JobsOCCommentModeToutiao:
            return @"点击评论后单独进入回复页";
        /// 处理 JobsOCCommentModeCustom 分支
        case JobsOCCommentModeCustom:
            return @"二级及以后同级缩进，超出数量可展开";
    }
}

@end
