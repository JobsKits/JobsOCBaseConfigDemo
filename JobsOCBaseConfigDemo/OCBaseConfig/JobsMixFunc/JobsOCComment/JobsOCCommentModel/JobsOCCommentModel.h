//
//  JobsOCCommentModel.h
//  JobsOCComment
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#ifndef JOBS_HEADER_GUARD_JOBSOCCOMMENTMODEL_DD8EC07FD9
#define JOBS_HEADER_GUARD_JOBSOCCOMMENTMODEL_DD8EC07FD9

#import <Foundation/Foundation.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import "JobsDefines.h"
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsOCCommentModel : NSObject

/// 消息 ID，评论树里的最小唯一单元。
Prop_copy()NSString *messageID;
Prop_copy()NSString *userAvatar;
Prop_copy()NSString *nickname;
/// 一级评论可指向新闻 / 事件 ID；二级及以后指向上一级评论 ID。
Prop_copy()NSString *replyID;
Prop_copy()NSString *replyUserName;
Prop_copy()NSString *publishTime;
Prop_copy()NSString *content;
Prop_copy(nullable)NSString *device;
Prop_copy(nullable)NSString *location;
Prop_copy()NSArray <JobsOCCommentModel *>*children;

+(instancetype)commentWithMessageID:(NSString *)messageID
                         userAvatar:(NSString *)userAvatar
                           nickname:(NSString *)nickname
                             replyID:(NSString *)replyID
                       replyUserName:(NSString *_Nullable)replyUserName
                         publishTime:(NSString *)publishTime
                             content:(NSString *)content
                              device:(NSString *_Nullable)device
                            location:(NSString *_Nullable)location
                            children:(NSArray <JobsOCCommentModel *>*_Nullable)children;
-(BOOL)hasChildComments;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSOCCOMMENTMODEL_DD8EC07FD9 */
