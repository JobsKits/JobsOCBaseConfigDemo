//
//  JobsIMListView.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "JobsIMListDataModel.h"
#import "JobsIMListTBVCell.h"

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import "JobsLoadingImageHeader.h"
#else
#import "JobsLoadingImageHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import "JobsLanMgr.h"
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import "JobsByOCPods.h"
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import "JobsMakes.h"
#else
#import "JobsMakes.h"
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

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import "JobsOCDSL.h"
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// JobsIM 用户列表。
/// 当前列表继续使用静态演示数据驱动 UI；每个 `JobsIMListDataModel` 已补 peerID、transportKind、onlineState 等协议字段。
@interface JobsIMListView : BaseView
<
UITableViewDelegate
,UITableViewDataSource
,MGSwipeTableCellDelegate
>

@end

NS_ASSUME_NONNULL_END
