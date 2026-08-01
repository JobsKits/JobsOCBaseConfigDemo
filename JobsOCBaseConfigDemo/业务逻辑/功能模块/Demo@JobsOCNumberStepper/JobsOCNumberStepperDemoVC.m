//
//  JobsOCNumberStepperDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsOCNumberStepperDemoVC.h"

@interface JobsOCNumberStepperDemoVC ()

Prop_strong()UIScrollView *demoScrollView;
Prop_strong()UIStackView *contentStackView;
Prop_strong()UILabel *introLab;
Prop_strong()NSMutableArray <UIView *>*cardViewMutArr;
Prop_strong()NSMutableArray <UILabel *>*titleLabMutArr;
Prop_strong()NSMutableArray <UILabel *>*detailLabMutArr;
Prop_strong()NSMutableArray <UILabel *>*valueLabMutArr;
Prop_strong()NSMutableArray <JobsOCNumberStepper *>*numberStepperMutArr;

@end

@implementation JobsOCNumberStepperDemoVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.makeNavByAlpha(1);
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.contentStackView.byHidden(NO);
    [self setupScenarios];
}

-(void)loadView{
    [super loadView];
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"数字步进输入".tr);
        })
        .byBgCor(JobsSystemBackgroundColor)
        .byNavBgCor(JobsSystemBackgroundColor);
}

#pragma mark —— Scenarios
-(void)setupScenarios{
    self.contentStackView.byAddArrangedSubview(self.introLab);
    [self addScenarioWithTitle:@"不设置边界"
                        detail:@"minimumValue = nil，maximumValue = nil"
                         value:0
                  minimumValue:nil
                  maximumValue:nil];
    [self addScenarioWithTitle:@"仅设置下限"
                        detail:@"minimumValue = 4；当前值到 4 时减号不可点"
                         value:4
                  minimumValue:@4
                  maximumValue:nil];
    [self addScenarioWithTitle:@"仅设置上限"
                        detail:@"maximumValue = 8；当前值到 8 时加号不可点"
                         value:8
                  minimumValue:nil
                  maximumValue:@8];
    [self addScenarioWithTitle:@"同时设置上下限"
                        detail:@"输入框只接受整数，结束编辑后自动收敛到 4...8"
                         value:6
                  minimumValue:@4
                  maximumValue:@8];
}

-(void)addScenarioWithTitle:(NSString *)title
                     detail:(NSString *)detail
                      value:(NSInteger)value
               minimumValue:(NSNumber *)minimumValue
               maximumValue:(NSNumber *)maximumValue{
    UIView *cardView = jobsMakeView(^(__kindof UIView * _Nullable view) {
        view
            .byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(12);
    });
    UILabel *titleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(title.tr)
            .byTextCor(JobsLabelColor)
            .byFont(UIFontWeightSemiboldSize(16));
    });
    UILabel *detailLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText(detail.tr)
            .byTextCor(JobsSecondaryLabelColor)
            .byFont(UIFontWeightRegularSize(13))
            .byNumberOfLines(0);
    });
    UILabel *valueLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label
            .byText([NSString stringWithFormat:@"当前值：%ld",(long)value])
            .byTextCor(JobsSystemBlueColor)
            .byFont([UIFont monospacedDigitSystemFontOfSize:14
                                                    weight:UIFontWeightMedium])
            .byNumberOfLines(1)
            .byAdjustsFontSizeToFitWidth(YES)
            .byMinimumScaleFactor(0.8);
    });
    JobsOCNumberStepper *numberStepper = JobsOCNumberStepper.new;
    [numberStepper configureWithValue:value
                         minimumValue:minimumValue
                         maximumValue:maximumValue
                             stepValue:1];
    numberStepper.onJobsChange(^(__kindof UIControl * _Nullable control) {
        JobsOCNumberStepper *stepper = (JobsOCNumberStepper *)control;
        valueLab.byText([NSString stringWithFormat:@"当前值：%ld",(long)stepper.value]);
    });

    [self.cardViewMutArr addObject:cardView];
    [self.titleLabMutArr addObject:titleLab];
    [self.detailLabMutArr addObject:detailLab];
    [self.valueLabMutArr addObject:valueLab];
    [self.numberStepperMutArr addObject:numberStepper];

    self.contentStackView.byAddArrangedSubview(cardView);
    titleLab
        .addOn(cardView)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.left.right.equalTo(cardView).inset(16);
        });
    detailLab
        .addOn(cardView)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(titleLab.mas_bottom).offset(6);
            make.left.right.equalTo(titleLab);
        });
    numberStepper
        .addOn(cardView)
        .byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(detailLab.mas_bottom).offset(14);
            make.left.equalTo(titleLab);
            make.size.mas_equalTo(numberStepper.intrinsicContentSize);
            make.bottom.equalTo(cardView).inset(16);
        });
    valueLab
        .addOn(cardView)
        .byAdd(^(MASConstraintMaker *make) {
            make.left.equalTo(numberStepper.mas_right).offset(12);
            make.right.equalTo(titleLab);
            make.centerY.equalTo(numberStepper);
        });
}

#pragma mark —— LazyLoad
-(UIScrollView *)demoScrollView{
    if (!_demoScrollView) {
        @jobs_weakify(self)
        _demoScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            scrollView
                .byAlwaysBounceVertical(YES)
                .byShowsVerticalScrollIndicator(NO)
                .byKeyboardDismissMode(UIScrollViewKeyboardDismissModeInteractive)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _demoScrollView;
}

-(UIStackView *)contentStackView{
    if (!_contentStackView) {
        @jobs_weakify(self)
        _contentStackView = jobsMakeStackView(^(__kindof UIStackView * _Nullable stackView) {
            stackView
                .byAxis(UILayoutConstraintAxisVertical)
                .byAlignment(UIStackViewAlignmentFill)
                .byDistribution(UIStackViewDistributionFill)
                .bySpacing(14)
                .addOn(self.demoScrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self.demoScrollView).inset(16);
                    make.width.equalTo(self.demoScrollView).offset(-32);
                });
        });
    };return _contentStackView;
}

-(UILabel *)introLab{
    if (!_introLab) {
        _introLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label
                .byText(@"减号 + 整数输入框 + 加号。上下限均为可选配置；到达已设置的边界时，对应按钮会自动禁用并置灰。".tr)
                .byTextCor(JobsSecondaryLabelColor)
                .byFont(UIFontWeightRegularSize(14))
                .byNumberOfLines(0);
        });
    };return _introLab;
}

-(NSMutableArray<UIView *> *)cardViewMutArr{
    if (!_cardViewMutArr) {
        _cardViewMutArr = NSMutableArray.array;
    };return _cardViewMutArr;
}

-(NSMutableArray<UILabel *> *)titleLabMutArr{
    if (!_titleLabMutArr) {
        _titleLabMutArr = NSMutableArray.array;
    };return _titleLabMutArr;
}

-(NSMutableArray<UILabel *> *)detailLabMutArr{
    if (!_detailLabMutArr) {
        _detailLabMutArr = NSMutableArray.array;
    };return _detailLabMutArr;
}

-(NSMutableArray<UILabel *> *)valueLabMutArr{
    if (!_valueLabMutArr) {
        _valueLabMutArr = NSMutableArray.array;
    };return _valueLabMutArr;
}

-(NSMutableArray<JobsOCNumberStepper *> *)numberStepperMutArr{
    if (!_numberStepperMutArr) {
        _numberStepperMutArr = NSMutableArray.array;
    };return _numberStepperMutArr;
}

@end
