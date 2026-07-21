//
//  JobsIMVC.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "LOTAnimationMJRefreshHeader.h"
#import "JobsIMChatInfoTBVCell.h"
#import "JobsIMInputview.h"
#import "JobsIMChatInfoModel.h"
#import "JobsTimeModel.h"

#if __has_include(<IQKeyboardManager/IQKeyboardManager.h>)
#import <IQKeyboardManager/IQKeyboardManager.h>
#else
#import "IQKeyboardManager.h"
#endif

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#if __has_include(<JobsLoadingImage/JobsLoadingImageHeader.h>)
#import <JobsLoadingImage/JobsLoadingImageHeader.h>
#else
#import "JobsLoadingImageHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>)
#import <JobsOCKeyboardMgr/JobsOCKeyboardMgr.h>
#else
#import "JobsOCKeyboardMgr.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
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

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

NS_ASSUME_NONNULL_BEGIN

/// JobsIM 聊天页。
/// UI 仍沿用现有聊天气泡、输入框和 tableView 数据源；消息模型额外携带 JobsIM 协议包字段。
/// 当前实现保留“本地传输占位回包”，后续可把发送入口接到 Bonjour / Network.framework 或 MultipeerConnectivity。
@interface JobsIMVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,MGSwipeTableCellDelegate
>

@end

NS_ASSUME_NONNULL_END
