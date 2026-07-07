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

typedef void(^JobsOCCommentRefreshActionBlock)(__kindof JobsOCCommentView *commentView);

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

+(instancetype)defaultConfig;
+(NSString *)titleByMode:(JobsOCCommentMode)mode;
+(NSString *)subtitleByMode:(JobsOCCommentMode)mode;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTCONFIG_7B4C435F4C */
