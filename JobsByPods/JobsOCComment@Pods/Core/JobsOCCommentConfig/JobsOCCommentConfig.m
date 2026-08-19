//
//  JobsOCCommentConfig.m
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCCommentConfig.h"

@implementation JobsOCCommentConfig
+(JobsRetJobsOCCommentConfigByVoidBlock _Nonnull)defaultConfig{
    return ^JobsOCCommentConfig *{
        return JobsOCCommentConfig.new
            .byMode(JobsOCCommentModeNetEase)
            .byTitle(@"评论")
            .byShowsDevice(YES)
            .byShowsLocation(YES)
            .byShowsReplyEntrance(YES)
            .byMaxVisibleChildReplyCount(JobsOCCommentDefaultMaxVisibleChildReplyCount)
            .byEnablesPullRefresh(YES)
            .byEnablesLoadMore(YES)
            .byPullRefreshConfig(JobsOCRefreshConfig.defaultHeaderConfig())
            .byLoadMoreConfig(JobsOCRefreshConfig.defaultFooterConfig());
    };
}

#define JobsOCCommentConfigDSL(_type_, _name_, _property_, _dataType_) \
-(JobsRetJobsOCCommentConfigBy##_type_##Block _Nonnull)by##_name_{ \
    @jobs_weakify(self) \
    return ^__kindof JobsOCCommentConfig *_Nullable(_dataType_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JobsOCCommentConfigDSL(Mode, Mode, mode, JobsOCCommentMode)
JobsOCCommentConfigDSL(Str, Title, title, NSString *_Nullable)
JobsOCCommentConfigDSL(BOOL, ShowsDevice, showsDevice, BOOL)
JobsOCCommentConfigDSL(BOOL, ShowsLocation, showsLocation, BOOL)
JobsOCCommentConfigDSL(BOOL, ShowsReplyEntrance, showsReplyEntrance, BOOL)
JobsOCCommentConfigDSL(NSUInteger, MaxVisibleChildReplyCount, maxVisibleChildReplyCount, NSUInteger)
JobsOCCommentConfigDSL(BOOL, EnablesPullRefresh, enablesPullRefresh, BOOL)
JobsOCCommentConfigDSL(BOOL, EnablesLoadMore, enablesLoadMore, BOOL)
JobsOCCommentConfigDSL(RefreshConfig, PullRefreshConfig, pullRefreshConfig, JobsOCRefreshConfig *_Nullable)
JobsOCCommentConfigDSL(RefreshConfig, LoadMoreConfig, loadMoreConfig, JobsOCRefreshConfig *_Nullable)
JobsOCCommentConfigDSL(JobsByID, CommentSelectedBlock, commentSelectedBlock, jobsByIDBlock _Nullable)
JobsOCCommentConfigDSL(JobsByID, ReplySelectedBlock, replySelectedBlock, jobsByIDBlock _Nullable)
JobsOCCommentConfigDSL(RefreshAction, PullRefreshBlock, pullRefreshBlock, JobsOCCommentRefreshActionBlock _Nullable)
JobsOCCommentConfigDSL(RefreshAction, LoadMoreBlock, loadMoreBlock, JobsOCCommentRefreshActionBlock _Nullable)

#undef JobsOCCommentConfigDSL

+(JobsRetNSStringByJobsOCCommentModeBlock _Nonnull)titleByMode{
    return ^NSString *(JobsOCCommentMode mode){
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
    };
}

+(JobsRetNSStringByJobsOCCommentModeBlock _Nonnull)subtitleByMode{
    return ^NSString *(JobsOCCommentMode mode){
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
    };
}

@end
