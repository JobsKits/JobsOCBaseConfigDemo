//
//  TKPermissionSiri.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <Intents/Intents.h> // 提供 Intents 框架能力，用于 Siri、快捷指令、意图捐赠、意图处理及相关扩展开发。
#import <TKPermissionKit/TKPermissionPublic.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 功能：Siri权限获取
 要求：iOS10+
    ：需要在项目中设置Siri
 
 其它权限描述:
 NSSiriUsageDescription 需要您的同意，才能访问Siri
 */
@interface TKPermissionSiri : NSObject
///   请求Siri权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion;
/// 检查Siri权限
+(BOOL)checkAuth;

@end

NS_ASSUME_NONNULL_END
