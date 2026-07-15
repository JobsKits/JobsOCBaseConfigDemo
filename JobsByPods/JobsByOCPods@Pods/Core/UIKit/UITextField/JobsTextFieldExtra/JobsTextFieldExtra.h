//
//  JobsTextFieldExtra.h
//  JobsByOCPods
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import <UIKit/UIKit.h>

#ifndef JobsTextFieldExtra_h
#define JobsTextFieldExtra_h
#pragma mark —— Category

#if __has_include(<JobsOCDSL/JobsOCDSL.h>)
#import <JobsOCDSL/JobsOCDSL.h>
#else
#import "JobsOCDSL.h"
#endif

#import <JobsByOCPods/UITextField+Extra.h>
#import <JobsByOCPods/UITextField+Animation.h>
#import <JobsByOCPods/UITextField+Placeholder.h>

#if __has_include(<JobsOCDefs/JobsDefines.h>)
#import <JobsOCDefs/JobsDefines.h>
#else
#import "JobsDefines.h"
#endif

#endif /* JobsTextFieldExtra_h */
/**

     /// 如果UITextField可用
     /// 创建每个输入框的信号：结合 `rac_textSignal` 和 KVO 信号
     -(id<NSFastEnumeration>)makeSignals1{
         @jobs_weakify(self);
         return jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             @jobs_strongify(self)
             /// 获取所有需要监控的输入框
     //        data.add(textField1.rac_textSignal)
     //        .add(textField2.rac_textSignal);
         });
     }
     /// 如果UITextField不可用，则监控UITextField.text
     -(NSArray<RACSignal *>*_Nonnull)makeSignals2{
         @jobs_weakify(self);
         return [jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
             @jobs_strongify(self)
             /// 获取所有需要监控的输入框
     //            data.add(textField1.realTextField)
     //            .add(textField2.realTextField);
         }).rac_sequence map:^id(UITextField *textField) {
             return [RACSignal merge:jobsMakeMutArr(^(__kindof NSMutableArray * _Nullable data) {
                 data.add(textField.rac_textSignal);/// 监听用户输入
                 data.add(RACObserve(textField, text));/// 监听直接设置的 text
             })];
         }].array;
     }

     -(void)checkInput{
         @jobs_weakify(self);
         /// 合并信号并处理逻辑
         [[RACSignal combineLatest:self.makeSignals1 /// 或者 self.makeSignals2
                            reduce:^id(NSString *text1,
                                       NSString *text2) {
             /// 检查每个输入框是否有值
             return @(
                 isValue(text1) &&
                 isValue(text2)
             );
         }] subscribeNext:^(NSNumber *bothHaveText) {
         @jobs_strongify(self)
         self.submitBtn.enabled = bothHaveText.boolValue;
          if (bothHaveText.boolValue) {
              self.submitBtn.jobsResetBtnBgImage(@"SUBMIT（可点击）".img);
          }else{
              self.submitBtn.jobsResetBtnBgImage(@"SUBMIT（不可点击）".img);
          }
        }];
  }
 */
