//
//  JobsVerticalMenuVC@0.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "LeftCell.h"
#import "ThreeClassCell.h"
#import "GoodsClassModel.h"
#import "BaiShaETProjPopupView10.h"
#import "JobsSearchBar.h"
#import "JobsVerticalMenuSubView.h" // 新的自定义UIView类
#import "JobsVerticalMenuDefineHeader.h"

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

NS_ASSUME_NONNULL_BEGIN
/// 左边的目录是UITableView，右边的内容是UIView
@interface JobsVerticalMenuVC_0 : BaseViewController
<
UITableViewDelegate,
UITableViewDataSource
>

@end

NS_ASSUME_NONNULL_END
