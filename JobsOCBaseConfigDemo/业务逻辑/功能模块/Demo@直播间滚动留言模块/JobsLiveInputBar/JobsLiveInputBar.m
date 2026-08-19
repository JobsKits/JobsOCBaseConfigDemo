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

-(jobsByVoidBlock _Nonnull)clearTextIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.autoClearAfterSend) self.textField.byText(nil);
        if (self.autoResignAfterSend) self.textField.resignFirstResponder;
    };
}
#pragma mark —— LazyLoad
-(UITextField *)textField{
    if (!_textField) {
        _textField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byBorderStyle(UITextBorderStyleNone)
                .byReturnKeyType(UIReturnKeySend)
                .byPlaceholder(@"说点什么...".jobsTr())
                .byPlaceholderColor(UIColor.placeholderTextColor)
                .byPlaceholderFont(UIFontWeightRegularSize(15))
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(UIColor.labelColor)
                .byAdjustsFontSizeToFitWidth(YES)
                .byMinimumFontSize(12)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, JobsWidth(14), JobsWidth(44)));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byTintColor(UIColor.systemBlueColor)
                .byBgColor(UIColor.secondarySystemBackgroundColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(22))
                        .byMasksToBounds(YES);
                })
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self).offset(JobsWidth(12));
                    make.centerY.equalTo(self);
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _textField;
}

-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            button
                .jobsResetBtnTitle(@"发送".jobsTr())
                .jobsResetBtnTitleCor(UIColor.whiteColor)
                .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
                .jobsResetBtnBgCor(UIColor.systemBlueColor)
                .jobsResetBtnCornerRadiusValue(JobsWidth(22))
                .byContentEdgeInsets(UIEdgeInsetsMake(0, JobsWidth(14), 0, JobsWidth(14)))
                .byLineBreakMode(NSLineBreakByClipping)
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.textField.mas_right).offset(JobsWidth(8));
                    make.right.equalTo(self).offset(-JobsWidth(12));
                    make.centerY.equalTo(self.textField);
                    make.width.mas_greaterThanOrEqualTo(JobsWidth(80));
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _sendButton;
}

@end
