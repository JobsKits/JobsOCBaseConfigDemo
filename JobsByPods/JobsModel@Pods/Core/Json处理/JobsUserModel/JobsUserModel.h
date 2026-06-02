//
//  JobsUserModel.h
//  JobsModel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JobsUserModel_h
#define JobsUserModel_h

#import <Foundation/Foundation.h>
#import <JobsModel/BaseModel.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
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

@interface JobsUserModel : BaseModel <BaseProtocol>

Prop_copy()NSString *userName;
Prop_copy()NSString *userHeader;/// 用户头像URL
Prop_strong()UIImage *userHeaderIMG;/// 用户头像图像 ⚠️ 直接归档存不进去，要做特殊的处理
Prop_copy()NSString *userRacnkClass;/// 用户等级
Prop_copy()NSString *password;
Prop_copy()NSString *token;
Prop_copy()NSString *expireTime;
Prop_copy()NSString *uid;
Prop_copy()NSString *deviceId;/// 设备ID
Prop_copy()NSString *validate;/// 网易云盾
Prop_copy()NSString *resourcesAddress;/// 文件服务器地址
Prop_copy()NSString *postDraftURLStr;/// 保存用户编辑中的文字

Prop_copy()NSString *account;
Prop_copy()NSString *domain;/// 域名配置
Prop_copy()NSString *email;/// 邮箱
Prop_copy()NSString *headImg;
Prop_copy()NSString *inviteCode;/// 邀请码
Prop_copy()NSString *name;/// 名称
Prop_copy()NSString *phone;/// 手机号
Prop_copy()NSString *qq;
Prop_copy()NSString *realName;/// 真实姓名
Prop_copy()NSString *superiorAccount;/// 上级账号
Prop_strong()NSNumber *userId;
Prop_copy()NSString *webChat;

Prop_copy()NSString *tokenExpireTime;/// 手动添加的

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsUserModel *_Nonnull jobsMakeUserModel(jobsByUserModelBlock _Nonnull block){
    JobsUserModel *data = JobsUserModel.alloc.init;
    if (block) block(data);
    return data;
}

#endif /* JobsUserModel_h */
