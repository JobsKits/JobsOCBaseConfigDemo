//
//  JobsHotLabelBySingleLine.h
//  JobsHotLabel
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_JOBSHOTLABELBYSINGLELINE_023995DE53
#define JOBS_HEADER_GUARD_JOBSHOTLABELBYSINGLELINE_023995DE53

#import <UIKit/UIKit.h>

#if __has_include(<JobsOCProtocols/JobsBaseProtocolHeader.h>)
#import <JobsOCProtocols/JobsBaseProtocolHeader.h>
#else
#import "JobsBaseProtocolHeader.h"
#endif

#if __has_include(<JobsBaseUI/JobsBaseUI.h>)
#import <JobsBaseUI/JobsBaseUI.h>
#else
#import "JobsBaseUI.h"
#endif

#if __has_include(<JobsMakes/JobsMakes.h>)
#import <JobsMakes/JobsMakes.h>
#else
#import "JobsMakes.h"
#endif

#if __has_include(<JobsModelDSL/JobsModelDSL.h>)
#import <JobsModelDSL/JobsModelDSL.h>
#else
#import "JobsModelDSL.h"
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
/**
 
    1、单排显示固定样式UI（UIButton 方便图文展示）：
        1.1、如果不满一行居中显示；
        1.2、如果超过一行滑动显示；
    2、如果要显示多排固定样式UI，请移步用CollectionView实现
 */
@interface JobsHotLabelBySingleLine : BaseView

Prop_assign()CGSize elementDefaultSize; // 内置元素Size的预设值

@end

NS_ASSUME_NONNULL_END

/**

     uses

     // Data
     Prop_strong()JobsHotLabelWithSingleLine *hl;
     Prop_strong()NSMutableArray <UIViewModel *>*hotLabelDataMutArr;

     -(JobsHotLabelWithSingleLine *)hl{
         if (!_hl) {
             _hl = JobsHotLabelWithSingleLine.new;
             _hl.backgroundColor = JobsClearColor;
             _hl.labelShowingType = UILabelShowingType_05;
             _hl.hotLabelDefaultHeight = JobsWidth(30);
             @jobs_weakify(self)
             [_hl actionObjBlock:^(UIButton *btn) {
                 @jobs_strongify(self)
                 if ([btn.titleForNormalState isEqualToString:@"Top-up check in progress".tr]) {
                     self.chargeOrderType = ChargeOrderType_processing;
                 }else if ([btn.titleForNormalState isEqualToString:@"Top-up success".tr]){
                     self.chargeOrderType = ChargeOrderType_success;
                 }else if ([btn.titleForNormalState isEqualToString:@"Top-up cancel".tr]){
                     self.chargeOrderType = ChargeOrderType_cancel;
                 }else if ([btn.titleForNormalState isEqualToString:@"All".tr]){
                     self.chargeOrderType = ChargeOrderType_all;//ChargeOrderType_all;
                 }else{}

                 [self chargeOrderChargeOrderList];/// 用户充值列表
             }];
             [self.view addSubview:_hl];
             [_hl mas_makeConstraints:^(MASConstraintMaker *make) {
                 make.centerX.equalTo(self.view);
                 make.width.mas_equalTo(JobsMainScreen_WIDTH());
                 make.top.equalTo(self.dropdownMenu.mas_bottom).offset(JobsWidth(5));
                 switch (self.currentLanguageType) {
                     case HTTPRequestHeaderLanguageEn:{
                         make.height.mas_equalTo(JobsWidth(60));
                     }break;
                     case HTTPRequestHeaderLanguageCN:{
                         make.height.mas_equalTo(JobsWidth(30));
                     }break;

                     default:
                         break;
                 }

             }];
             [self.view layoutIfNeeded];
              _hl.jobsRichViewByModel(self.hotLabelDataMutArr);
         }return _hl;
     }

     -(NSMutableArray<UIViewModel *> *)hotLabelDataMutArr{
         if (!_hotLabelDataMutArr) {
             _hotLabelDataMutArr = NSMutableArray.array;

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"service_skype".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"service_qq".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"service_telegram".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"service_wechat".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"login_skype".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

             {
                 UIViewModel *vm = UIViewModel.new;
                 vm.byBgImage(@"service_meiqia".img)
                   .byText(@"".tr);
                 vm.size = CGSizeMake(JobsWidth(46), JobsWidth(46));
                 vm.byOffsetXForEach(JobsWidth(46))
                   .byOffsetYForEach(JobsWidth(46));
                 [_hotLabelDataMutArr addObject:vm];
             }

         }return _hotLabelDataMutArr;
     }
 */
#endif /* JOBS_HEADER_GUARD_JOBSHOTLABELBYSINGLELINE_023995DE53 */
