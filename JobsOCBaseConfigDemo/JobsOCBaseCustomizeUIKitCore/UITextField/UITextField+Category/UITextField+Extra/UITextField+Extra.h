//
//  UITextField+Extra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_C6F6D7346F
#define JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_C6F6D7346F

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIButton+SimplyMake.h"
#import "UITextField+Placeholder.h"
#import "JobsString.h"
#import "NSString+Check.h"

#import "JobsOCDSL.h"

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#import "JobsLanMgr.h"

#import "JobsBlock.h"

#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Extra)

Prop_strong()__kindof UIButton *customSysClearBtn;
/// RAC 回调封装
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsRetBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock;
/// 自定义系统的清除按钮
-(JobsRetStrByStrBlock _Nonnull)getCurrentTextFieldValueByReplacementString;
/// 自定义系统的清除按钮
-(jobsByImageBlock _Nonnull)modifyClearButtonByImage;

@end

NS_ASSUME_NONNULL_END
/**
 
     -(UITextField *)idTypeTextField{
         if(!_idTypeTextField){
             @jobs_weakify(self)
             _idTypeTextField = self.addSubview(jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
                 textField.byDelegate(self)
                     .bySecureTextEntry(NO)
                     .byClearButtonMode(UITextFieldViewModeNever)
                     .byLeftViewMode(UITextFieldViewModeNever)
                     .byRightViewMode(UITextFieldViewModeNever)
                     .byText(@"")
                     .byFont(pingFangHKRegular(JobsWidth(14)))
                     .byTextCor(JobsBlackColor)
                     .byPlaceholder(@"ID Type".tr)
                     .byPlaceholderColor(JobsGrayColor)
                     .byPlaceholderFont(pingFangHKRegular(JobsWidth(14)));
             })).setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                 data.byLayerCor(@"#DEDEDE".cor)
                     .byJobsWidth(1)
                     .byCornerRadiusValue(JobsWidth(32 / 2));
             })).setMasonryBy(^(MASConstraintMaker *_Nonnull make){
                 @jobs_strongify(self)
                 make.top.equalTo(self.idTypeTitleLab.mas_bottom).offset(JobsWidth(8));
                 make.left.equalTo(self.section_1_titleLab);
                 make.width.mas_equalTo(JobsWidth(345));
             }).on();
         };return _idTypeTextField;
     }
 */
#endif /* JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_C6F6D7346F */
