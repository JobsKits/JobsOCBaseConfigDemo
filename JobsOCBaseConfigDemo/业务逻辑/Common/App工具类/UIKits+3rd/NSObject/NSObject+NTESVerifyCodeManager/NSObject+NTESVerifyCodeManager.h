//
//  NSObject+NTESVerifyCodeManager.h
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <objc/runtime.h>
#import <Foundation/Foundation.h>
#import "APIKey.h"

#if __has_include(<VerifyCode/NTESVerifyCodeManager.h>)
#import <VerifyCode/NTESVerifyCodeManager.h>
#else
#import "NTESVerifyCodeManager.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
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
@interface NTESVerifyCodeManager (JobsVerifyCodeDSL)
-(JobsRetNTESVerifyCodeManagerByIDBlock _Nonnull)byDelegate;
-(JobsRetNTESVerifyCodeManagerByCGFloatBlock _Nonnull)byAlpha;
-(JobsRetNTESVerifyCodeManagerByCorBlock _Nonnull)byColor;
-(JobsRetNTESVerifyCodeManagerByCGRectBlock _Nonnull)byFrame;
-(JobsRetNTESVerifyCodeManagerByLangBlock _Nonnull)byLang;
-(JobsRetNTESVerifyCodeManagerByInterfaceStyleBlock _Nonnull)byUserInterfaceStyle;
-(JobsRetNTESVerifyCodeManagerByProtocolBlock _Nonnull)byProtocol;
-(JobsRetNTESVerifyCodeManagerByBOOLBlock _Nonnull)byOpenFallBack;
-(JobsRetNTESVerifyCodeManagerByNSUIntegerBlock _Nonnull)byFallBackCount;
-(JobsRetNTESVerifyCodeManagerByBOOLBlock _Nonnull)byCloseButtonHidden;
@end

@interface NTESVerifyCodeStyleConfig (JobsVerifyCodeDSL)
-(JobsRetNTESVerifyCodeStyleConfigByTextAlignBlock _Nonnull)byCapBarTextAlign;
-(JobsRetNTESVerifyCodeStyleConfigByStrBlock _Nonnull)byCapBarTextColor;
-(JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock _Nonnull)byCapBarTextSize;
-(JobsRetNTESVerifyCodeStyleConfigByStrBlock _Nonnull)byCapBarTextWeight;
-(JobsRetNTESVerifyCodeStyleConfigByStrBlock _Nonnull)byBorderColor;
-(JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock _Nonnull)byRadius;
-(JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock _Nonnull)byBorderRadius;
-(JobsRetNTESVerifyCodeStyleConfigByStrBlock _Nonnull)byBackgroundMoving;
-(JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock _Nonnull)byExecuteBorderRadius;
-(JobsRetNTESVerifyCodeStyleConfigByStrBlock _Nonnull)byExecuteBackground;
@end

///【NTESVerifyCodeManager】 二次封装 https://github.com/yidun/NTESVerifyCode
@interface NSObject (NTESVerifyCodeManager)<NTESVerifyCodeManagerDelegate>

Prop_strong()NTESVerifyCodeManager *verifyCodeManager;
Prop_strong()NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;

-(jobsByVoidBlock _Nonnull)show_verifyCode_NTES;

@end

NS_ASSUME_NONNULL_END
