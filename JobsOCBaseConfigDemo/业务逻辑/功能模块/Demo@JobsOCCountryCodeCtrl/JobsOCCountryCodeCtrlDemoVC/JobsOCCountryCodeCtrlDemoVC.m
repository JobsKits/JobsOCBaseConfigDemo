//
//  JobsOCCountryCodeCtrlDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年6月24日，星期三.
//

#import "JobsOCCountryCodeCtrlDemoVC.h"

@interface JobsOCCountryCodeCtrlDemoVC ()
/// UI
Prop_strong()UITextField *countryCodeTextField;
Prop_strong()BaseButton *selectBtn;

@end

@implementation JobsOCCountryCodeCtrlDemoVC
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
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byText(@"JobsOCCountryCodeCtrl".tr)
                .byFont(UIFontWeightRegularSize(16));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsWhiteColor);
    self.makeNavByAlpha(1);
    self.countryCodeTextField.byAlpha(1);
    self.selectBtn.byAlpha(1);
}
#pragma mark —— lazyLoad
-(UITextField *)countryCodeTextField{
    if (!_countryCodeTextField) {
        _countryCodeTextField = jobsMakeTextField(^(__kindof UITextField * _Nullable textField) {
            textField.byText(@"".tr)
                .byPlaceholder(@"请选择国家 / 地区代码".tr)
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byFont(UIFontWeightRegularSize(14))
                .byTextAlignment(NSTextAlignmentCenter)
                .byBorderStyle(UITextBorderStyleRoundedRect)
                .byUserInteractionEnabled(NO)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerY.equalTo(self.view);
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(44));
                });
        });
    };return _countryCodeTextField;
}

-(BaseButton *)selectBtn{
    if (!_selectBtn) {
        @jobs_weakify(self)
        _selectBtn = BaseButton
            .initByStyle1(@"选择".tr,
                          UIFontWeightRegularSize(14),
                          JobsWhiteColor)
            .bgColorBy(HEXCOLOR(0x3D4A58))
            .cornerRadiusValueBy(JobsWidth(6))
            .onClickBy(^(UIButton *x){
                @jobs_strongify(self)
                JobsOCCountryCodeCtrl *vc = JobsOCCountryCodeCtrl.new;
                vc.countryCodeBlock = ^(__kindof NSString *countryName, __kindof NSString *code) {
                    @jobs_strongify(self)
                    self.countryCodeTextField.byAttributedText([JobsOCCountryCodeCtrl jobs_countryCodeAttributedTextByCountryName:countryName
                                                                                                                              code:code
                                                                                                                              font:self.countryCodeTextField.font
                                                                                                                         textColor:self.countryCodeTextField.textColor]);
                };
                [self forceComingToPushVC:vc
                            requestParams:nil];
            })
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.centerY.equalTo(self.countryCodeTextField);
                make.left.equalTo(self.countryCodeTextField.mas_right).offset(JobsWidth(12));
                make.right.equalTo(self.view).offset(-JobsWidth(24));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(88), JobsWidth(44)));
            });
    };return _selectBtn;
}

@end
