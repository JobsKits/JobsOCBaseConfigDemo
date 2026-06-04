//
//  JobsIMChatInfoTBVCell.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>
#import "MGSwipeButtonModel.h"
#import "JobsIMDefine.h"
#import "JobsIMChatInfoModel.h"

#if __has_include(<MGSwipeTableCell/MGSwipeTableCell.h>)
#import <MGSwipeTableCell/MGSwipeTableCell.h>
#else
#import "MGSwipeTableCell.h"
#endif

#if __has_include(<MGSwipeTableCellExtra/MGSwipeTableCellProtocol.h>)
#import <MGSwipeTableCellExtra/MGSwipeTableCellProtocol.h>
#else
#import "MGSwipeTableCellProtocol.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
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

NS_ASSUME_NONNULL_BEGIN

@interface JobsIMChatInfoTBVCell : MGSwipeTableCell
<
BaseCellProtocol,
MGSwipeTableCellProtocol
>

Prop_assign()BOOL isShowChatUserName;///是否显示每一个聊天的用户的用户名？默认不显示

-(NSArray *)createLeftButtons;
-(NSArray *)createRightButtons;

@end

NS_ASSUME_NONNULL_END
