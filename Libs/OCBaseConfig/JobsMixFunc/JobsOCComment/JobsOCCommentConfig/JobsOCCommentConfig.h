//
//  JobsOCCommentConfig.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTCONFIG_7B4C435F4C
#define JOBS_HEADER_GUARD_JOBSOCCOMMENTCONFIG_7B4C435F4C

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCComment/JobsOCCommentDefines.h>)
#import "JobsOCCommentDefines.h"
#else
#import "JobsOCCommentDefines.h"
#endif

#if __has_include(<JobsOCRefresher/JobsOCRefresher.h>)
#import "JobsOCRefresher.h"
#else
#import "JobsOCRefresher.h"
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

@class JobsOCCommentView;

@interface JobsOCCommentConfig : NSObject

Prop_assign()JobsOCCommentMode mode;
Prop_copy()NSString *title;
Prop_assign()BOOL showsDevice;
Prop_assign()BOOL showsLocation;
Prop_assign()BOOL showsReplyEntrance;
Prop_assign()NSUInteger maxVisibleChildReplyCount;
Prop_assign()BOOL enablesPullRefresh;
Prop_assign()BOOL enablesLoadMore;
Prop_strong(nullable)JobsOCRefreshConfig *pullRefreshConfig;
Prop_strong(nullable)JobsOCRefreshConfig *loadMoreConfig;
Prop_copy(nullable)jobsByIDBlock commentSelectedBlock;
Prop_copy(nullable)jobsByIDBlock replySelectedBlock;
Prop_copy(nullable)JobsOCCommentRefreshActionBlock pullRefreshBlock;
Prop_copy(nullable)JobsOCCommentRefreshActionBlock loadMoreBlock;

+(JobsRetJobsOCCommentConfigByVoidBlock _Nonnull)defaultConfig;
-(JobsRetJobsOCCommentConfigByModeBlock _Nonnull)byMode;
-(JobsRetJobsOCCommentConfigByStrBlock _Nonnull)byTitle;
-(JobsRetJobsOCCommentConfigByBOOLBlock _Nonnull)byShowsDevice;
-(JobsRetJobsOCCommentConfigByBOOLBlock _Nonnull)byShowsLocation;
-(JobsRetJobsOCCommentConfigByBOOLBlock _Nonnull)byShowsReplyEntrance;
-(JobsRetJobsOCCommentConfigByNSUIntegerBlock _Nonnull)byMaxVisibleChildReplyCount;
-(JobsRetJobsOCCommentConfigByBOOLBlock _Nonnull)byEnablesPullRefresh;
-(JobsRetJobsOCCommentConfigByBOOLBlock _Nonnull)byEnablesLoadMore;
-(JobsRetJobsOCCommentConfigByRefreshConfigBlock _Nonnull)byPullRefreshConfig;
-(JobsRetJobsOCCommentConfigByRefreshConfigBlock _Nonnull)byLoadMoreConfig;
-(JobsRetJobsOCCommentConfigByJobsByIDBlock _Nonnull)byCommentSelectedBlock;
-(JobsRetJobsOCCommentConfigByJobsByIDBlock _Nonnull)byReplySelectedBlock;
-(JobsRetJobsOCCommentConfigByRefreshActionBlock _Nonnull)byPullRefreshBlock;
-(JobsRetJobsOCCommentConfigByRefreshActionBlock _Nonnull)byLoadMoreBlock;
+(JobsRetNSStringByJobsOCCommentModeBlock _Nonnull)titleByMode;
+(JobsRetNSStringByJobsOCCommentModeBlock _Nonnull)subtitleByMode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTCONFIG_7B4C435F4C */
