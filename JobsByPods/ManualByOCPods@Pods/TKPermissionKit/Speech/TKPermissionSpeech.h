//
//  TKPermissionSpeech.h
//  TKPermissionKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <Foundation/Foundation.h>
#import <Speech/Speech.h>
#import <TKPermissionKit/TKPermissionPublic.h>

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN
/**
 功能：Speech 语音识别权限获取与请求
 要求：iOS10.0+
 注意：Speech语音识别功能要求iOS10.0+, 低于iOS10直接返回NO

 权限描述:
 NSSpeechRecognitionUsageDescription 需要您的同意，才能访问语音识别
 */
@interface TKPermissionSpeech : NSObject
///   请求Speech 语音识别 权限
/// - Parameters:
///   - isAlert: 请求权限时，用户拒绝授予权限时。是否弹出alert进行手动设置权限 YES:弹出alert
///   - completion: 回调，用户是否申请权限成功！
+(void)authWithAlert:(BOOL)isAlert
          completion:(void(^)(BOOL isAuth))completion;
/// 查询是否获取了Speech 语音识别 权限
+(BOOL)checkAuth;

@end

NS_ASSUME_NONNULL_END
