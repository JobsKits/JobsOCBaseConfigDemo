//
//  NSObject+Notification.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#define JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42

#pragma once

#import <Foundation/Foundation.h>
#import "NSString+Extra.h"
#import "NSString+Notification.h"
#import "JobsModelDSL.h"
#import "JobsLanMgr.h"
#import "JobsOCRuntimeKits.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Notification)
/// 在主线程上带参发通知
-(jobsByKey_ValueBlock _Nonnull)JobsPost;
/// 在主线程上带参发通知
-(jobsByKeyValueModelBlock _Nonnull)JobsPostBy;
/// 在主线程上不带参发通知
-(jobsByStrBlock _Nonnull)jobsPost;
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
                     block:(jobsByTwoIDBlock _Nullable)block;
/// RAC接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
         notificationBlock:(jobsByNotificationBlock _Nullable)block;
///【监听所有通知】用 selector
-(void)monitorNotification:(NSString *_Nonnull)notificationName
              withSelector:(SEL _Nonnull)selector;
///【监听所有通知】用 Block
-(void)monitorNotification:(NSString *_Nonnull)notificationName
                 withBlock:(JobsRetIDByTwoIDBlock _Nonnull)actionBlock;
///【监听通知】设置App语言环境
-(jobsByVoidBlock _Nonnull)monitorAppLanguage;
///【发通知】设置App语言环境
-(jobsByNSIntegerBlock _Nonnull)appLanguageAtAppLanguageBy;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42 */
