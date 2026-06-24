//
//  JobsShowObjInfoVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSHOWOBJINFOVC_71C8E323DA
#define JOBS_HEADER_GUARD_JOBSSHOWOBJINFOVC_71C8E323DA

#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIView+Extra.h>
#import <JobsBaseUI/BaseViewController.h>
#import <JobsBaseUI/JobsBaseTableViewCell.h>
#import <JobsBaseUI/BaseTableView.h>
#import <JobsBaseUI/UITableView+Extra.h>
#import <JobsBaseUI/NSObject+Extra.h>
#import <JobsBaseUI/NSString+Toast.h>
#import <JobsBaseUI/UIViewController+MJRefresh.h>
#import <JobsBaseUI/NSObject+Extra.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/// 查看对象@查看外界传进来的对象的属性列表以及对应的值，特别是针对查看当前设备相关信息以及用户数据
@interface JobsShowObjInfoVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSSHOWOBJINFOVC_71C8E323DA */
