//
//  JobsOCCommentView.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE
#define JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE

#import <UIKit/UIKit.h>

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#import <JobsBaseUI/UITableView+Extra.h>
#else
#import "JobsBaseUI.h"
#import "UITableView+Extra.h"
#endif

#if __has_include(<JobsOCComment/JobsOCCommentConfig.h>)
#import <JobsOCComment/JobsOCCommentConfig.h>
#else
#import "JobsOCCommentConfig.h"
#endif

#if __has_include(<JobsOCComment/JobsOCCommentModel.h>)
#import <JobsOCComment/JobsOCCommentModel.h>
#else
#import "JobsOCCommentModel.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCommentView : UIView
<
UITableViewDelegate,
UITableViewDataSource
>

Prop_strong(readonly)UITableView *tableView;
Prop_strong(readonly)JobsOCCommentConfig *config;
Prop_copy(readonly)NSArray <JobsOCCommentModel *>*comments;

-(instancetype)initWithConfig:(JobsOCCommentConfig *_Nullable)config;
-(__kindof JobsOCCommentView *_Nullable(^)(NSArray <JobsOCCommentModel *>*_Nullable comments))byComments;
-(__kindof JobsOCCommentView *_Nullable(^)(JobsOCCommentMode mode))byMode;
-(void)reloadWithConfig:(JobsOCCommentConfig *_Nullable)config;
-(void)reloadWithComments:(NSArray <JobsOCCommentModel *>*_Nullable)comments;
-(void)endPullRefresh;
-(void)endLoadMore;
-(void)endLoadMoreWithNoMoreData:(BOOL)noMoreData;
-(void)endRefreshingAtPosition:(JobsOCRefreshPosition)position
                       toState:(JobsOCRefreshState)state;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE */
