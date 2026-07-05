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

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#import "JobsLoadingImageHeader.h"

#import "JobsLanMgr.h"

#import "JobsBaseUI.h"

#import "JobsByOCPods.h"

#import "JobsMakes.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

#import "JobsOCDSL.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMVC : BaseViewController
<
UITableViewDelegate
,UITableViewDataSource
,MGSwipeTableCellDelegate
>

@end

NS_ASSUME_NONNULL_END
