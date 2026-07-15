//
//  JobsBioKit.m
//  JobsBioKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBioKit.h"

@implementation JobsBioKit
+ (instancetype)shared {
    static JobsBioKit *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

+ (JobsBioKitType)biometryType {
    LAContext *context = [[LAContext alloc] init];
    NSError *error = nil;
    [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
    if (@available(iOS 11.0, *)) {
        switch (context.biometryType) {
            case LABiometryTypeNone:
                return JobsBioKitTypeNone;
            case LABiometryTypeTouchID:
                return JobsBioKitTypeTouchID;
            case LABiometryTypeFaceID:
                return JobsBioKitTypeFaceID;
#if defined(__IPHONE_17_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_0
            case LABiometryTypeOpticID:
                return JobsBioKitTypeOpticID;
#endif
            default:
                return JobsBioKitTypeUnknown;
        }
    };return JobsBioKitTypeTouchID;
}

+ (NSString *)biometryName {
    switch ([self biometryType]) {
        case JobsBioKitTypeTouchID:
            return @"Touch ID";
        case JobsBioKitTypeFaceID:
            return @"Face ID";
        case JobsBioKitTypeOpticID:
            return @"Optic ID";
        case JobsBioKitTypeNone:
            return @"None";
        default:
            return @"Unknown";
    }
}

+ (BOOL)isBiometryAvailable:(NSError * _Nullable __autoreleasing *)error {
    LAContext *context = [[LAContext alloc] init];
    return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                                error:error];
}

+ (BOOL)isDeviceOwnerAuthenticationAvailable:(NSError * _Nullable __autoreleasing *)error {
    LAContext *context = [[LAContext alloc] init];
    return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication
                                error:error];
}

+ (void)authenticateWithReason:(NSString *)reason
         allowPasscodeFallback:(BOOL)allowPasscodeFallback
                         reply:(JobsBioKitReply)reply {
    [self authenticateWithReason:reason
          localizedFallbackTitle:nil
           allowPasscodeFallback:allowPasscodeFallback
                           reply:reply];
}

+ (void)authenticateWithReason:(NSString *)reason
        localizedFallbackTitle:(NSString *)localizedFallbackTitle
         allowPasscodeFallback:(BOOL)allowPasscodeFallback
                         reply:(JobsBioKitReply)reply {
    NSParameterAssert(reason.length > 0);
    LAContext *context = [[LAContext alloc] init];
    if (localizedFallbackTitle) {
        context.localizedFallbackTitle = localizedFallbackTitle;
    }
    LAPolicy policy = allowPasscodeFallback
    ? LAPolicyDeviceOwnerAuthentication
    : LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    NSError *error = nil;
    BOOL available = [context canEvaluatePolicy:policy error:&error];
    if (!available) {
        [self dispatchReply:reply
                     result:[self resultForError:error]
                    success:NO
                      error:error];
        return;
    }
    [context evaluatePolicy:policy
            localizedReason:reason
                      reply:^(BOOL success, NSError * _Nullable evaluateError) {
        JobsBioKitResult result = success ? JobsBioKitResultSuccess : [self resultForError:evaluateError];
        [self dispatchReply:reply
                     result:result
                    success:success
                      error:evaluateError];
    }];
}

+ (JobsBioKitResult)resultForError:(NSError *)error {
    if (!error) {
        return JobsBioKitResultFailed;
    }
    if (![error.domain isEqualToString:LAErrorDomain]) {
        return JobsBioKitResultFailed;
    }
    switch (error.code) {
        case LAErrorAuthenticationFailed:
            return JobsBioKitResultAuthenticationFailed;
        case LAErrorUserCancel:
            return JobsBioKitResultUserCancel;
        case LAErrorUserFallback:
            return JobsBioKitResultUserFallback;
        case LAErrorSystemCancel:
            return JobsBioKitResultSystemCancel;
        case LAErrorPasscodeNotSet:
            return JobsBioKitResultPasscodeNotSet;
#if defined(LAErrorBiometryNotAvailable)
        case LAErrorBiometryNotAvailable:
            return JobsBioKitResultBiometryNotAvailable;
#endif
#if defined(LAErrorTouchIDNotAvailable)
        case LAErrorTouchIDNotAvailable:
            return JobsBioKitResultBiometryNotAvailable;
#endif
#if defined(LAErrorBiometryNotEnrolled)
        case LAErrorBiometryNotEnrolled:
            return JobsBioKitResultBiometryNotEnrolled;
#endif
#if defined(LAErrorTouchIDNotEnrolled)
        case LAErrorTouchIDNotEnrolled:
            return JobsBioKitResultBiometryNotEnrolled;
#endif
#if defined(LAErrorBiometryLockout)
        case LAErrorBiometryLockout:
            return JobsBioKitResultBiometryLockout;
#endif
#if defined(LAErrorTouchIDLockout)
        case LAErrorTouchIDLockout:
            return JobsBioKitResultBiometryLockout;
#endif
        case LAErrorAppCancel:
            return JobsBioKitResultAppCancel;
        case LAErrorInvalidContext:
            return JobsBioKitResultInvalidContext;
#if defined(LAErrorNotInteractive)
        case LAErrorNotInteractive:
            return JobsBioKitResultNotInteractive;
#endif
#if defined(LAErrorCompanionNotAvailable)
        case LAErrorCompanionNotAvailable:
            return JobsBioKitResultCompanionNotAvailable;
#endif
        default:
            return JobsBioKitResultFailed;
    }
}

+ (void)dispatchReply:(JobsBioKitReply)reply
               result:(JobsBioKitResult)result
              success:(BOOL)success
                error:(NSError *)error {
    if (!reply) {
        return;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        reply(result, success, error);
    });
}

@end
