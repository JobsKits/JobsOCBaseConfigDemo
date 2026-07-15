//
//  NSObject+UserNotifications.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_USERNOTIFICATIONS_DB966D423B
#define JOBS_HEADER_GUARD_NSOBJECT_USERNOTIFICATIONS_DB966D423B

#import <Foundation/Foundation.h>
#import <UserNotifications/UserNotifications.h> // 提供本地通知和远程通知处理能力，是现代通知框架的统一入口。
#import <UniformTypeIdentifiers/UTCoreTypes.h>  // 用于识别文件/数据类型（例如：图片、视频、文本、PDF、URL 等系统标准类型）常用于文件选择、分享、拖拽、剪贴板、文档导入导出等场景
#import "NSObject+UNUserNotificationCenterDelegate.h"
#import "JobsLanMgr.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (UserNotifications)
/// 用户通知中心
-(UNUserNotificationCenter *)notificationCenter;
/// 获取通知授权和设置
-(void)userNotificationCenter:(UNUserNotificationCenter *_Nonnull)userNotificationCenter
     authorizationStatusBlock:(jobsByIDBlock _Nullable)authorizationStatusBlock;
/// 初始化一个本地通知
-(UNMutableNotificationContent *)userNotificationInit;
/// 设置通知附件内容
/// 注意：URL必须是一个有效的文件路径，不然会报错
-(UNNotificationAttachment *)notificationAttachmentInitByPath:(NSString *)path;
/// 触发模式
-(UNTimeIntervalNotificationTrigger *)notificationTriggerWithTimeInterval:(NSTimeInterval)timeInterval
                                                                  repeats:(BOOL)repeats;
/// 创建一个发送请求
-(UNNotificationRequest *)notificationRequestInitWithIdentifier:(NSString *_Nullable)identifier
                                                        content:(UNMutableNotificationContent *_Nullable)notificationContent
                                                        trigger:(UNTimeIntervalNotificationTrigger *_Nullable)notificationTrigger;
/// 将通知请求添加到通知中心
-(void)notificationCenter:(UNUserNotificationCenter *_Nullable)notificationCenter
   addNotificationRequest:(UNNotificationRequest *_Nullable)notificationRequest
           withIdentifier:(NSString *_Nullable)identifier;
/// 本地通知的相关管理
-(void)userNotificationManager:(UNUserNotificationCenter *_Nullable)userNotificationCenter;

@end

NS_ASSUME_NONNULL_END
/**
 调用方式：[self notificationCenter:nil addNotificationRequest:nil withIdentifier:nil];
 */
#endif /* JOBS_HEADER_GUARD_NSOBJECT_USERNOTIFICATIONS_DB966D423B */
