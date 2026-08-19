//
//  JobsIMListDataModel.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import "UIImage+YBGIF.h"
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

@interface JobsIMListDataModel : NSObject

/// JobsIM 用户列表沿用现有 UI 数据结构；以下协议字段用于描述“这个列表项对应哪个本地/近场 peer”。
Prop_copy()NSString *userID;
Prop_copy()NSString *peerID;
Prop_copy()NSString *usernameStr;
Prop_copy()NSString *contentStr;
Prop_copy()NSString *timeStr;
Prop_strong(nullable)UIImage *userHeaderIMG;
Prop_copy(nullable)NSString *userHeaderURLStr;
Prop_assign()JobsIMTransportKind transportKind;
Prop_assign()JobsIMPeerOnlineState peerOnlineState;
Prop_assign()NSInteger unreadCount;
Prop_copy(nullable)NSString *lastMessageID;

-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byUserID;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byPeerID;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byUsernameStr;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byContentStr;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byTimeStr;
-(JobsRetJobsIMListDataModelByImageBlock _Nonnull)byUserHeaderIMG;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byUserHeaderURLStr;
-(JobsRetJobsIMListDataModelByNSIntegerBlock _Nonnull)byTransportKind;
-(JobsRetJobsIMListDataModelByNSIntegerBlock _Nonnull)byPeerOnlineState;
-(JobsRetJobsIMListDataModelByNSIntegerBlock _Nonnull)byUnreadCount;
-(JobsRetJobsIMListDataModelByStrBlock _Nonnull)byLastMessageID;

@end

NS_ASSUME_NONNULL_END

NS_INLINE __kindof JobsIMListDataModel *_Nonnull jobsMakeIMListDataModel(jobsByIMListDataModelBlock _Nonnull block){
    JobsIMListDataModel *data = JobsIMListDataModel.alloc.init;
    if (block) block(data);
    return data;
}
