//
//  JobsMsgDataModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2022/6/2.
//

#import "UIViewModel.h"
#import "JobsBlock.h"
#import "JobsDefineEnums.h"
#import "JobsDefineProperty.h"

NS_ASSUME_NONNULL_BEGIN

@interface JobsMsgDataModel : UIViewModel

Prop_assign()JobsMsgType msgStyle;
Prop_copy()NSString *time;
Prop_assign()BOOL isDraw;/// 是否已经被领取？
Prop_assign()BOOL isRead;/// 已读

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsMsgDataModel *_Nonnull jobsMakeMsgDataModel(jobsByMsgDataModelBlock _Nonnull block){
    JobsMsgDataModel *data = JobsMsgDataModel.alloc.init;
    if (block) block(data);
    return data;
}
