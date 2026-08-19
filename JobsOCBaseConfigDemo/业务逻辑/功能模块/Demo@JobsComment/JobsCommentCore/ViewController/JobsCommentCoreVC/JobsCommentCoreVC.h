//
//  JobsCommentCoreVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#if __has_include(<MJExtension/MJExtension.h>)
#import <MJExtension/MJExtension.h>
#else
#import "MJExtension.h"
#endif

#if __has_include(<MJRefresh/MJRefresh.h>)
#import <MJRefresh/MJRefresh.h>
#else
#import "MJRefresh.h"
#endif

#pragma mark —— View
#import "JobsCommentPopUpView_viewForHeaderInSection.h"
#import "JobsCommentTitleHeaderView.h"
#import "JobsInfoTBVCell.h"// 显示具体的有用讯息
#import "JobsLoadMoreTBVCell.h"// 加载更多
#pragma mark —— ViewController
#import "JobsPopUpVC.h"
#pragma mark —— Model
#import "JobsCommentModel.h"
#import "JobsCommentConfig.h"

//#if __has_include(<YYModel/YYModel.h>)
//#import <YYModel/YYModel.h>
//#else
//#import "YYModel.h"
//#endif

#if __has_include(<MJRefreshExtra/MJRefreshExtra.h>)
#import <MJRefreshExtra/MJRefreshExtra.h>
#else
#import "MJRefreshExtra.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsCommentCoreVC : JobsPopUpVC
<
UITableViewDelegate
,UITableViewDataSource
>

-(void)setMJModel:(JobsCommentModel *)mjModel;
-(jobsByCommentModelBlock _Nonnull)jobsSetMJModel;
-(void)setYYModel:(JobsCommentModel *)yyModel;
-(jobsByCommentModelBlock _Nonnull)jobsSetYYModel;
-(JobsRetJobsCommentTitleHeaderViewByVoidBlock _Nonnull)getJobsCommentTitleHeaderView;
-(JobsRetTableViewByVoidBlock _Nonnull)getTableView;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsCommentCoreVC
-(JobsRetJobsCommentCoreVCByBOOLBlock _Nonnull)byHiddenNavigationBar;
-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byJobsDefaultPopUpHeight;
-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byJobsPanBeginPopUpHeight;
-(JobsRetJobsCommentCoreVCByCGFloatBlock _Nonnull)byPopUpHeight;
-(JobsRetJobsCommentCoreVCByJobsCommentModelBlock _Nonnull)byMjModel;
-(JobsRetJobsCommentCoreVCByCGSizeBlock _Nonnull)byPreferredContentSize;
-(JobsRetJobsCommentCoreVCByIDUIViewControllerTransitioningDelegateBlock _Nonnull)byTransitioningDelegate;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsCommentCoreVC
@end

NS_ASSUME_NONNULL_END
