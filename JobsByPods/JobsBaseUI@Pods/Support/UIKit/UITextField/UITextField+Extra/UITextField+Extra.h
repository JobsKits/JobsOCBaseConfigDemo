//
//  UITextField+Extra.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_CE9E7C197C
#define JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_CE9E7C197C

#pragma once

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import <JobsBaseUI/UIButton+SimplyMake.h>
#import <JobsBaseUI/UITextField+Placeholder.h>
#import <JobsBaseUI/NSString+Extra.h>
#import <JobsBaseUI/UIView+Measure.h>
#import <JobsBaseUI/BaseButton.h>
#import <JobsBaseUI/NSString+Check.h>

#if __has_include(<ReactiveObjC/ReactiveObjC.h>)
#import <ReactiveObjC/ReactiveObjC.h>
#else
#import "ReactiveObjC.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
#endif

#if __has_include(<JobsLanMgr/JobsLanMgr.h>)
#import <JobsLanMgr/JobsLanMgr.h>
#else
#import "JobsLanMgr.h"
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

@interface UITextField (Extra)

Prop_strong()__kindof UIButton *customSysClearBtn;
/// RAC 回调封装
-(RACDisposable *)jobsTextFieldEventFilterBlock:(JobsRetBOOLByIDBlock _Nonnull)filterBlock
                             subscribeNextBlock:(jobsByIDBlock _Nonnull)subscribeNextBlock;
/// 设置代理
-(JobsRetTextFieldByDelegateBlock _Nonnull)byDelegate;
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
         }return _idTypeTextField;
     }
 */
#endif /* JOBS_HEADER_GUARD_UITEXTFIELD_EXTRA_CE9E7C197C */
