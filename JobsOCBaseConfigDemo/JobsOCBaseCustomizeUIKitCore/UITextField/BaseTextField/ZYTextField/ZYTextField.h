//
//  ZYTextField.h
//  JobsBaseUI
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#ifndef JOBS_HEADER_GUARD_ZYTEXTFIELD_0700953F27
#define JOBS_HEADER_GUARD_ZYTEXTFIELD_0700953F27

#import <objc/runtime.h>
#import <UIKit/UIKit.h>
#import "JobsBaseProtocolHeader.h"
#import "JobsOCDSL.h"
#import "UIView+Extras.h"
#import "JobsModelDSL.h"
#import "JobsDeviceInfo.h"
#import "JobsRichTextUtils.h"
#import "JobsLoadingImageHeader.h"
#import "JobsMakes.h"
#import "JobsBlock.h"
#import "JobsDefines.h"

@interface ZYTextField : UITextField <UITextFieldProtocol>

Prop_assign()CGFloat ZYTextFieldCornerRadius;
Prop_assign()CGFloat ZYTextFieldBorderWidth;
Prop_assign(nullable)UIColor *ZYTextFieldBorderColor;
Prop_assign()BOOL ZYTextFieldMasksToBounds;

@end

NS_INLINE __kindof ZYTextField *_Nonnull jobsMakeZYTextField(jobsByZYTextFieldBlock _Nonnull block){
    ZYTextField *data = ZYTextField.alloc.init;
    if (block) block(data);
    return data;
}
/**

     过滤字符请结合RAC，是目前的最优解
     @jobs_weakify(self)
     [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
    //            @jobs_strongify(self)
         return YES;
     } subscribeNextBlock:^(NSString * _Nullable x) {
         @jobs_strongify(self)
         self.textField.byText(x);

         [self textFieldBlock:self.textField
               textFieldValue:x];
     }];
*/

/**

     rightView
     @synthesize textField = _textField;
     -(ZYTextField *)textField{
         if (!_textField) {
             _textField = ZYTextField.new;
             _textField.byDelegate(self);
             _textField.byTextCor(JobsLabelColor);
             _textField.byBgColor(JobsSecondarySystemBackgroundColor);
             _textField.byReturnKeyType(UIReturnKeyDefault);
             _textField.byKeyboardAppearance(UIKeyboardAppearanceDefault);
             _textField.byKeyboardType(UIKeyboardTypeDefault);
             _textField.rightView = self.titleLab;
             _textField.rightViewMode = UITextFieldViewModeAlways;
             _textField.byPlaceholder(@"打赏的Mata值".tr);
             _textField.placeholderColor = JobsPlaceholderTextColor;
             _textField.placeholderFont = UIFontWeightRegularSize(12);
             _textField.drawPlaceholderInRect = CGRectMake(0, 0, JobsWidth(255 - 20 - 40 - 5), JobsWidth(32));
             _textField.rightViewRectForBounds = CGRectMake(JobsWidth(255 - 20 - 40), JobsWidth(10), JobsWidth(40), JobsWidth(12));
             _textField.placeholderRectForBounds = CGRectMake(JobsWidth(10), JobsWidth(10), JobsWidth(255 - 20 - 40 - 5), JobsWidth(12));
             _textField.textRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);
             _textField.editingRectForBounds = CGRectMake(JobsWidth(10), 0, JobsWidth(255 - 20 - 40 - 10), 100);

             @jobs_weakify(self)
             [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
     //            @jobs_strongify(self)
                 return YES;
             } subscribeNextBlock:^(NSString * _Nullable x) {
                 @jobs_strongify(self)
                 self.textField.byText(x);

                 [self textFieldBlock:self.textField
                       textFieldValue:x];
             }];
             _textField.cornerCutToCircleWithCornerRadius(JobsWidth(8));
             _textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(CGSizeMake(JobsWidth(255), JobsWidth(32)));
                 make.centerX.equalTo(self);
                 make.top.equalTo(self.titleView.mas_bottom).offset(JobsWidth(10));
             });

         };return _textField;
     }
 */

/**
 
     只有 leftView，右边什么也没有
     @synthesize textField = _textField;
     -(ZYTextField *)textField{
         if (!_textField) {
             _textField = ZYTextField.new;
             _textField.byDelegate(self);
             _textField.byTextCor(JobsLabelColor);
             _textField.byBgColor(JobsSecondarySystemBackgroundColor);
             _textField.byReturnKeyType(UIReturnKeyDefault);
             _textField.byKeyboardAppearance(UIKeyboardAppearanceDefault);
             _textField.byKeyboardType(UIKeyboardTypeDefault);
             _textField.leftView = [UIImageView.alloc initWithImage:self.viewModel.image];
             _textField.leftViewMode = UITextFieldViewModeAlways;
             _textField.byPlaceholder(self.viewModel.textModel.text);
             _textField.byFont(UIFontWeightRegularSize(14));
             _textField.placeholderFont = _textField.font;
             _textField.placeholderColor = JobsPlaceholderTextColor;
             CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
             CGFloat placeholderY = (JobsWidth(28) - placeholderHeight) / 2;
             _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(52), placeholderY, MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32), JobsWidth(28));// OK
             _textField.editingRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32 + 12), JobsWidth(28));
             _textField.textRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), 100);
             @jobs_weakify(self)
             [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
     //            @jobs_strongify(self)
                 return YES;
             } subscribeNextBlock:^(NSString * _Nullable x) {
                 @jobs_strongify(self)
                 [self textFieldBlock:self->_textField
                       textFieldValue:x];
             }];
             _textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(CGSizeMake(MSInputStyle1View.viewSizeByModel(nil).width - JobsWidth(32 + 12), JobsWidth(28)));
                 make.centerY.equalTo(self);
                 make.left.equalTo(self).offset(JobsWidth(12));
             });
         };return _textField;
     }
    只有leftView，右边有个获取验证码
     -(ZYTextField *)textField{
         if (!_textField) {
             _textField = ZYTextField.new;
             _textField.byDelegate(self);
             _textField.byTextCor(JobsLabelColor);
             _textField.byBgColor(JobsSecondarySystemBackgroundColor);
             _textField.byReturnKeyType(UIReturnKeyDefault);
             _textField.byKeyboardAppearance(UIKeyboardAppearanceDefault);
             _textField.byKeyboardType(UIKeyboardTypeDefault);
             _textField.leftView = [UIImageView.alloc initWithImage:self.viewModel.image];
             _textField.leftViewMode = UITextFieldViewModeAlways;
             _textField.byPlaceholder(self.viewModel.textModel.text);
             _textField.byFont(UIFontWeightRegularSize(14));
             _textField.placeholderFont = _textField.font;
             _textField.placeholderColor = JobsPlaceholderTextColor;
             CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
             CGFloat placeholderY = (JobsWidth(28) - placeholderHeight) / 2;
             _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(52), placeholderY, MSInputStyle3ViewviewSizeByModel(nil).width - JobsWidth(32 + 100), JobsWidth(28));// OK
             _textField.editingRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), JobsWidth(28));
             _textField.textRectForBounds = CGRectMake(JobsWidth(52), 0, MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), 100);
             @jobs_weakify(self)
             [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
     //            @jobs_strongify(self)
                 return YES;
             } subscribeNextBlock:^(NSString * _Nullable x) {
                 @jobs_strongify(self)
                 [self textFieldBlock:self->_textField
                       textFieldValue:x];
             }];
             _textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(CGSizeMake(MSInputStyle3View.viewSizeByModel(nil).width - JobsWidth(32 + 12 + 100), JobsWidth(28)));
                 make.centerY.equalTo(self);
                 make.left.equalTo(self).offset(JobsWidth(12));
             });

         };return _textField;
     }
     /// 搜索框，leftView 和 rightView都存在
     _searchBtn.size = CGSizeMake(JobsWidth(60), JobsWidth(32));

     @synthesize textField = _textField;
     -(ZYTextField *)textField{
         if (!_textField) {
             _textField = ZYTextField.new;
             _textField.byDelegate(self);
             _textField.byBgColor(JobsSecondarySystemBackgroundColor);
             _textField.byReturnKeyType(UIReturnKeyDefault);
             _textField.byKeyboardAppearance(UIKeyboardAppearanceDefault);
             _textField.byKeyboardType(UIKeyboardTypeDefault);
             _textField.leftView = [UIImageView.alloc initWithImage:@"新首页的搜索放大镜".img];
             _textField.leftViewMode = UITextFieldViewModeAlways;
             _textField.rightView = self.searchBtn;
             _textField.rightViewMode = UITextFieldViewModeAlways;
             _textField.byPlaceholder(@"搜索关键词".tr);

             _textField.placeholderFont = UIFontWeightRegularSize(14);
             _textField.placeholderColor = JobsPlaceholderTextColor;
             _textField.size = CGSizeMake(JobsWidth(220 - 80 - 12), JobsWidth(28));

             CGFloat placeholderHeight = [self jobsGetLabelWidthWithTitle:_textField.placeholder font:_textField.placeholderFont].height;
             CGFloat placeholderY = (_textField.size.height - placeholderHeight) / 2;
             CGFloat rightViewY = (_textField.size.height - self.searchBtn.size.height) / 2;

             _textField.drawPlaceholderInRect = CGRectMake(JobsWidth(32),// leftView的宽
                                                           placeholderY,// 垂直居中
                                                           MSSearchView.viewSizeByModel(nil).width - JobsWidth(32 + 52),// 52是self.searchBtn的宽
                                                           JobsWidth(28));//
             _textField.editingRectForBounds = CGRectMake(JobsWidth(32),
                                                          0,
                                                          MSSearchView viewSizeByModel(nil).width - JobsWidth(32 + 22 + 5) - self.searchBtn.size.width,// 5 是右边与self.searchBtn的距离
                                                          JobsWidth(28));
             _textField.textRectForBounds = CGRectMake(JobsWidth(32),
                                                       0,
                                                       MSSearchView.viewSizeByModel(nil).width - JobsWidth(32 + 22 + 5),// 5 是右边与self.searchBtn的距离
                                                       100);// 100 这个值写死，不用管
             _textField.rightViewRectForBounds = CGRectMake(JobsWidth(MSSearchView.viewSizeByModel(nil).width - self.searchBtn.size.width),
                                                            rightViewY,
                                                            self.searchBtn.size.width,
                                                            self.searchBtn.size.height);
             @jobs_weakify(self)
             [_textField jobsTextFieldEventFilterBlock:^BOOL(id data) {
     //            @jobs_strongify(self)
                 return YES;
             } subscribeNextBlock:^(NSString * _Nullable x) {
                 @jobs_strongify(self)
                 [self textFieldBlock:self->_textField
                       textFieldValue:x];
             }];
             _textField.addOn(self).byAdd(^(MASConstraintMaker *make) {
                 make.size.mas_equalTo(_textField.size);
                 make.right.equalTo(self).offset(JobsWidth(-12));
                 make.centerY.equalTo(self);
                 make.left.equalTo(self).offset(JobsWidth(12));
             });

         };return _textField;
     }
 */
#endif /* JOBS_HEADER_GUARD_ZYTEXTFIELD_0700953F27 */
