//
//  JobsMsgDataModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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

@interface JobsMsgDataModel : UIViewModel

Prop_assign()JobsMsgType msgStyle;
/// 消息展示时间文案，避免和 TimerProtocol.time 冲突
Prop_copy()NSString *timeText;
Prop_assign()BOOL isDraw;// 是否已经被领取？
Prop_assign()BOOL isRead;// 已读

-(JobsRetJobsMsgDataModelByNSIntegerBlock _Nonnull)byMsgStyle;
-(JobsRetJobsMsgDataModelByStrBlock _Nonnull)byTimeText;
-(JobsRetJobsMsgDataModelByBOOLBlock _Nonnull)byIsDraw;

// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsMsgDataModel
-(JobsRetJobsMsgDataModelByBOOLBlock _Nonnull)byRead;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsMsgDataModel
@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsMsgDataModel *_Nonnull jobsMakeMsgDataModel(jobsByMsgDataModelBlock _Nonnull block){
    JobsMsgDataModel *data = JobsMsgDataModel.alloc.init;
    if (block) block(data);
    return data;
}
