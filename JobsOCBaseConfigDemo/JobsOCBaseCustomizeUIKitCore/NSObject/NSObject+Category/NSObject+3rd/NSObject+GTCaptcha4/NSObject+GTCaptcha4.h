//
//  NSObject+GTCaptcha4.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 9/12/24.
//

#import <Foundation/Foundation.h>
#import "APIKey.h"
#import "JobsBlock.h"
#import "GTCaptcha4Model.h"
#import "JobsDefineProperty.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
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
