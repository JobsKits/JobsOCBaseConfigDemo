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

-(CGFloat)jobs_presentedRatio;
-(CGFloat)jobs_presentedRatioByText:(NSString *)text;
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
            data.byTextCor(HEXCOLOR(0x3D4A58));
        })
        //    self.viewModel.textModel.text = @"消息详情页".tr;
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(data.attributedTitle.string);
            data.byFont(UIFontWeightRegularSize(16));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround

        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsRandomColor);
    self.makeNavByAlpha(1);
    self.topDirectionBtn.byAlpha(1);
    self.bottomDirectionBtn.byAlpha(1);
    self.leftDirectionBtn.byAlpha(1);
    self.rightDirectionBtn.byAlpha(1);
    self.presentedRatioTitleLab.byAlpha(1);
    self.presentedRatioTextField.byAlpha(1);
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    self.updateStatusBarCor(JobsOrangeColor);/// 在具体子类实现，不要写在父类。父类只做提示
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    self.restoreStatusBarCor(nil);
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}

-(void)jobs_presentByDirection:(JobsTransitionDirection)direction
                       bgColor:(UIColor *)bgColor{
    [self.view endEditing:YES];
    JobsPresentedVC *vc = JobsPresentedVC.new;
    vc.view.byBgColor(bgColor);
    [self jobs_presentViewController:vc
                            configure:^(__kindof JobsPresentTransitionMgr * _Nullable manager) {
        manager.direction = direction;
        manager.presentedRatio = self.jobs_presentedRatio;
    } completion:nil];
}

-(CGFloat)jobs_presentedRatio{
    return [self jobs_presentedRatioByText:self.presentedRatioTextField.text];
}

-(CGFloat)jobs_presentedRatioByText:(NSString *)text{
    NSString *trimmedText = [text stringByTrimmingCharactersInSet:NSCharacterSet.whitespaceAndNewlineCharacterSet];
    NSString *normalizedText = [trimmedText stringByReplacingOccurrencesOfString:@"%" withString:@""];
    CGFloat value = normalizedText.doubleValue;
    if (value <= 0) value = 50.f;
    if (value <= 1.f && [normalizedText rangeOfString:@"."].location != NSNotFound) return MIN(MAX(0.01f, value), 1.f);
    return MIN(MAX(1.f, value), 100.f) / 100.f;
}

-(UIButton *)jobs_makeDirectionBtnByTitle:(NSString *)title
                                direction:(JobsTransitionDirection)direction
                                  bgColor:(UIColor *)bgColor
                                   layout:(jobsByMASConstraintMakerBlock)layoutBlock{
    @jobs_weakify(self)
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        @jobs_strongify(self)
        button
            .byTitle(title.tr)
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
                .byText(@"进入百分比".tr)
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(HEXCOLOR(0x3D4A58))
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
                .byPlaceholder(@"50".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
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
