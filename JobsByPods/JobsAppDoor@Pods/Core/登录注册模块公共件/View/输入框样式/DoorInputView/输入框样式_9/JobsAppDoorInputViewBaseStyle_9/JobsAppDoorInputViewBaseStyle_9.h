//
//  JobsAppDoorInputViewBaseStyle_9.h
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_9_39DC96EEC4
#define JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_9_39DC96EEC4

#import <UIKit/UIKit.h>

#if __has_include(<JobsBlock/JobsBlock.h>)
#import <JobsBlock/JobsBlock.h>
#else
#import "JobsBlock.h"
#endif
#import <JobsOCTools/JobsOCTools.h>

#if __has_include(<JobsAppDoor/JobsAppDoorInputViewBaseStyle.h>)
#import <JobsAppDoor/JobsAppDoorInputViewBaseStyle.h>
#else
#import "JobsAppDoorInputViewBaseStyle.h"
#endif

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
#endif

#if __has_include(<JobsByOCPods/JobsByOCPods.h>)
#import <JobsByOCPods/JobsByOCPods.h>
#else
#import "JobsByOCPods.h"
#endif

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

NS_ASSUME_NONNULL_BEGIN

@interface JobsAppDoorInputViewBaseStyle_9 : JobsAppDoorInputViewBaseStyle

Prop_assign()CGFloat countDownBtnWidth;
Prop_assign()CGFloat textFieldWidth;
/// 倒计时按钮（需要销毁定时器）
-(JobsRetBtnByVoidBlock _Nonnull)getCountDownBtn;
/**
 
 * 其实并不建议用init方法,而是期望带参数初始化，比如对应BaseViewProtocol里面的 - (instancetype)initWithSize:(CGSize)thisViewSize
 * 因为本类在大多数情况下是依附于一个父视图执行的，这样可以有效的避免过程值对环境的影响
 * 因为父视图在没有进行展开的时候，子视图是不展开的。那么存在生命周期的过程，会影响布局结果
    
 * 如果以后需要强行禁用init或者new，那么:
 - (instancetype)init NS_UNAVAILABLE;
 - (instancetype)new NS_UNAVAILABLE;
 */
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_9
-(JobsRetJobsAppDoorInputViewBaseStyle_9ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel;
// JOBS_PROPERTY_DSL_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_9
@end

NS_ASSUME_NONNULL_END
/**

     调用示例：
     -(JobsAppDoorInputViewBaseStyle_9 *)获取并输入手机验证码{
         if (!_获取并输入手机验证码) {
             _获取并输入手机验证码 = [JobsAppDoorInputViewBaseStyle_9.alloc initWithSize:inputSize()];
             _获取并输入手机验证码.countDownBtnWidth = JobsWidth(80);
             _获取并输入手机验证码.textFieldWidth = JobsWidth(220);
             @jobs_weakify(self)
             [_获取并输入手机验证码 actionObjBlock:^(JobsAppDoorInputViewTFModel *data) {
                 @jobs_strongify(self)
     //            if ([data isKindOfClass:JobsAppDoorInputViewTFModel.class]) {
     //                JobsAppDoorInputViewTFModel *model = (JobsAppDoorInputViewTFModel *)data;
     //                self.newsWithdrawPassword = model.resString;
     //            }
             }];

             _获取并输入手机验证码.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                 make.centerX.equalTo(self.view);
                 make.size.mas_equalTo(_获取并输入手机验证码.thisViewSize);
                 make.top.equalTo(self.选择区号并输入手机号.mas_bottom).offset(JobsWidth(32));
             });


             _获取并输入手机验证码.layer.cornerRadius = JobsWidth(52 / 2);
             _获取并输入手机验证码.layer.borderColor = HEXCOLOR(0xEEE2C8).CGColor;
             _获取并输入手机验证码.jobsRichViewByModel(.配置验证码输入);
         };return _获取并输入手机验证码;
     }

     -(JobsAppDoorInputViewBaseStyleModel *)配置验证码输入{
         if (!_配置验证码输入) {
             _配置验证码输入 = JobsAppDoorInputViewBaseStyleModel.new;
             _配置验证码输入.leftViewIMG = @"安全".img;
             _配置验证码输入.placeHolderStr = @"請輸入驗證碼".jobsTr();
             _配置验证码输入.placeholderFont = UIFontWeightRegularSize(JobsWidth(16));
             _配置验证码输入.isShowDelBtn = YES;
             _配置验证码输入.isShowSecurityBtn = NO;
             _配置验证码输入.returnKeyType = UIReturnKeyDone;
             _配置验证码输入.keyboardAppearance = UIKeyboardAppearanceAlert;
             _配置验证码输入.leftViewMode = UITextFieldViewModeAlways;
             _配置验证码输入.titleStrCor = _配置验证码输入.placeholderColor = HEXCOLOR_ALPHA(0xC4C4C4,1.f);
     //        配置_配置验证码输入码输入.fieldEditorOffset = JobsWidth(80);
         };return _配置验证码输入;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSAPPDOORINPUTVIEWBASESTYLE_9_39DC96EEC4 */
