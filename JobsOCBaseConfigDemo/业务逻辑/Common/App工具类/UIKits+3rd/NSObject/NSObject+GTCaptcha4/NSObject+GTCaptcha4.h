//
//  NSObject+GTCaptcha4.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "APIKey.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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
///【极验验证码】 https://www2.geetest.com/
@interface NSObject (GTCaptcha4)<GTCaptcha4SessionTaskDelegate>
/// Data
Prop_strong()GTCaptcha4Model *captcha4Model;
Prop_strong()GTCaptcha4Session *captchaSession;
/// 显示验证码
-(jobsByVoidBlock _Nonnull)show_verifyCode_GTCaptcha4;

@end

@interface GTCaptcha4Model (GTCaptcha4SessionDSL)
-(JobsRetGTCaptcha4ModelByGTCaptcha4SessionPointerBlock _Nonnull)byCaptchaSession;
@end

@interface GTCaptcha4Session (GTCaptcha4SessionDSL)
-(JobsRetGTCaptcha4SessionByIDBlock _Nonnull)byDelegate;
@end

NS_ASSUME_NONNULL_END
