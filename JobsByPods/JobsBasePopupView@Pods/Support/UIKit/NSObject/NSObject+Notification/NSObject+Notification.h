//
//  NSObject+Notification.h
//  JobsBasePopupView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42
#define JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42

#pragma once

#import <Foundation/Foundation.h>
#import <JobsBasePopupView/NSString+Extra.h>

#if __has_include(<JobsOCRuntimeKits/JobsOCRuntimeKits.h>)
#import <JobsOCRuntimeKits/JobsOCRuntimeKits.h>
#else
#import "JobsOCRuntimeKits.h"
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

@interface NSObject (Notification)
/// 接收通知
-(void)addNotificationName:(NSString *_Nonnull)notificationName
                     block:(jobsByTwoIDBlock _Nullable)block;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_NSOBJECT_NOTIFICATION_AC2430FD42 */
