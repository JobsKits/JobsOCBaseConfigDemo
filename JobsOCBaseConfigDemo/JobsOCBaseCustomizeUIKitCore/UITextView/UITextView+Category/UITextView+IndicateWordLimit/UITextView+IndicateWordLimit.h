//
//  UITextView+IndicateWordLimit.h
//  JobsCustomView
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_UITEXTVIEW_INDICATEWORDLIMIT_22DE56C870

#if __has_include(<Masonry/Masonry.h>)
#import <Masonry/Masonry.h>
#else
#import "Masonry.h"
#endif

#define JOBS_HEADER_GUARD_UITEXTVIEW_INDICATEWORDLIMIT_22DE56C870

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "UIView+Extra.h"
#import "UIView+Measure.h"

#import "JobsOCDSL.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

NS_ASSUME_NONNULL_BEGIN
/// 用于实现右下角的字符数量监控
@interface UITextView (IndicateWordLimit)

Prop_strong()UILabel *indicateWordLimitLab;
Prop_assign()NSInteger currentWordNum;//当前输入的字符数
Prop_assign()NSInteger wordLimitNum;//字符输入上限
Prop_assign()CGFloat offsetX;
Prop_assign()CGFloat offsetY;

@end

NS_ASSUME_NONNULL_END
/**

     调用示例：

     说明：
     1、用SZTextView替代UITextView；
     2、indicateWordLimitLab要依赖于textView的frame，如果用Masonry则需要刷新UI得出textView以后才可以用

     -(SZTextView *)textView{
         if (!_textView) {
             _textView = SZTextView.new;
             _textView.delegate = self;
             _textView.placeholder = @"在这里畅所欲言，留下您的宝贵意见吧！".jobsTr();

             _textView.placeholderTextColor = RGB_COLOR(132, 134, 140);
             _textView.font = [UIFont systemFontOfSize:12 weight:UIFontWeightMedium];
             _textView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                 make.centerX.equalTo(self.view);
                 make.top.equalTo(self.chooseFeedbackTypeBtn.mas_bottom).offset(JobsHeight(8));
                 make.size.mas_equalTo(CGSizeMake(JobsWidth(343), JobsHeight(150)));
             });

             [self.view layoutIfNeeded];
             _textView.indicateWordLimitLab.byAlpha(1);

         };return _textView;
     }

    与之相对应的协议方法：
     - (BOOL)textView:(UITextView *)textView
     shouldChangeTextInRange:(NSRange)range
      replacementText:(NSString *)text{

         JobsLog(@"textField.text = %@",textView.text);
         JobsLog(@"string = %@",text);


     #warning 过滤删除最科学的做法

         NSString *resString = nil;
         //textField.text 有值 && string无值 ————> 删除操作
         if (isValue(textView.text) && isNull(text)) {
             if (textView.text.length == 1) {
                 resString = @"".jobsTr();
             }else{
                 resString = [textView.text substringToIndex:(textView.text.length - 1)];//去掉最后一个
             }
         }
         //textField.text 无值 && string有值 ————> 首字符输入

         if (isNull(textView.text) && isValue(text)) {
             resString = text;
         }
         //textField.text 有值 && string有值 ————> 非首字符输入

         if (isValue(textView.text) && isValue(text)) {
             resString = [textView.text stringByAppendingString:text];
         }

         JobsLog(@"SSSresString = %@",resString);
         self.textView.currentWordNum = resString.length;//关键代码

         if (isNull(resString)) {
             [self.submitBtn setBackgroundImage:@"填写邀请码——不可提交".img) forState:UIControlStateNormal];
             self.submitBtn.userInteractionEnabled = NO;
         }else{
             [self.submitBtn setBackgroundImage:@"填写邀请码——可提交".img) forState:UIControlStateNormal];
             self.submitBtn.userInteractionEnabled = YES;
         };return YES;
     }
 */
#endif /* JOBS_HEADER_GUARD_UITEXTVIEW_INDICATEWORDLIMIT_22DE56C870 */
