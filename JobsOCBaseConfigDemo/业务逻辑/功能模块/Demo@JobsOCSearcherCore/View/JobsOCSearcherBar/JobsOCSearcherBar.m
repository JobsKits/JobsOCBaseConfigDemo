//
//  JobsOCSearcherBar.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月6日，星期一.
//

#import "JobsOCSearcherBar.h"

@interface JobsOCSearcherBar ()

Prop_strong()BaseButton *cancelBtn;

-(JobsRetImageByCorBlock _Nonnull)searchIconImageWithColor;
-(JobsRetViewByVoidBlock _Nonnull)searchIconLeftView;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JobsOCSearcherBar
@interface JobsOCSearcherBar (JobsPropertyDSLSetterAutogen_2f6d171a12)
-(void)setCancelBtnHidden:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JobsOCSearcherBar

@implementation JobsOCSearcherBar
- (instancetype)init{
    if (self = [super init]) {
        self.byBgColor(JobsClearColor.colorWithAlphaComponentBy(0));
    };return self;
}

-(void)drawRect:(CGRect)rect{
    jobsByFrameBlock action = ((jobsByFrameBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherBar.class, @selector(jobsDrawRect)))(self, @selector(jobsDrawRect));
    if (action) action(rect);
}

-(jobsByFrameBlock _Nonnull)jobsDrawRect{
    @jobs_weakify(self)
    return ^(CGRect rect){
        @jobs_strongify(self)
        if (!self) return;
        [super drawRect:rect];
    };
}
#pragma mark —— BaseViewProtocol
-(jobsByIDBlock _Nonnull)jobsRichViewByModel{
    @jobs_weakify(self)
    return ^(UIViewModel *_Nullable model) {
        @jobs_strongify(self)
        self.textField.byAlpha(1);
        self.updateCancelBtnVisible(NO);
    };
}
/// 具体由子类进行复写【数据尺寸】【如果所传参数为基本数据类型，那么包装成对象NSNumber进行转化承接】
+(JobsRetCGSizeByIDBlock _Nonnull)viewSizeByModel{
    return ^CGSize(id _Nullable data){
        return CGSizeMake(JobsMainScreen_WIDTH(), JobsWidth(60));
    };
}
#pragma mark —— 一些私有化方法
-(jobsByStrBlock _Nonnull)notifySearchTextBy{
    @jobs_weakify(self)
    return ^(NSString * text){
        @jobs_strongify(self)
        if (!self) return;
        if (self.objBlock) self.objBlock(text ? : @"");
    };
}

-(jobsByBOOLBlock _Nonnull)updateCancelBtnVisible{
    @jobs_weakify(self)
    return ^(BOOL visible){
        @jobs_strongify(self)
        if (!self) return;
        visible = visible && !self.cancelBtnHidden;
        self.cancelBtn.byAlpha(visible ? 1 : 0);
        self.cancelBtn.byUserInteractionEnabled(visible);
        [self.cancelBtn mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(visible ? JobsWidth(42) : 0);
        }];
        [self.textField mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.cancelBtn.mas_left).offset(visible ? -JobsWidth(8) : 0);
        }];
        self.bySetNeedsLayout().byLayoutIfNeeded();
    };
}

-(JobsRetViewByVoidBlock _Nonnull)searchIconLeftView{
    @jobs_weakify(self)
    return ^UIView *{
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(self.searchIconImageWithColor(HEXCOLOR(0x8B6A2F)))
                .byContentMode(UIViewContentModeCenter)
                .byFrame(CGRectMake(0, 0, JobsWidth(24), JobsWidth(24)));
        });
    };
}

-(JobsRetImageByCorBlock _Nonnull)searchIconImageWithColor{
    @jobs_weakify(self)
    return ^UIImage *(UIColor * color){
        @jobs_strongify(self)
        if (!self) return nil;
        CGSize size = CGSizeMake(16, 16);
        UIGraphicsBeginImageContextWithOptions(size, NO, 0);
        [color setStroke];
        UIBezierPath *circlePath = UIBezierPath.byBezierPathWithOvalInRect(CGRectMake(2.2, 2.2, 8.8, 8.8));
        circlePath
            .byLineWidth(1.6)
            .byStroke();
        UIBezierPath *handlePath = jobsMakeBezierPath(nil);
        handlePath
            .byLineWidth(1.8)
            .byLineCapStyle(kCGLineCapRound)
            .byMoveToPoint(CGPointMake(9.4, 9.4))
            .byAddLineToPoint(CGPointMake(13.4, 13.4))
            .byStroke();
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image;
    };
}
#pragma mark —— UITextFieldDelegate
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherBar.class, @selector(textFieldDidBeginEditing)))(self, @selector(textFieldDidBeginEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidBeginEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        self.updateCancelBtnVisible(YES);
        self.notifySearchTextBy(textField.text);
    };
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    ((((jobsByTextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherBar.class, @selector(textFieldDidEndEditing)))(self, @selector(textFieldDidEndEditing))))(textField);
}
-(jobsByTextFieldBlock _Nonnull)textFieldDidEndEditing{
    @jobs_weakify(self)
    return ^(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return;
        self.updateCancelBtnVisible(isValue(textField.text));
    };
}

-(BOOL)textFieldShouldClear:(UITextField *)textField{
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherBar.class, @selector(jobsTextFieldShouldClear)))(self, @selector(jobsTextFieldShouldClear));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldClear{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        self.updateCancelBtnVisible(NO);
        self.notifySearchTextBy(@"");
        return YES;
    };
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    JobsRetBOOLByUITextFieldBlock action = ((JobsRetBOOLByUITextFieldBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsOCSearcherBar.class, @selector(jobsTextFieldShouldReturn)))(self, @selector(jobsTextFieldShouldReturn));
    return action ? action(textField) : NO;
}

-(JobsRetBOOLByUITextFieldBlock _Nonnull)jobsTextFieldShouldReturn{
    @jobs_weakify(self)
    return ^BOOL(UITextField * textField){
        @jobs_strongify(self)
        if (!self) return NO;
        self.notifySearchTextBy(textField.text);
        if (self.stringBlock) self.stringBlock(textField.text ? : @"");
        textField.resignFirstResponder;
        return YES;
    };
}
#pragma mark —— lazyLoad
-(BaseButton *)cancelBtn{
    if (!_cancelBtn) {
        @jobs_weakify(self)
        _cancelBtn = BaseButton.jobsInit()
            .jobsResetBtnTitleCor(HEXCOLOR(0xAE8330))
            .jobsResetBtnTitleFont(UIFontWeightRegularSize(JobsWidth(13)))
            .jobsResetBtnTitle(@"取消".jobsTr())
            .jobsResetBtnBgCor(JobsClearColor)
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                self.textField.byText(@"");
                self.updateCancelBtnVisible(NO);
                self.notifySearchTextBy(@"");
                self.textField.resignFirstResponder;
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
        _cancelBtn
            .byAlpha(0)
            .byUserInteractionEnabled(NO);
    };return _cancelBtn;
}

@synthesize textField = _textField;
-(ZYTextField *)textField{
    if (!_textField) {
        @jobs_weakify(self)
        _textField = jobsMakeZYTextField(^(ZYTextField *_Nullable textField) {
            textField
                .byPlaceholder(@"请输入搜索内容".jobsTr())
                .byDelegate(self)
                .byLeftView(self.searchIconLeftView())
                .byTextCor(JobsLabelColor)
                .byInputAccessoryView(jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
                    label
                        .byText(@"Jobs安全聊天，为您的聊天加密护航".jobsTr())
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
                .byRightViewOffsetX(JobsWidth(6))
            .addOn(self)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.centerY.equalTo(self);
                    make.left.equalTo(self);
                    make.right.equalTo(self.cancelBtn.mas_left);
                    make.height.mas_equalTo(MIN(JobsWidth(40), MAX(JobsWidth(32), self.mj_h - JobsWidth(10))));
                })
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable model) {
                model.byJobsWidth(.5f)
                     .byLayerCor(HEXCOLOR(0xEEE2C8))
                     .byCornerRadiusValue(JobsWidth(16));
            }));
        });
        /// 不能写在 jobsMakeZYTextField 里面，否则会崩溃
        [[_textField.rac_textSignal filter:^BOOL(NSString *_Nullable value) {
            @jobs_strongify(self)
            self.updateCancelBtnVisible(isValue(value) || self.textField.isFirstResponder);
            return isValue(value);
        }] subscribeNext:^(NSString * _Nullable x) {
            @jobs_strongify(self)
            JobsLog(@"输入的字符为 = %@",x);
            self.notifySearchTextBy(x);
        }];
    };return _textField;
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JobsOCSearcherBar
-(JobsRetJobsOCSearcherBarByBOOLBlock _Nonnull)byCancelBtnHidden{
    @jobs_weakify(self)
    return ^__kindof JobsOCSearcherBar * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setCancelBtnHidden:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JobsOCSearcherBar
@end
