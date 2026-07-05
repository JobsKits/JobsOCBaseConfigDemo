//
//  JobsSearchBar.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsSearchBar.h"

@interface JobsSearchBar ()
/// UI
Prop_strong()BaseButton *cancelBtn;

@end

@implementation JobsSearchBar

- (instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));

    };return self;
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.textField.byAlpha(1);
        [self updateCancelBtnVisible:NO];
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
    };
}
#pragma mark —— 一些私有化方法
-(void)notifySearchTextBy:(NSString *)text{
    if (self.objBlock) self.objBlock(text ? : @"");
}

-(void)updateCancelBtnVisible:(BOOL)visible{
    visible = visible && !self.cancelBtnHidden;
    self.cancelBtn.byAlpha(visible ? 1 : 0);
    self.cancelBtn.userInteractionEnabled = visible;
    [self.cancelBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(visible ? JobsWidth(42) : 0);
    }];
    [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.cancelBtn.mas_left).offset(visible ? -JobsWidth(8) : 0);
    }];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}
#pragma mark —— UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    [self updateCancelBtnVisible:YES];
    [self notifySearchTextBy:textField.text];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    [self updateCancelBtnVisible:isValue(textField.text)];
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    [self updateCancelBtnVisible:NO];
    [self notifySearchTextBy:@""];
    return YES;
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self notifySearchTextBy:textField.text];
    if (self.stringBlock) self.stringBlock(textField.text ? : @"");
    [textField resignFirstResponder];
    return YES;
}
#pragma mark —— lazyLoad
-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton.jobsInit()
            .bgColorBy(JobsClearColor)
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
            .jobsResetBtnTitle(@"取消".tr)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.textField.byText(@"");
                [self updateCancelBtnVisible:NO];
                [self notifySearchTextBy:@""];
                [self.textField resignFirstResponder];
            }).onLongPressGestureBy(^(id data){
                JobsLog(@"");
            })
            .addOn(self)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.width.mas_equalTo(0);
                make.height.mas_equalTo(JobsWidth(32));
                make.centerY.equalTo(self);
                make.right.equalTo(self);
            });
        _cancelBtn.byAlpha(0);
        _cancelBtn.userInteractionEnabled = NO;
    };return _cancelBtn;
}
@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = jobsMakeZYTextField(^(ZYTextField *_Nullable textField) {
            textField
                .byPlaceholder(@"请输入搜索内容".tr)
                .byDelegate(self)
                .byLeftView(jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
                    imageView.byImage(@"放大镜".img);
                }))
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byInputAccessoryView(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                    label
                        .byText(@"Jobs安全聊天，为您的聊天加密护航".tr)
                        .byTextCor(HEXCOLOR(0x8B6A2F))
                        .byTextAlignment(NSTextAlignmentCenter)
                        .byFont(UIFontWeightRegularSize(JobsWidth(12)))
                        .byBgColor(HEXCOLOR(0xFFF7EA))
                        .bySize(CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(34)));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byKeyboardAppearance(UIKeyboardAppearanceAlert)
                .byReturnKeyType(UIReturnKeySearch)
                .byPlaceHolderAlignment(NSTextAlignmentLeft)
                .byLeftViewOffsetX(JobsWidth(8))
                .byRightViewOffsetX(JobsWidth(6));
            textField.addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerY.equalTo(self);
                    make.left.equalTo(self);
                    make.right.equalTo(self.cancelBtn.mas_left);
                    make.height.mas_equalTo(MIN(JobsWidth(40), MAX(JobsWidth(32), self.mj_h - JobsWidth(10))));
                });
            textField.byBgColor(HEXCOLOR(0xFFFFFF));
            textField.setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                model.byJobsWidth(.5f)
                     .byLayerCor(HEXCOLOR(0xEEE2C8))
                     .byCornerRadiusValue(JobsWidth(16));
            }));
        });
        /// 不能写在 jobsMakeZYTextField 里面，否则会崩溃
        [[_textField.rac_textSignal filter:^BOOL(NSString *_Nullable value) {
            @jobs_strongify(self)
            [self updateCancelBtnVisible:isValue(value) || self.textField.isFirstResponder];
            return isValue(value);
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"输入的字符为 = %@",x);
            [self notifySearchTextBy:x];
        }];
    };return _textField;
}

@end
