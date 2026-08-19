//
//  JobsBioKit.m
//  JobsBioKit
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsBioKit.h"

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LAContext
@interface LAContext (JobsLocalPropertyDSLAutogen_68626325a0)
-(JobsRetLAContextByNSStringBlock _Nonnull)byLocalizedFallbackTitle;
-(void)setLocalizedFallbackTitle:(NSString * _Nullable)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LAContext

@implementation JobsBioKit
+ (JobsRetIDByVoidBlock _Nonnull)shared {
    return ^id{
        static JobsBioKit *instance = nil;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [[self alloc] init];
        });
        return instance;
    };
}

+ (JobsRetJobsBioKitTypeByVoidBlock _Nonnull)biometryType {
    return ^JobsBioKitType{
        LAContext *context = [[LAContext alloc] init];
        NSError *error = nil;
        [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error];
        if (@available(iOS 11.0, *)) {
            switch (context.biometryType) {
                /// 处理 LABiometryTypeNone 分支
                case LABiometryTypeNone:
                    return JobsBioKitTypeNone;
                /// 处理 LABiometryTypeTouchID 分支
                case LABiometryTypeTouchID:
                    return JobsBioKitTypeTouchID;
                /// 处理 LABiometryTypeFaceID 分支
                case LABiometryTypeFaceID:
                    return JobsBioKitTypeFaceID;
    #if defined(__IPHONE_17_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_17_0
                /// 处理 LABiometryTypeOpticID 分支
                case LABiometryTypeOpticID:
                    return JobsBioKitTypeOpticID;
    #endif
                /// 未匹配已知分支时执行兜底处理
                default:
                    return JobsBioKitTypeUnknown;
            }
        };return JobsBioKitTypeTouchID;
    };
}

+ (JobsRetStrByVoidBlock _Nonnull)biometryName {
    return ^NSString *_Nullable{
        switch (self.biometryType()) {
            /// 处理 JobsBioKitTypeTouchID 分支
            case JobsBioKitTypeTouchID:
                return @"Touch ID";
            /// 处理 JobsBioKitTypeFaceID 分支
            case JobsBioKitTypeFaceID:
                return @"Face ID";
            /// 处理 JobsBioKitTypeOpticID 分支
            case JobsBioKitTypeOpticID:
                return @"Optic ID";
            /// 处理 JobsBioKitTypeNone 分支
            case JobsBioKitTypeNone:
                return @"None";
            /// 未匹配已知分支时执行兜底处理
            default:
                return @"Unknown";
        }
    };
}

+(JobsRetBOOLByNSErrorBlock _Nonnull)isBiometryAvailable{
    return ^BOOL(NSError * _Nullable __autoreleasing * error){
        LAContext *context = [[LAContext alloc] init];
        return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics
                                    error:error];
    };
}

+(JobsRetBOOLByNSErrorBlock _Nonnull)isDeviceOwnerAuthenticationAvailable{
    return ^BOOL(NSError * _Nullable __autoreleasing * error){
        LAContext *context = [[LAContext alloc] init];
        return [context canEvaluatePolicy:LAPolicyDeviceOwnerAuthentication
                                    error:error];
    };
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
        context.byLocalizedFallbackTitle(localizedFallbackTitle);
    }
    LAPolicy policy = allowPasscodeFallback
    ? LAPolicyDeviceOwnerAuthentication
    : LAPolicyDeviceOwnerAuthenticationWithBiometrics;
    NSError *error = nil;
    BOOL available = [context canEvaluatePolicy:policy error:&error];
    if (!available) {
        [self dispatchReply:reply
                     result:self.resultForError(error)
                    success:NO
                      error:error];
        return;
    }
    [context evaluatePolicy:policy
            localizedReason:reason
                      reply:^(BOOL success, NSError * _Nullable evaluateError) {
        JobsBioKitResult result = success ? JobsBioKitResultSuccess : self.resultForError(evaluateError);
        [self dispatchReply:reply
                     result:result
                    success:success
                      error:evaluateError];
    }];
}

+(JobsRetJobsBioKitResultByNSErrorBlock _Nonnull)resultForError{
    return ^JobsBioKitResult(NSError * error){
        if (!error) {
            return JobsBioKitResultFailed;
        }
        if (![error.domain isEqualToString:LAErrorDomain]) {
            return JobsBioKitResultFailed;
        }
        switch (error.code) {
            /// 处理 LAErrorAuthenticationFailed 分支
            case LAErrorAuthenticationFailed:
                return JobsBioKitResultAuthenticationFailed;
            /// 处理 LAErrorUserCancel 分支
            case LAErrorUserCancel:
                return JobsBioKitResultUserCancel;
            /// 处理 LAErrorUserFallback 分支
            case LAErrorUserFallback:
                return JobsBioKitResultUserFallback;
            /// 处理 LAErrorSystemCancel 分支
            case LAErrorSystemCancel:
                return JobsBioKitResultSystemCancel;
            /// 处理 LAErrorPasscodeNotSet 分支
            case LAErrorPasscodeNotSet:
                return JobsBioKitResultPasscodeNotSet;
    #if defined(LAErrorBiometryNotAvailable)
            /// 处理 LAErrorBiometryNotAvailable 分支
            case LAErrorBiometryNotAvailable:
                return JobsBioKitResultBiometryNotAvailable;
    #endif
    #if defined(LAErrorTouchIDNotAvailable)
            /// 处理 LAErrorTouchIDNotAvailable 分支
            case LAErrorTouchIDNotAvailable:
                return JobsBioKitResultBiometryNotAvailable;
    #endif
    #if defined(LAErrorBiometryNotEnrolled)
            /// 处理 LAErrorBiometryNotEnrolled 分支
            case LAErrorBiometryNotEnrolled:
                return JobsBioKitResultBiometryNotEnrolled;
    #endif
    #if defined(LAErrorTouchIDNotEnrolled)
            /// 处理 LAErrorTouchIDNotEnrolled 分支
            case LAErrorTouchIDNotEnrolled:
                return JobsBioKitResultBiometryNotEnrolled;
    #endif
    #if defined(LAErrorBiometryLockout)
            /// 处理 LAErrorBiometryLockout 分支
            case LAErrorBiometryLockout:
                return JobsBioKitResultBiometryLockout;
    #endif
    #if defined(LAErrorTouchIDLockout)
            /// 处理 LAErrorTouchIDLockout 分支
            case LAErrorTouchIDLockout:
                return JobsBioKitResultBiometryLockout;
    #endif
            /// 处理 LAErrorAppCancel 分支
            case LAErrorAppCancel:
                return JobsBioKitResultAppCancel;
            /// 处理 LAErrorInvalidContext 分支
            case LAErrorInvalidContext:
                return JobsBioKitResultInvalidContext;
    #if defined(LAErrorNotInteractive)
            /// 处理 LAErrorNotInteractive 分支
            case LAErrorNotInteractive:
                return JobsBioKitResultNotInteractive;
    #endif
    #if defined(LAErrorCompanionNotAvailable)
            /// 处理 LAErrorCompanionNotAvailable 分支
            case LAErrorCompanionNotAvailable:
                return JobsBioKitResultCompanionNotAvailable;
    #endif
            /// 未匹配已知分支时执行兜底处理
            default:
                return JobsBioKitResultFailed;
        }
    };
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

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN LAContext
@implementation LAContext (JobsLocalPropertyDSLAutogen_68626325a0)
-(JobsRetLAContextByNSStringBlock _Nonnull)byLocalizedFallbackTitle{
    @jobs_weakify(self)
    return ^__kindof LAContext * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setLocalizedFallbackTitle:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END LAContext
