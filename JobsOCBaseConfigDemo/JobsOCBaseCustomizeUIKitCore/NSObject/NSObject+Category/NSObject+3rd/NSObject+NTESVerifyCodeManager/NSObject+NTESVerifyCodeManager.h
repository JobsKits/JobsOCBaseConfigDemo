//
//  NSObject+NTESVerifyCodeManager.h
//  JobsOCBaseConfigDemo
//
//  Created by User on 8/2/24.
//

#import <Foundation/Foundation.h>
#import "JobsLanguageManager.h"
#import "JobsBlock.h"
#import "APIKey.h"
#import "JobsDefineProperty.h"

#if __has_include(<VerifyCode/NTESVerifyCodeManager.h>)
#import <VerifyCode/NTESVerifyCodeManager.h>
#else
#import "NTESVerifyCodeManager.h"
#endif

NS_ASSUME_NONNULL_BEGIN
@interface NTESVerifyCodeManager (JobsVerifyCodeDSL)
-(JobsRetNTESVerifyCodeManagerByIDBlock _Nonnull)byDelegate;
@end

///【NTESVerifyCodeManager】 二次封装 https://github.com/yidun/NTESVerifyCode
@interface NSObject (NTESVerifyCodeManager)<NTESVerifyCodeManagerDelegate>

Prop_strong()NTESVerifyCodeManager *verifyCodeManager;
Prop_strong()NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;

-(jobsByVoidBlock)show_verifyCode_NTES;

@end

NS_ASSUME_NONNULL_END
