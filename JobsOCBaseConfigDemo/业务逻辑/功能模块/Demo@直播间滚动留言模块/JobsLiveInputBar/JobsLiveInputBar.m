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
        self.backgroundColor = UIColor.systemBackgroundColor;
        self.layer.shadowColor = UIColor.blackColor.CGColor;
        self.layer.shadowOpacity = 0.08;
        self.layer.shadowOffset = CGSizeMake(0, -2);
        self.layer.shadowRadius = 8;
        self.textField.alpha = 1;
        self.sendButton.alpha = 1;
    };return self;
}

-(void)clearTextIfNeeded{
    if (self.autoClearAfterSend) self.textField.text = nil;
    if (self.autoResignAfterSend) [self.textField resignFirstResponder];
}
#pragma mark —— LazyLoad
-(UITextField *)textField{
    if (!_textField) {
        _textField = UITextField.new;
        _textField.borderStyle = UITextBorderStyleNone;
        _textField.returnKeyType = UIReturnKeySend;
        _textField.placeholder = @"说点什么...".tr;
        _textField.font = UIFontWeightRegularSize(15);
        _textField.textColor = UIColor.labelColor;
        _textField.backgroundColor = UIColor.secondarySystemBackgroundColor;
        _textField.layer.cornerRadius = JobsWidth(18);
        _textField.layer.masksToBounds = YES;
        UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, JobsWidth(12), JobsWidth(36))];
        _textField.leftView = leftView;
        _textField.leftViewMode = UITextFieldViewModeAlways;
        [self addSubview:_textField];
        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(JobsWidth(12));
            make.top.equalTo(self).offset(JobsWidth(10));
            make.bottom.equalTo(self).offset(-JobsWidth(10));
            make.height.mas_equalTo(JobsWidth(36));
        }];
    };return _textField;
}

-(UIButton *)sendButton{
    if (!_sendButton) {
        _sendButton = UIButton.new;
        _sendButton.backgroundColor = UIColor.systemBlueColor;
        _sendButton.layer.cornerRadius = JobsWidth(18);
        _sendButton.layer.masksToBounds = YES;
        [_sendButton setTitle:@"发送".tr
                     forState:UIControlStateNormal];
        [_sendButton setTitleColor:UIColor.whiteColor
                           forState:UIControlStateNormal];
        _sendButton.titleLabel.font = UIFontWeightMediumSize(15);
        [self addSubview:_sendButton];
        [_sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.textField.mas_right).offset(JobsWidth(8));
            make.right.equalTo(self).offset(-JobsWidth(12));
            make.centerY.equalTo(self.textField);
            make.size.mas_equalTo(CGSizeMake(JobsWidth(64), JobsWidth(36)));
        }];
    };return _sendButton;
}

@end
