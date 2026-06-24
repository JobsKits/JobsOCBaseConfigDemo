//
//  JobsIMInputview.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsIMInputview.h"

@interface JobsIMInputview ()
/// UI
Prop_strong()UIImageView *imgView;
Prop_strong()JobsAdNoticeView *adNoticeView;
Prop_strong()BaseButton *sendBtn;
/// Data

@end

@implementation JobsIMInputview

-(instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsWhiteColor);

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据定UI】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(id _Nullable model) {
        @jobs_strongify(self)
        self.sendBtn.byAlpha(1);

        self.inputTextField.byAlpha(1);

    };
}
/// 一些变化的UI
-(jobsByStrBlock _Nonnull)someChangeUIBy{
    @jobs_weakify(self)
    return ^(NSString *_Nullable string){
        @jobs_strongify(self)
        if (isValue(string)) {
            self.sendBtn.userInteractionEnabled = YES;
            self.sendBtn.enabled = YES;
            self.imgView.image = @"输入框有值".img;
        }else{
            self.sendBtn.userInteractionEnabled = NO;
            self.sendBtn.enabled = NO;
            self.imgView.image = @"输入框无值".img;
        }
    };
}
#pragma mark —— UITextFieldDelegate
/// 告诉委托人对指定的文本字段停止编辑
- (void)textFieldDidEndEditing:(ZYTextField *)textField{
    [textField isEmptyText];
}
/// 询问委托人文本字段是否应处理按下返回按钮
- (BOOL)textFieldShouldReturn:(ZYTextField *)textField{
    [self endEditing:YES];
    if (self.objBlock) self.objBlock(textField);
    return YES;
}
#pragma mark —— lazyLoad
-(BaseButton *)sendBtn{
    if (!_sendBtn) {
        @jobs_weakify(self)
        _sendBtn = BaseButton.jobsInit()
            .bgColorBy(JobsWhiteColor)
            .jobsResetBtnBgImage(JobsCyanColor.image)
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(UIFontWeightBoldSize(JobsWidth(12)))
            .jobsResetBtnTitle(@"发送".tr)
            .jobsResetBtnCornerRadiusValue(JobsWidth(3))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                x.selected = !x.selected;
                x.jobsResetBtnBgImage(JobsLightGrayColor.image);
                if (self.objBlock) self.objBlock(x);
                [self endEditing:YES];
                if (isValue(self.inputTextField.text)) {
                    self.playSoundEffect(@"Sound.wav");
                    if (self.objBlock) self.objBlock(self.inputTextField);
                }
                self.inputTextField.byText(@"".tr);

                x.enabled = NO;
            })
            .onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .disabledStateTitleColorBy(JobsWhiteColor)
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self).offset(11);
                make.bottom.equalTo(self).offset(-11);
                make.right.equalTo(self).offset(-10);
                make.width.mas_equalTo(50);
            });
        _sendBtn.userInteractionEnabled = NO;
        _sendBtn.enabled = NO;
    };return _sendBtn;
}

-(ZYTextField *)inputTextField{
    if (!_inputTextField) {
        @jobs_weakify(self)
        _inputTextField = jobsMakeZYTextField(^(ZYTextField *_Nullable textField) {
            @jobs_strongify(self)
            textField
                .byPlaceHolderAlignment(NSTextAlignmentCenter)
                .byPlaceholder(@"在此输入需要发送的信息".tr)
                .byDelegate(self)
                .byLeftView(self.imgView)
                .byLeftViewOffsetX(20)
                .byFont(UIFontWeightMediumSize(12))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                .byAutocorrectionType(UITextAutocorrectionTypeNo) // 自动纠错属性默认是 YES，会触发监听
                .byInputAccessoryView(self.adNoticeView)
                .byReturnKeyType(UIReturnKeySend)
                .byBgColor(HEXCOLOR(0xF4F4F4))
                .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.bottom.equalTo(self.sendBtn);
                    make.right.equalTo(self.sendBtn.mas_left).offset(-10);
                    make.left.equalTo(self).offset(10);
                });

            self.refresh();

            textField.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel *_Nullable model) {
                model
                    .byJobsWidth(.5f)
                    .byLayerCor(JobsWhiteColor)
                    .byCornerRadiusValue(textField.mj_h / 2);
            }));
        });

        [[_inputTextField.rac_textSignal filter:^BOOL(NSString *_Nullable value) {
            return YES;
        }] subscribeNext:^(NSString *_Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"输入的字符为 = %@",x);
            self.someChangeUIBy(x);
        }];
    };return _inputTextField;
}

-(UIImageView *)imgView{
    if (!_imgView) {
        _imgView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView.byImage(@"输入框无值".img);
        });
    };return _imgView;
}

-(JobsAdNoticeView *)adNoticeView{
    if (!_adNoticeView) {
        _adNoticeView = JobsAdNoticeView.new;
        _adNoticeView.sizer = JobsAdNoticeView.viewSizeByModel(nil);
        _adNoticeView.jobsRichViewByModel(nil);
    };return _adNoticeView;
}

@end
