//
//  JobsBioKit.h
//  JobsBioKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSBIOKIT_BF73A67F98
#define JOBS_HEADER_GUARD_JOBSBIOKIT_BF73A67F98

#import <Foundation/Foundation.h>
#import <LocalAuthentication/LocalAuthentication.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, JobsBioKitType) {
    JobsBioKitTypeNone = 0,
    JobsBioKitTypeTouchID,
    JobsBioKitTypeFaceID,
    JobsBioKitTypeOpticID,
    JobsBioKitTypeUnknown
};

typedef NS_ENUM(NSUInteger, JobsBioKitResult) {
    JobsBioKitResultSuccess = 0,
    JobsBioKitResultAuthenticationFailed,
    JobsBioKitResultUserCancel,
    JobsBioKitResultUserFallback,
    JobsBioKitResultSystemCancel,
    JobsBioKitResultPasscodeNotSet,
    JobsBioKitResultBiometryNotAvailable,
    JobsBioKitResultBiometryNotEnrolled,
    JobsBioKitResultBiometryLockout,
    JobsBioKitResultAppCancel,
    JobsBioKitResultInvalidContext,
    JobsBioKitResultNotInteractive,
    JobsBioKitResultCompanionNotAvailable,
    JobsBioKitResultFailed
};

typedef void(^JobsBioKitReply)(JobsBioKitResult result,
                               BOOL success,
                               NSError * _Nullable error);

@interface JobsBioKit : NSObject

/// 单例入口，适合需要统一管理认证策略的场景。
+ (instancetype)shared;

/// 当前设备支持的生物识别类型。
+ (JobsBioKitType)biometryType;

/// 获取当前生物识别类型对应的可读名称。
+ (NSString *)biometryName;

/// 当前设备是否可进行生物识别认证。
+ (BOOL)isBiometryAvailable:(NSError * _Nullable * _Nullable)error;

/// 当前设备是否可进行设备所有者认证（生物识别 / 设备密码 / 其他系统支持方式）。
+ (BOOL)isDeviceOwnerAuthenticationAvailable:(NSError * _Nullable * _Nullable)error;

/// 发起身份认证。
/// @param reason 系统弹窗展示的认证原因。
/// @param allowPasscodeFallback YES：优先使用设备所有者认证，失败后允许系统回退到设备密码；NO：仅允许生物识别。
/// @param reply 统一主线程回调。
+ (void)authenticateWithReason:(NSString *)reason
         allowPasscodeFallback:(BOOL)allowPasscodeFallback
                         reply:(JobsBioKitReply)reply;

/// 发起身份认证，支持自定义 fallback 标题。
/// @param localizedFallbackTitle 自定义“输入密码”按钮标题。传 nil 使用系统默认标题；传 @"" 可隐藏该按钮。
+ (void)authenticateWithReason:(NSString *)reason
        localizedFallbackTitle:(nullable NSString *)localizedFallbackTitle
         allowPasscodeFallback:(BOOL)allowPasscodeFallback
                         reply:(JobsBioKitReply)reply;

/// 将系统错误转换为业务结果枚举。
+ (JobsBioKitResult)resultForError:(nullable NSError *)error;

@end

NS_ASSUME_NONNULL_END
#endif /* JOBS_HEADER_GUARD_JOBSBIOKIT_BF73A67F98 */
