//
//  JobsShowObjInfoVC.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSSHOWOBJINFOVC_71C8E323DA
#define JOBS_HEADER_GUARD_JOBSSHOWOBJINFOVC_71C8E323DA

#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "BaseViewController.h"
#import "JobsBaseTableViewCell.h"
#import "BaseTableView.h"
#import "UITableView+Extra.h"
#import "NSObject+Extra.h"
#import "NSString+Toast.h"
#import "UIViewController+MJRefresh.h"
#import "NSObject+Extra.h"
#import "JobsModelDSL.h"
#import "JobsLanMgr.h"
#import "JobsOCDSL.h"
#import "JobsDefines.h"

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
