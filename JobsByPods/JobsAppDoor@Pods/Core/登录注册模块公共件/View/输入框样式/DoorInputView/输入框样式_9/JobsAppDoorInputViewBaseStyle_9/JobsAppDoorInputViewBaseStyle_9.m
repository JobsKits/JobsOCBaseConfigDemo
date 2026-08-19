//
//  JobsAppDoorInputViewBaseStyle_9.m
//  JobsAppDoor
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsAppDoorInputViewBaseStyle_9.h"

#import <JobsAppDoor/JobsAppDoorInputViewHeader.h>

@interface JobsAppDoorInputViewBaseStyle_9 ()
/// UI
Prop_strong()UIButton <TimerProtocol>*countDownBtn;
/// Data
Prop_copy()NSString *titleStr_1;
Prop_copy()NSString *titleStr_2;
Prop_strong()JobsAppDoorInputViewBaseStyleModel *doorInputViewBaseStyleModel;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_9
@interface JobsAppDoorInputViewBaseStyle_9 (JobsPropertyDSLSetterAutogen_4f02afd519)
-(void)setDoorInputViewBaseStyleModel:(JobsAppDoorInputViewBaseStyleModel * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_9

@implementation JobsAppDoorInputViewBaseStyle_9
@synthesize thisViewSize = _thisViewSize;
#pragma mark —— BaseViewProtocol
- (instancetype)initWithSize:(CGSize)thisViewSize{
    if (self = [super init]) {
//        self.backgroundColor = JobsRedColor;
        self.byThisViewSize(thisViewSize);
        self.titleStr_1 = @"点击".jobsTr();
        self.titleStr_2 = @"发送验证码".jobsTr();
        self.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
            data.byLayerCor(JobsWhiteColor)
                .byCornerRadiusValue(1);
        }));
    };return self;
}

-(void)layoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_9.class, @selector(jobsLayoutSubviews)))(self, @selector(jobsLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super layoutSubviews];
        /// 因为是子控件，所以要防止约束使用中间过程值，避免代码冗余，这里固定写死
        self.countDownBtn.byWidth(self.countDownBtnWidth ? : JobsWidth(80));
        self.zyTextField.byWidth(self.textFieldWidth ? : JobsWidth(220));
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)configTextField{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.zyTextField.byLeftView(UIImageView.initBy(self.doorInputViewBaseStyleModel.leftViewIMG));
        self.zyTextField.byLeftViewMode(self.doorInputViewBaseStyleModel.leftViewMode);
        self.zyTextField.byPlaceholder(self.doorInputViewBaseStyleModel.placeholder);
        self.zyTextField.byKeyboardType(self.doorInputViewBaseStyleModel.keyboardType);
        self.zyTextField.byReturnKeyType(self.doorInputViewBaseStyleModel.returnKeyType);
        self.zyTextField.byKeyboardAppearance(self.doorInputViewBaseStyleModel.keyboardAppearance);
        self.zyTextField.byTextCor(self.doorInputViewBaseStyleModel.titleStrCor);
        self.zyTextField.byUseCustomClearButton(self.doorInputViewBaseStyleModel.useCustomClearButton);
        self.zyTextField.byIsShowDelBtn(self.doorInputViewBaseStyleModel.isShowDelBtn);
        self.zyTextField.byRightViewOffsetX(self.doorInputViewBaseStyleModel.rightViewOffsetX ? : JobsWidth(8));
        self.zyTextField.byRequestParams(self.textFieldInputModel);
        self.zyTextField.byPlaceholderColor(self.doorInputViewBaseStyleModel.placeholderColor);
        self.zyTextField.byPlaceholderFont(self.doorInputViewBaseStyleModel.placeholderFont);
        self.zyTextField.byLeftViewOffsetX(self.doorInputViewBaseStyleModel.leftViewOffsetX ? : JobsWidth(17));
        self.zyTextField.byPlaceHolderAlignment(self.doorInputViewBaseStyleModel.placeHolderAlignment ? : NSTextAlignmentLeft);
        self.zyTextField.byPlaceHolderOffset(self.doorInputViewBaseStyleModel.placeHolderOffset ? : JobsWidth(39));
        self.zyTextField.byFieldEditorOffset(self.doorInputViewBaseStyleModel.fieldEditorOffset ? : JobsWidth(50));
    };
}

-(void)block:(ZYTextField *)textField value:(NSString *)value{
    self.textFieldInputModel.byResString(value);
    self.textFieldInputModel.byPlaceHolder(self.doorInputViewBaseStyleModel.placeholder);
    textField.byRequestParams(self.textFieldInputModel);
    if (self.objBlock) self.objBlock(textField);// 对外统一传出TF
}
/// 倒计时按钮（需要销毁定时器）
-(JobsRetBtnByVoidBlock _Nonnull)getCountDownBtn{
    @jobs_weakify(self)
    return ^UIButton *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.countDownBtn;
    };
}
#pragma mark —— UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_9.class, @selector(jobsTextFieldShouldBeginEditing)))(self, @selector(jobsTextFieldShouldBeginEditing));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldBeginEditing{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        return self.doorInputViewBaseStyleModel.keyboardEnable;
    };
}
#pragma mark —— BaseViewProtocol
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return inputSize();
    };
}

-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(JobsAppDoorInputViewBaseStyleModel *_Nullable doorInputViewBaseStyleModel) {
        @jobs_strongify(self)
        self.byDoorInputViewBaseStyleModel(doorInputViewBaseStyleModel);
        self.countDownBtn.byAlpha(1);
        self.zyTextField.byAlpha(1);
        self.configTextField();
    };
}
#pragma mark —— JobsDoorInputViewProtocol
-(ZYTextField *_Nullable)getTextField{
    JobsRetZYTextFieldByVoidBlock action = ((JobsRetZYTextFieldByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_9.class, @selector(jobsGetTextField)))(self, @selector(jobsGetTextField));
    return action ? action() : nil;
}

-(JobsRetZYTextFieldByVoidBlock _Nonnull)jobsGetTextField{
    @jobs_weakify(self)
    return ^ZYTextField *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField;
    };
}

-(NSString *_Nullable)textFieldValue{
    JobsRetStrByVoidBlock action = ((JobsRetStrByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsAppDoorInputViewBaseStyle_9.class, @selector(jobsTextFieldValue)))(self, @selector(jobsTextFieldValue));
    return action ? action() : nil;
}

-(JobsRetStrByVoidBlock _Nonnull)jobsTextFieldValue{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return self.zyTextField.text;
    };
}
#pragma mark —— lazyLoad
-(UIButton<TimerProtocol> *)countDownBtn{
    if (!_countDownBtn) {
        @jobs_weakify(self)
        _countDownBtn = (UIButton<TimerProtocol> *)UIButton.jobsInit()
            .onClickBy(^(__kindof UIButton *x){
                @jobs_strongify(self)
                if (self.objBlock) self.objBlock(x);
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            }).byOnTick(^(CGFloat time) {
                // 每 tick 一次
                NSLog(@"剩余: %.0f", time);
            })
            .byOnFinish(^ (JobsTimer * _Nullable timer) {
                // 倒计时完成
                NSLog(@"倒计时结束");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                make.right.equalTo(self).offset(-JobsWidth(120));
                make.top.equalTo(self).offset(JobsWidth(8));
                make.bottom.equalTo(self).offset(-JobsWidth(8));
                make.width.mas_equalTo(self.countDownBtnWidth);
            });
    };return _countDownBtn;
}
@synthesize zyTextField = _zyTextField;
-(ZYTextField *)zyTextField{
    if (!_zyTextField) {
        _zyTextField = ZYTextField.new;
        _zyTextField.byDelegate(self);
        @jobs_weakify(self)
        [_zyTextField jobsTextFieldEventFilterBlock:^BOOL(id _Nullable data) {
            @jobs_strongify(self)
            return self.retBoolByIDBlock ? self.retBoolByIDBlock(data) : YES;
        } subscribeNextBlock:^(id _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"MMM = %@",x);
            [self block:self->_zyTextField value:x];
        }];
        _zyTextField.addOn(self).byAdd(^(MASConstraintMaker *make) {
            make.top.left.bottom.equalTo(self);
//            make.right.equalTo(self.countDownBtn.mas_left);
        });
    };return _zyTextField;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsAppDoorInputViewBaseStyle_9
-(JobsRetJobsAppDoorInputViewBaseStyle_9ByJobsAppDoorInputViewBaseStyleModelBlock _Nonnull)byDoorInputViewBaseStyleModel{
    @jobs_weakify(self)
    return ^__kindof JobsAppDoorInputViewBaseStyle_9 * _Nullable(JobsAppDoorInputViewBaseStyleModel * _Nullable data){
        @jobs_strongify(self)
        [self setDoorInputViewBaseStyleModel:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsAppDoorInputViewBaseStyle_9
@end
