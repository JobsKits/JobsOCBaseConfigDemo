//
//  JobsLiveInputBar.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月8日，星期三.
//

#import "JobsLiveInputBar.h"

@interface JobsLiveInputBar ()

Prop_strong(readwrite)UITextField *textField;
Prop_strong(readwrite)UIButton *sendButton;

@end

@implementation JobsLiveInputBar
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.autoClearAfterSend = YES;
        self.autoResignAfterSend = NO;
        self
            .byBgColor(UIColor.systemBackgroundColor)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byShadowColor(UIColor.blackColor.CGColor)
                    .byShadowOpacity(0.08)
                    .byShadowOffset(CGSizeMake(0, -2))
                    .byShadowRadius(8);
            });
        self.textField.byAlpha(1);
        self.sendButton.byAlpha(1);
    };return self;
}

-(void)clearTextIfNeeded{
    if (self.autoClearAfterSend) self.textField.byText(nil);
    if (self.autoResignAfterSend) [self.textField resignFirstResponder];
}
#pragma mark —— LazyLoad
-(UITextField *)textField{
    if (!_textField) {
        _textField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byBorderStyle(UITextBorderStyleNone)
                .byReturnKeyType(UIReturnKeySend)
                .byPlaceholder(@"说点什么...".tr)
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(UIColor.labelColor)
                .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, JobsWidth(12), JobsWidth(36)));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byBgColor(UIColor.secondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(18))
                        .byMasksToBounds(YES);
                })
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(JobsWidth(12));
                    make.top.equalTo(self).offset(JobsWidth(10));
                    make.bottom.equalTo(self).offset(-JobsWidth(10));
                    make.height.mas_equalTo(JobsWidth(36));
                });
        });
    };return _textField;
}

-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"发送".tr)
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
                .jobsResetBtnBgCor(UIColor.systemBlueColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(18))
                        .byMasksToBounds(YES);
                })
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.textField.mas_right).offset(JobsWidth(8));
                    make.right.equalTo(self).offset(-JobsWidth(12));
                    make.centerY.equalTo(self.textField);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(36)));
                });
        });
    };return _sendButton;
}

@end
