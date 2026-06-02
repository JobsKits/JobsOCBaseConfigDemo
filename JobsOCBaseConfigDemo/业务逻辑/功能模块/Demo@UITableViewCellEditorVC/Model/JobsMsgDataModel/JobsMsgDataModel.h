//
//  JobsMsgDataModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>

#if __has_include(<JobsModel/JobsModel.h>)
#import <JobsModel/JobsModel.h>
#else
#import "JobsModel.h"
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
Prop_copy()NSString *time;
Prop_assign()BOOL isDraw;// 是否已经被领取？
Prop_assign()BOOL isRead;// 已读

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsMsgDataModel *_Nonnull jobsMakeMsgDataModel(jobsByMsgDataModelBlock _Nonnull block){
    JobsMsgDataModel *data = JobsMsgDataModel.alloc.init;
    if (block) block(data);
    return data;
}
