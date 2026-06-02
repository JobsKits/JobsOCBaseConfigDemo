//
//  GTCaptcha4ResultModel.h
//  JobsModel
//
//  Created by Jobs on 2026/5/14.
//

#import <Foundation/Foundation.h>
#import "DefineProperty.h"

#if __has_include(<GTCaptcha4/GTCaptcha4.h>)
#import <GTCaptcha4/GTCaptcha4.h>
#else
#import "GTCaptcha4.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface GTCaptcha4ResultModel : NSObject
/// 成功
Prop_copy()NSString *pass_token;
Prop_copy()NSString *gen_time;
Prop_copy()NSString *captcha_output;
Prop_copy()NSString *captcha_id;
Prop_copy()NSString *lot_number;
/// 失败
Prop_copy()NSString *challenge;
Prop_assign()NSInteger failCount;
Prop_copy()NSString *lotNumber;
Prop_copy()NSString *captchaType;
Prop_copy()NSString *captchaId;

@end

NS_ASSUME_NONNULL_END
