//
//  JobsIMChatInfoModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "JobsIMDefine.h"
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

@interface JobsIMChatInfoModel : NSObject

Prop_copy(nullable)NSString *userID;/// 发出该聊天的用户ID
Prop_copy(nullable)NSString *userNameStr;/// 发出该聊天的用户名
Prop_strong(nullable)UIImage *userIconIMG;/// 发出该聊天的用户头像
Prop_copy(nullable)NSString *userIconURLStr;/// 发出该聊天的用户头像地址
Prop_copy(nullable)NSString *chatTextTimeStr;/// 发出该聊天的时间戳
Prop_copy(nullable)NSString *chatTextStr;/// 发出该聊天的文本信息
/// 全局ID
Prop_copy(nullable)NSString *identification;/// 该聊天对应的数据库坐标ID
Prop_assign()JobsIMChatMessageType messageType;/// 消息类型:1、文本, 2、礼物, 3、表情
Prop_assign()JobsIMChatInfoDirection chatInfoDirection;/// 消息的发送方向

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsIMChatInfoModel *_Nonnull jobsMakeIMChatInfoModel(jobsByIMChatInfoModelBlock _Nonnull block){
    JobsIMChatInfoModel *data = JobsIMChatInfoModel.alloc.init;
    if (block) block(data);
    return data;
}
