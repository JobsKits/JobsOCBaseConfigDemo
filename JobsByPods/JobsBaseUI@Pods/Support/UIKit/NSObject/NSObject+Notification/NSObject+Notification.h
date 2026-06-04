//
//  NSObject+Notification.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_597BA5309A
#define JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_597BA5309A

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBaseUI/NSString+Notification.h>
#import <JobsBaseUI/NSString+Extra.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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
/// 一些需要全局化的通知
@interface NSObject (Notification)<BaseProtocol>
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

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_597BA5309A */
