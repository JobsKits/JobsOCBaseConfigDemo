//
//  JobsScreenshotProtectionView.m
//  JobsScreenCapture
//
//  Created by Jobs on 2026年7月21日，星期二.
//

#import "JobsScreenshotProtectionView.h"

@interface JobsScreenshotProtectionView ()

Prop_strong()UITextField *secureTextField;
Prop_strong(readwrite)UIView *contentView;
Prop_assign(readwrite,getter=isProtectionAvailable)BOOL protectionAvailable;

-(void)configureSecureContainer;
-(nullable UIView *)secureCanvasView;

@end

@implementation JobsScreenshotProtectionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self configureSecureContainer];
    };return self;
}

-(instancetype)initWithCoder:(NSCoder *)coder{
    if (self = [super initWithCoder:coder]) {
        [self configureSecureContainer];
    };return self;
}

-(BOOL)isProtectionEnabled{
    return self.secureTextField.isSecureTextEntry && self.isProtectionAvailable;
}

-(void)setProtectionEnabled:(BOOL)protectionEnabled{
    self.secureTextField.bySecureTextEntry(protectionEnabled && self.isProtectionAvailable);
}

-(void)configureSecureContainer{
    self.byBgColor(JobsClearColor)
        .byClipsToBounds(YES);
    self.secureTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
        textField
            .byText(@" ")
            .byTextCor(JobsClearColor)
            .byBorderStyle(UITextBorderStyleNone)
            .bySecureTextEntry(YES)
            .byTintColor(JobsClearColor)
            .byBgColor(JobsClearColor)
            .byUserInteractionEnabled(YES);
    });
    [self addSubview:self.secureTextField];
    [self.secureTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
    [self.secureTextField layoutIfNeeded];

    UIView *secureCanvasView = [self secureCanvasView];
    self.contentView = jobsMakeView(^(__unused __kindof UIView * _Nullable view) {});
    if (secureCanvasView) {
        secureCanvasView.byBgColor(JobsClearColor)
            .byUserInteractionEnabled(YES);
        [secureCanvasView addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(secureCanvasView);
        }];
        self.protectionAvailable = YES;
    }else{
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        self.secureTextField.bySecureTextEntry(NO);
        self.protectionAvailable = NO;
    }
}

-(UIView *)secureCanvasView{
    for (UIView *subview in self.secureTextField.subviews) {
        if ([NSStringFromClass(subview.class) containsString:@"CanvasView"]) return subview;
    };return self.secureTextField.subviews.firstObject;
}

@end
