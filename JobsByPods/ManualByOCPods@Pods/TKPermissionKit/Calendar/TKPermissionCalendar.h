//
//  TKPermissionCalendar.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>
#import <TKPermissionKit/TKPermissionPublic.h>

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

NS_ASSUME_NONNULL_BEGIN
/**
 功能：日历权限获取与请求
 要求：iOS6.0+
 
 权限描述:
 NSCalendarsUsageDescription 需要您的同意，才能访问日历
 */
@interface TKPermissionCalendar : NSObject
///   请求日历权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
requestFullAccessToEventsWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestFullAccessToEventsWithCompletion
requestWriteOnlyAccessToEventsWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestWriteOnlyAccessToEventsWithCompletion
requestFullAccessToRemindersWithCompletion:(JobsEKEventStoreRequestAccessCompletionHandler)requestFullAccessToRemindersWithCompletion
          completion:(void(^ _Nullable)(BOOL isAuth))completion;
/// 查询是否获取了 日历 权限
+(BOOL)checkAuth;

@end

NS_ASSUME_NONNULL_END
