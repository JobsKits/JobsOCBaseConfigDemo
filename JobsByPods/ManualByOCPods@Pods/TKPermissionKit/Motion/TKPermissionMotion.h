//
//  TKPermissionMotion.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <CoreMotion/CoreMotion.h>
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
 功能：运动与健身权限 权限获取与请求
 要求：iOS7.0+

 权限描述:
 NSMotionUsageDescription          需要您的同意，才能访问运动与健身
 */
@interface TKPermissionMotion : NSObject

+(TKPermissionMotion *)shared;
///   请求运动与健身权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion;

@end

NS_ASSUME_NONNULL_END
