//
//  NSObject+NTESVerifyCodeManager.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSObject+NTESVerifyCodeManager.h"

@implementation NTESVerifyCodeManager (JobsVerifyCodeDSL)
-(JobsRetNTESVerifyCodeManagerByIDBlock _Nonnull)byDelegate{
    @jobs_weakify(self)
    return ^__kindof NTESVerifyCodeManager *_Nullable(id _Nullable data){
        @jobs_strongify(self)
        if (!self) return nil;
        self.delegate = data;
        return self;
    };
}

#define JOBS_NTES_MANAGER_SCALAR_DSL(_type_, _block_type_, _selector_, _property_) \
-(_block_type_ _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof NTESVerifyCodeManager *_Nullable(_type_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_NTES_MANAGER_SCALAR_DSL(CGFloat, JobsRetNTESVerifyCodeManagerByCGFloatBlock, byAlpha, alpha)
JOBS_NTES_MANAGER_SCALAR_DSL(CGRect, JobsRetNTESVerifyCodeManagerByCGRectBlock, byFrame, frame)
JOBS_NTES_MANAGER_SCALAR_DSL(NTESVerifyCodeLang, JobsRetNTESVerifyCodeManagerByLangBlock, byLang, lang)
JOBS_NTES_MANAGER_SCALAR_DSL(NTESUserInterfaceStyle, JobsRetNTESVerifyCodeManagerByInterfaceStyleBlock, byUserInterfaceStyle, userInterfaceStyle)
JOBS_NTES_MANAGER_SCALAR_DSL(NTESVerifyCodeProtocol, JobsRetNTESVerifyCodeManagerByProtocolBlock, byProtocol, protocol)
JOBS_NTES_MANAGER_SCALAR_DSL(BOOL, JobsRetNTESVerifyCodeManagerByBOOLBlock, byOpenFallBack, openFallBack)
JOBS_NTES_MANAGER_SCALAR_DSL(NSUInteger, JobsRetNTESVerifyCodeManagerByNSUIntegerBlock, byFallBackCount, fallBackCount)
JOBS_NTES_MANAGER_SCALAR_DSL(BOOL, JobsRetNTESVerifyCodeManagerByBOOLBlock, byCloseButtonHidden, closeButtonHidden)

#undef JOBS_NTES_MANAGER_SCALAR_DSL

-(JobsRetNTESVerifyCodeManagerByCorBlock _Nonnull)byColor{
    @jobs_weakify(self)
    return ^__kindof NTESVerifyCodeManager *_Nullable(UIColor *_Nullable data){
        @jobs_strongify(self)
        self.color = data;
        return self;
    };
}

@end

@implementation NTESVerifyCodeStyleConfig (JobsVerifyCodeDSL)
#define JOBS_NTES_STYLE_DSL(_type_, _block_type_, _selector_, _property_) \
-(_block_type_ _Nonnull)_selector_{ \
    @jobs_weakify(self) \
    return ^__kindof NTESVerifyCodeStyleConfig *_Nullable(_type_ data){ \
        @jobs_strongify(self) \
        self._property_ = data; \
        return self; \
    }; \
}

JOBS_NTES_STYLE_DSL(NTESCapBarTextAlign, JobsRetNTESVerifyCodeStyleConfigByTextAlignBlock, byCapBarTextAlign, capBarTextAlign)
JOBS_NTES_STYLE_DSL(NSString *, JobsRetNTESVerifyCodeStyleConfigByStrBlock, byCapBarTextColor, capBarTextColor)
JOBS_NTES_STYLE_DSL(NSUInteger, JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock, byCapBarTextSize, capBarTextSize)
JOBS_NTES_STYLE_DSL(NSString *, JobsRetNTESVerifyCodeStyleConfigByStrBlock, byCapBarTextWeight, capBarTextWeight)
JOBS_NTES_STYLE_DSL(NSString *, JobsRetNTESVerifyCodeStyleConfigByStrBlock, byBorderColor, borderColor)
JOBS_NTES_STYLE_DSL(NSUInteger, JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock, byRadius, radius)
JOBS_NTES_STYLE_DSL(NSUInteger, JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock, byBorderRadius, borderRadius)
JOBS_NTES_STYLE_DSL(NSString *, JobsRetNTESVerifyCodeStyleConfigByStrBlock, byBackgroundMoving, backgroundMoving)
JOBS_NTES_STYLE_DSL(NSUInteger, JobsRetNTESVerifyCodeStyleConfigByNSUIntegerBlock, byExecuteBorderRadius, executeBorderRadius)
JOBS_NTES_STYLE_DSL(NSString *, JobsRetNTESVerifyCodeStyleConfigByStrBlock, byExecuteBackground, executeBackground)

#undef JOBS_NTES_STYLE_DSL
@end

@implementation NSObject (NTESVerifyCodeManager)
#pragma mark —— BaseProtocol
// 显示验证码
-(jobsByVoidBlock _Nonnull)show_verifyCode_NTES{
    @jobs_weakify(self)
    return ^(){
        @jobs_strongify(self)
        [self.verifyCodeManager openVerifyCodeView:nil];
    };
}
#pragma mark —— NTESVerifyCodeManagerDelegate
/// 验证码组件初始化完成
- (void)verifyCodeInitFinish{
    JobsLog(@"收到初始化完成的回调");
}
/// 验证码组件初始化出错
- (void)verifyCodeInitFailed:(NSArray *)error {
    JobsLog(@"收到初始化失败的回调:%@",error);
}
/// 完成验证之后的回调
/// - Parameters:
///   - result: 验证结果 BOOL:YES/NO
///   - validate: 二次校验数据，如果验证结果为false，validate返回空
///   - message: 结果描述信息
- (void)verifyCodeValidateFinish:(BOOL)result
                        validate:(NSString *)validate
                         message:(NSString *)message{
    JobsLog(@"收到验证结果的回调:(%d,%@,%@)", result, validate, message);
}
/// 关闭验证码窗口后的回调
- (jobsByVoidBlock _Nonnull)verifyCodeCloseWindow{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        //用户关闭验证后执行的方法
        JobsLog(@"收到关闭验证码视图的回调");
    };
}

- (void)verifyCodeCloseWindow:(NTESVerifyCodeClose)close {
    /// TODO
}
#pragma mark —— Prop_strong()NTESVerifyCodeManager *verifyCodeManager;
JobsKey(_verifyCodeManager)
@dynamic verifyCodeManager;
-(NTESVerifyCodeManager *)verifyCodeManager{
    NTESVerifyCodeManager *VerifyCodeManager = Jobs_getAssociatedObject(_verifyCodeManager);
    if(!VerifyCodeManager){
        /// 获取验证码管理对象
        VerifyCodeManager = NTESVerifyCodeManager.getInstance;
        VerifyCodeManager.byDelegate(self);
        [VerifyCodeManager configureVerifyCode:网易易盾KEY 
                                       timeout:7.0
                                   styleConfig:self.verifyCodeStyleConfig];
        /**
         NTESVerifyCodeLangCN = 1, // 中文
         NTESVerifyCodeLangENUS,   // 美式英文
         NTESVerifyCodeLangENGB,   // 英式英文
         NTESVerifyCodeLangTW,     // 台湾繁体
         NTESVerifyCodeLangHK,     // 香港繁体
         NTESVerifyCodeLangFIL,    // 菲律宾语
         */
        // 设置语言
        switch (LanMgr.language) {
            /// 处理 AppLanguageChineseSimplified 分支
            case AppLanguageChineseSimplified:{
                VerifyCodeManager.byLang(NTESVerifyCodeLangCN);
            } break;
            /// 处理 AppLanguageChineseTraditional 分支
            case AppLanguageChineseTraditional:{
                VerifyCodeManager.byLang(NTESVerifyCodeLangTW);
            } break;
            /// 处理 AppLanguageEnglish 分支
            case AppLanguageEnglish:{
                VerifyCodeManager.byLang(NTESVerifyCodeLangENUS);
            } break;
            /// 处理 AppLanguageTagalog 分支
            case AppLanguageTagalog:{
                VerifyCodeManager.byLang(NTESVerifyCodeLangFIL);
            } break;
        /// 未匹配已知分支时执行兜底处理
        default:
                break;
        }
        // 设置透明度
        VerifyCodeManager.byAlpha(0.3)
            .byUserInterfaceStyle(NTESUserInterfaceStyleDark)
            .byColor(JobsBlackColor)
            .byFrame(CGRectNull)
            .byProtocol(NTESVerifyCodeProtocolHttps)
            .byOpenFallBack(YES)
            .byFallBackCount(3)
            .byCloseButtonHidden(NO);
        Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeManager, VerifyCodeManager)
    };return VerifyCodeManager;
}

-(void)setVerifyCodeManager:(NTESVerifyCodeManager *)verifyCodeManager{
    Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeManager, verifyCodeManager)
}
#pragma mark —— Prop_strong()NTESVerifyCodeStyleConfig *verifyCodeStyleConfig;
JobsKey(_verifyCodeStyleConfig)
@dynamic verifyCodeStyleConfig;
-(NTESVerifyCodeStyleConfig *)verifyCodeStyleConfig{
    NTESVerifyCodeStyleConfig *VerifyCodeStyleConfig = Jobs_getAssociatedObject(_verifyCodeStyleConfig);
    if(!VerifyCodeStyleConfig){
        VerifyCodeStyleConfig = NTESVerifyCodeStyleConfig.new
            .byCapBarTextAlign(NTESCapBarTextAlignCenter)
            .byCapBarTextColor(@"#25D4D0")
            .byCapBarTextSize(18)
            .byCapBarTextWeight(@"bold")
            .byBorderColor(@"#25D4D0")
            .byRadius(10)
            .byBorderRadius(10)
            .byBackgroundMoving(@"#DC143C")
            .byExecuteBorderRadius(10)
            .byExecuteBackground(@"#DC143C");
        Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeStyleConfig, VerifyCodeStyleConfig)
    };return VerifyCodeStyleConfig;
}

-(void)setVerifyCodeStyleConfig:(NTESVerifyCodeStyleConfig *)verifyCodeStyleConfig{
    Jobs_setAssociatedRETAIN_NONATOMIC(_verifyCodeStyleConfig, verifyCodeStyleConfig)
}

@end
