//
//  JobsPresentingVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsPresentingVC.h"

@interface JobsPresentingVC ()

Prop_strong()UILabel *presentedRatioTitleLab;
Prop_strong()UITextField *presentedRatioTextField;
Prop_strong()UIButton *topDirectionBtn;
Prop_strong()UIButton *bottomDirectionBtn;
Prop_strong()UIButton *leftDirectionBtn;
Prop_strong()UIButton *rightDirectionBtn;

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_presentedRatio;
-(JobsRetCGFloatByNSStringBlock _Nonnull)jobs_presentedRatioByText;
-(void)jobs_presentByDirection:(JobsTransitionDirection)direction
                       bgColor:(UIColor *)bgColor;
-(UIButton *)jobs_makeDirectionBtnByTitle:(NSString *)title
                                direction:(JobsTransitionDirection)direction
                                  bgColor:(UIColor *)bgColor
                                   layout:(jobsByMASConstraintMakerBlock)layoutBlock;

@end

@implementation JobsPresentingVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsLoadView{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super loadView];
        if ([self.requestParams isKindOfClass:UIViewModel.class]) {
            self.byViewModel((UIViewModel *)self.requestParams);
            if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
                self.byPushOrPresent(self.viewModel.pushOrPresent);
            }
        }
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".jobsTr());
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(JobsLabelColor);
            })
            //    self.viewModel.textModel.text = @"消息详情页".jobsTr();
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.makeNavByAlpha(1);
        self.topDirectionBtn.byAlpha(1);
        self.bottomDirectionBtn.byAlpha(1);
        self.leftDirectionBtn.byAlpha(1);
        self.rightDirectionBtn.byAlpha(1);
        self.presentedRatioTitleLab.byAlpha(1);
        self.presentedRatioTextField.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillAppear:animated];
        //    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
            [super viewWillDisappear:animated];
        //    self.restoreStatusBarCor(nil);
    };
}

-(void)viewDidDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsPresentingVC.class, @selector(jobsViewDidDisappear)))(self, @selector(jobsViewDidDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidDisappear:animated];
    };
}

-(void)jobs_presentByDirection:(JobsTransitionDirection)direction
                       bgColor:(UIColor *)bgColor{
    [self.view endEditing:YES];
    JobsPresentedVC *vc = JobsPresentedVC.new;
    vc.view.byBgColor(bgColor);
    [self jobs_presentViewController:vc
                            configure:^(__kindof JobsPresentTransitionMgr * _Nullable manager) {
        manager
            .byDirection(direction)
            .byPresentedRatio(self.jobs_presentedRatio());
    } completion:nil];
}

-(JobsRetCGFloatByVoidBlock _Nonnull)jobs_presentedRatio{
    @jobs_weakify(self)
    return ^CGFloat{
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        return self.jobs_presentedRatioByText(self.presentedRatioTextField.text);
    };
}

-(JobsRetCGFloatByNSStringBlock _Nonnull)jobs_presentedRatioByText{
    @jobs_weakify(self)
    return ^CGFloat(NSString * text){
        @jobs_strongify(self)
        if (!self) return (CGFloat){0};
        NSString *trimmedText = [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
        NSString *normalizedText = [trimmedText stringByReplacingOccurrencesOfString:@"%" withString:@""];
        CGFloat value = normalizedText.doubleValue;
        if (value <= 0) value = 50.f;
        if (value <= 1.f && [normalizedText rangeOfString:@"."].location != NSNotFound) return MIN(MAX(0.01f, value), 1.f);
        return MIN(MAX(1.f, value), 100.f) / 100.f;
    };
}

-(UIButton *)jobs_makeDirectionBtnByTitle:(NSString *)title
                                direction:(JobsTransitionDirection)direction
                                  bgColor:(UIColor *)bgColor
                                   layout:(jobsByMASConstraintMakerBlock)layoutBlock{
    @jobs_weakify(self)
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        @jobs_strongify(self)
        button
            .byTitle(title.jobsTr())
            .byTitleCor(JobsWhiteColor)
            .byTitleFont(UIFontWeightRegularSize(15))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                [self jobs_presentByDirection:direction
                                      bgColor:bgColor];
            })
            .byBgColor(bgColor)
            .byCornerRadius(JobsWidth(12))
            .addOn(self.view)
            .byAdd(layoutBlock);
    });
}
#pragma mark —— lazyLoad
-(UIButton *)topDirectionBtn{
    if (!_topDirectionBtn) {
        _topDirectionBtn = [self jobs_makeDirectionBtnByTitle:@"从上进入"
                                                    direction:JobsTransitionDirectionTop
                                                      bgColor:HEXCOLOR(0x2F80ED)
                                                       layout:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(JobsWidth(130), JobsWidth(48)));
            make.right.equalTo(self.view.mas_centerX).offset(-JobsWidth(8));
            make.bottom.equalTo(self.view.mas_centerY).offset(-JobsWidth(8));
        }];
    };return _topDirectionBtn;
}

-(UIButton *)bottomDirectionBtn{
    if (!_bottomDirectionBtn) {
        _bottomDirectionBtn = [self jobs_makeDirectionBtnByTitle:@"从下进入"
                                                       direction:JobsTransitionDirectionBottom
                                                         bgColor:HEXCOLOR(0xEB5757)
                                                          layout:^(MASConstraintMaker *make) {
            make.size.equalTo(self.topDirectionBtn);
            make.left.equalTo(self.view.mas_centerX).offset(JobsWidth(8));
            make.centerY.equalTo(self.topDirectionBtn);
        }];
    };return _bottomDirectionBtn;
}

-(UIButton *)leftDirectionBtn{
    if (!_leftDirectionBtn) {
        _leftDirectionBtn = [self jobs_makeDirectionBtnByTitle:@"从左进入"
                                                     direction:JobsTransitionDirectionLeft
                                                       bgColor:HEXCOLOR(0x27AE60)
                                                        layout:^(MASConstraintMaker *make) {
            make.size.equalTo(self.topDirectionBtn);
            make.right.equalTo(self.topDirectionBtn);
            make.top.equalTo(self.view.mas_centerY).offset(JobsWidth(8));
        }];
    };return _leftDirectionBtn;
}

-(UIButton *)rightDirectionBtn{
    if (!_rightDirectionBtn) {
        _rightDirectionBtn = [self jobs_makeDirectionBtnByTitle:@"从右进入"
                                                      direction:JobsTransitionDirectionRight
                                                        bgColor:HEXCOLOR(0x9B51E0)
                                                         layout:^(MASConstraintMaker *make) {
            make.size.equalTo(self.topDirectionBtn);
            make.left.equalTo(self.bottomDirectionBtn);
            make.centerY.equalTo(self.leftDirectionBtn);
        }];
    };return _rightDirectionBtn;
}

-(UILabel *)presentedRatioTitleLab{
    if (!_presentedRatioTitleLab) {
        @jobs_weakify(self)
        _presentedRatioTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .byText(@"进入百分比".jobsTr())
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentRight)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.presentedRatioTextField);
                    make.right.equalTo(self.presentedRatioTextField.mas_left).offset(-JobsWidth(8));
                    make.width.mas_equalTo(JobsWidth(88));
                });
        });
    };return _presentedRatioTitleLab;
}

-(UITextField *)presentedRatioTextField{
    if (!_presentedRatioTextField) {
        @jobs_weakify(self)
        _presentedRatioTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            @jobs_strongify(self)
            textField
                .byText(@"50")
                .byPlaceholder(@"50".jobsTr())
                .byTextCor(JobsLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byClearButtonMode(UITextFieldViewModeWhileEditing)
                .byKeyboardType(UIKeyboardTypeDecimalPad)
                .byReturnKeyType(UIReturnKeyDone)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.view).offset(JobsWidth(44));
                    make.bottom.equalTo(self.topDirectionBtn.mas_top).offset(-JobsWidth(24));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(96), JobsWidth(40)));
                });
        });
    };return _presentedRatioTextField;
}

@end
