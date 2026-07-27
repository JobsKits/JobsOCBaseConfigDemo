//
//  JobsCNIDDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsCNIDDemoVC.h"

@interface JobsCNIDDemoVC ()

Prop_strong()UIView *contentView;
Prop_strong()UITextField *inputTF;
Prop_strong()UIButton *exampleBtn;
Prop_strong()UIButton *validateBtn;
Prop_strong()UILabel *resultLab;

@end

@implementation JobsCNIDDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data
                .byTextCor(HEXCOLOR(0x263342))
                .byText(@"身份证校验 Demo".tr)
                .byFont(UIFontWeightRegularSize(18));
        })
        .byBgCor(HEXCOLOR(0xF5F7FA))
        .byNavBgCor(HEXCOLOR(0xF5F7FA));
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(HEXCOLOR(0xF5F7FA));
    self.contentView.byHidden(NO);
}

#pragma mark —— Actions
-(void)fillExample{
    self.inputTF.byText(@"510105199307315321");
    [self updateResult:@"已填入示例号码" success:YES];
}

-(void)validateIDCard{
    NSError *error = nil;
    NSString *normalized = [NSObject jobs_validateCNID:self.inputTF.text error:&error];
    if (normalized.length) {
        [self updateResult:[NSString stringWithFormat:@"校验成功\n标准化结果：%@",normalized] success:YES];
    } else {
        [self updateResult:error.localizedDescription ?: @"校验失败" success:NO];
    }
}

-(void)updateResult:(NSString *)text
            success:(BOOL)success{
    self.resultLab
        .byText(text.tr)
        .byTextCor(success ? HEXCOLOR(0x159947) : HEXCOLOR(0xD14343))
        .byBgColor(success ? HEXCOLOR(0xEAF8EF) : HEXCOLOR(0xFFF0F0));
}

-(UIButton *)buttonByTitle:(NSString *)title
                    action:(jobsByBtnBlock)action
           backgroundColor:(UIColor *)backgroundColor{
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(title.tr)
            .jobsResetBtnTitleFont(UIFontWeightMediumSize(15))
            .jobsResetBtnTitleCor(UIColor.whiteColor)
            .jobsResetBtnBgCor(backgroundColor)
            .onClickBy(action)
            .byLayer(^(__kindof CALayer * _Nullable layer) {
                layer
                    .byCornerRadius(JobsWidth(8))
                    .byMasksToBounds(YES);
            });
    });
}

#pragma mark —— LazyLoad
-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(UIColor.whiteColor)
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(10))
                        .byMasksToBounds(YES);
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.equalTo(self.view).inset(JobsWidth(20));
                    make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(JobsWidth(64));
                });
        });
        self.inputTF.byHidden(NO);
        self.exampleBtn.byHidden(NO);
        self.validateBtn.byHidden(NO);
        self.resultLab.byHidden(NO);
        [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.bottom.equalTo(self.resultLab.mas_bottom).offset(JobsWidth(24));
        }];
    };return _contentView;
}

-(UITextField *)inputTF{
    if (!_inputTF) {
        @jobs_weakify(self)
        _inputTF = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField
                .byPlaceholder(@"请输入身份证号码".tr)
                .byTextCor(HEXCOLOR(0x263342))
                .byFont(UIFontWeightRegularSize(16))
                .byBorderStyle(UITextBorderStyleNone)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byAutocorrectionType(UITextAutocorrectionTypeNo)
                .byAutocapitalizationType(UITextAutocapitalizationTypeAllCharacters)
                .byLeftView(jobsMakeView(^(__kindof UIView * _Nullable view) {
                    view.byFrame(CGRectMake(0, 0, JobsWidth(14), 1));
                }))
                .byLeftViewMode(UITextFieldViewModeAlways)
                .byTintColor(HEXCOLOR(0x1D7FF2))
                .byBgColor(HEXCOLOR(0xF0F3F7))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer.byCornerRadius(JobsWidth(8));
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.contentView).offset(JobsWidth(24));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_equalTo(JobsWidth(46));
                });
        });
    };return _inputTF;
}

-(UIButton *)exampleBtn{
    if (!_exampleBtn) {
        @jobs_weakify(self)
        _exampleBtn = [self buttonByTitle:@"填入示例"
                                    action:^(__kindof UIButton * _Nullable button) {
            [weak_self fillExample];
        }
                           backgroundColor:HEXCOLOR(0x263342)];
        _exampleBtn.addOn(self.contentView);
        [_exampleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.equalTo(self.inputTF.mas_bottom).offset(JobsWidth(18));
            make.left.equalTo(self.contentView).offset(JobsWidth(22));
            make.height.mas_equalTo(JobsWidth(42));
        }];
    };return _exampleBtn;
}

-(UIButton *)validateBtn{
    if (!_validateBtn) {
        @jobs_weakify(self)
        _validateBtn = [self buttonByTitle:@"校验"
                                     action:^(__kindof UIButton * _Nullable button) {
            [weak_self validateIDCard];
        }
                            backgroundColor:HEXCOLOR(0x1D7FF2)];
        _validateBtn.addOn(self.contentView);
        [_validateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            @jobs_strongify(self)
            make.top.width.height.equalTo(self.exampleBtn);
            make.left.equalTo(self.exampleBtn.mas_right).offset(JobsWidth(12));
            make.right.equalTo(self.contentView).offset(-JobsWidth(22));
            make.width.equalTo(self.exampleBtn);
        }];
    };return _validateBtn;
}

-(UILabel *)resultLab{
    if (!_resultLab) {
        @jobs_weakify(self)
        _resultLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"等待输入校验".tr)
                .byTextCor(HEXCOLOR(0x6B7280))
                .byFont(UIFontWeightRegularSize(15))
                .byNumberOfLines(0)
                .byTextAlignment(NSTextAlignmentCenter)
                .byBgColor(HEXCOLOR(0xF0F3F7))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(8))
                        .byMasksToBounds(YES);
                })
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.top.equalTo(self.exampleBtn.mas_bottom).offset(JobsWidth(18));
                    make.left.right.equalTo(self.contentView).inset(JobsWidth(22));
                    make.height.mas_greaterThanOrEqualTo(JobsWidth(72));
                });
        });
    };return _resultLab;
}

@end
