//
//  JobsOCCommentView.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#if __has_include(<JobsOCComment/JobsOCCommentConfig.h>)
#import "JobsOCCommentConfig.h"
#else
#import "JobsOCCommentConfig.h"
#endif

#if __has_include(<JobsOCComment/JobsOCCommentModel.h>)
#import "JobsOCCommentModel.h"
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

-(JobsRetJobsOCCommentViewByConfigBlock _Nonnull)byConfig;
-(instancetype)initWithConfig:(JobsOCCommentConfig *_Nullable)config;
-(JobsRetJobsOCCommentViewByNSArrayJobsOCCommentModelBlock _Nonnull)byComments;
-(JobsRetJobsOCCommentViewByJobsOCCommentModeBlock _Nonnull)byMode;
-(jobsByJobsOCCommentConfigBlock _Nonnull)reloadWithConfig;
-(jobsByNSArrayJobsOCCommentModelBlock _Nonnull)reloadWithComments;
-(jobsByVoidBlock _Nonnull)endPullRefresh;
-(jobsByVoidBlock _Nonnull)endLoadMore;
-(jobsByBOOLBlock _Nonnull)endLoadMoreWithNoMoreData;
-(void)endRefreshingAtPosition:(JobsOCRefreshPosition)position
                       toState:(JobsOCRefreshState)state;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTVIEW_B66B99D3CE */
