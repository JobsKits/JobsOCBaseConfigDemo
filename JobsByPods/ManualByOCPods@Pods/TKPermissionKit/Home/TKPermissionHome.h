//
//  TKPermissionHome.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <HomeKit/HomeKit.h>
#import <TKPermissionKit/TKPermissionPublic.h>

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
/**
 功能：HomeKit住宅数据 权限获取与请求
 要求：iOS8.0+
 注意: 需要打开项目中的HomeKit

 权限描述:
 NSHomeKitUsageDescription 需要您的同意，才能访问HomeKit
 */
@interface TKPermissionHome : NSObject<HMHomeManagerDelegate>
+(TKPermissionHome *)shared;
///  请求HomeKit住宅数据权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion;

@end

NS_ASSUME_NONNULL_END
