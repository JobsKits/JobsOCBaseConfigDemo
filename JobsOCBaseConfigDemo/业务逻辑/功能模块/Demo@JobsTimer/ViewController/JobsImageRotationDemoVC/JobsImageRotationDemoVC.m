//
//  JobsImageRotationDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsImageRotationDemoVC.h"

static NSTimeInterval const JobsCounterclockwiseClockIconInterval = 0.05;

@interface JobsImageRotationDemoVC ()

Prop_strong()UILabel *descriptionLab;
Prop_strong()JobsClockIconView *clockwiseClockIconView;
Prop_strong()JobsClockIconView *counterclockwiseClockIconView;
Prop_strong()UILabel *clockwiseLab;
Prop_strong()UILabel *counterclockwiseLab;
Prop_strong()UILabel *statusLab;
Prop_strong()NSMutableArray <UIButton *>*controlBtnMutArr;
Prop_strong()NSArray <NSString *>*controlTitleArr;

-(void)startRotations;
-(void)pauseRotations;
-(void)resumeRotations;
-(void)stopRotations;

@end

@implementation JobsImageRotationDemoVC

-(void)dealloc{
    [_clockwiseClockIconView stop];
    [_counterclockwiseClockIconView stop];
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    [super loadView];
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if (self.viewModel.pushOrPresent != ComingStyle_Unknown) {
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.viewModel
        .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"返回".tr);
        })
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byText(@"动态时钟图标@JobsImageRotation".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(JobsLabelColor);
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(JobsSystemBackgroundColor);
    self.makeNavByAlpha(1);
    self.descriptionLab.byVisible(YES);
    self.clockwiseClockIconView.byVisible(YES);
    self.counterclockwiseClockIconView.byVisible(YES);
    self.clockwiseLab.byVisible(YES);
    self.counterclockwiseLab.byVisible(YES);
    self.statusLab.byVisible(YES);
    for (UIButton *btn in self.controlBtnMutArr) {
        btn.byVisible(YES);
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self startRotations];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self stopRotations];
}
#pragma mark —— 一些私有方法
-(void)startRotations{
    [self.clockwiseClockIconView start];
    [self.counterclockwiseClockIconView start];
    self.statusLab.byText(@"旋转中：顺时针 6 秒/周｜逆时针 3 秒/周".tr);
}

-(void)pauseRotations{
    [self.clockwiseClockIconView pause];
    [self.counterclockwiseClockIconView pause];
    self.statusLab.byText(@"已暂停".tr);
}

-(void)resumeRotations{
    [self.clockwiseClockIconView resume];
    [self.counterclockwiseClockIconView resume];
    self.statusLab.byText(@"已继续".tr);
}

-(void)stopRotations{
    [self.clockwiseClockIconView stop];
    [self.counterclockwiseClockIconView stop];
    self.statusLab.byText(@"已停止并复位".tr);
}
#pragma mark —— lazyLoad
-(UILabel *)descriptionLab{
    if (!_descriptionLab) {
        @jobs_weakify(self)
        _descriptionLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"无刻度、固定时针，仅分针绕圆心旋转；方向与速度由外界传入。".tr)
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(24));
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                });
        });
    };return _descriptionLab;
}

-(JobsClockIconView *)clockwiseClockIconView{
    if (!_clockwiseClockIconView) {
        _clockwiseClockIconView =
            [[JobsClockIconView alloc] initWithDirection:JobsImageRotationDirectionClockwise
                                                interval:JobsClockIconViewDefaultInterval]
                .byTintColor(JobsSystemBlueColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descriptionLab.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.view).offset(JobsWidth(54));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(96), JobsWidth(96)));
                });
    };return _clockwiseClockIconView;
}

-(JobsClockIconView *)counterclockwiseClockIconView{
    if (!_counterclockwiseClockIconView) {
        _counterclockwiseClockIconView =
            [[JobsClockIconView alloc] initWithDirection:JobsImageRotationDirectionCounterclockwise
                                                interval:JobsCounterclockwiseClockIconInterval]
                .byTintColor(HEXCOLOR(0xBF5AF2))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.clockwiseClockIconView);
                    make.right.equalTo(self.view).offset(-JobsWidth(54));
                    make.size.equalTo(self.clockwiseClockIconView);
                });
    };return _counterclockwiseClockIconView;
}

-(UILabel *)clockwiseLab{
    if (!_clockwiseLab) {
        @jobs_weakify(self)
        _clockwiseLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"默认顺时针\n6 秒/周".tr)
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.clockwiseClockIconView.mas_bottom).offset(JobsWidth(10));
                    make.centerX.equalTo(self.clockwiseClockIconView);
                });
        });
    };return _clockwiseLab;
}

-(UILabel *)counterclockwiseLab{
    if (!_counterclockwiseLab) {
        @jobs_weakify(self)
        _counterclockwiseLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"逆时针\n3 秒/周".tr)
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(JobsLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.counterclockwiseClockIconView.mas_bottom).offset(JobsWidth(10));
                    make.centerX.equalTo(self.counterclockwiseClockIconView);
                });
        });
    };return _counterclockwiseLab;
}

-(NSMutableArray<UIButton *> *)controlBtnMutArr{
    if (!_controlBtnMutArr) {
        @jobs_weakify(self)
        _controlBtnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray<UIButton *> * _Nullable arr) {
            @jobs_strongify(self)
            UIButton *lastBtn = nil;
            NSArray <UIColor *>*colorArr = @[
                HEXCOLOR(0x30D158),
                HEXCOLOR(0xFF9F0A),
                HEXCOLOR(0x0A84FF),
                HEXCOLOR(0xFF453A)
            ];
            for (NSUInteger idx = 0; idx < self.controlTitleArr.count; idx++) {
                UIButton *btn = UIButton.jobsInit()
                    .jobsResetBtnTitle(self.controlTitleArr[idx])
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(14))
                    .jobsResetBtnBgCor(colorArr[idx])
                    .jobsResetBtnCornerRadiusValue(JobsWidth(10))
                    .onClickBy(^(UIButton *data) {
                        @jobs_strongify(self)
                        if (data.tag == 0) {
                            [self startRotations];
                        }else if (data.tag == 1){
                            [self pauseRotations];
                        }else if (data.tag == 2){
                            [self resumeRotations];
                        }else{
                            [self stopRotations];
                        }
                    })
                    .byTag(idx)
                    .addOn(self.view)
                    .byAdd(^(MASConstraintMaker *make) {
                        make.top.equalTo(self.clockwiseLab.mas_bottom).offset(JobsWidth(28));
                        make.height.mas_equalTo(JobsWidth(44));
                        if (lastBtn) {
                            make.left.equalTo(lastBtn.mas_right).offset(JobsWidth(8));
                            make.width.equalTo(lastBtn);
                        }else{
                            make.left.equalTo(self.view).offset(JobsWidth(20));
                        }
                        if (idx == self.controlTitleArr.count - 1) {
                            make.right.equalTo(self.view).offset(-JobsWidth(20));
                        }
                    });
                arr.add(btn);
                lastBtn = btn;
            }
        });
    };return _controlBtnMutArr;
}

-(NSArray<NSString *> *)controlTitleArr{
    if (!_controlTitleArr) {
        _controlTitleArr = @[@"开始".tr, @"暂停".tr, @"继续".tr, @"停止".tr];
    };return _controlTitleArr;
}

-(UILabel *)statusLab{
    if (!_statusLab) {
        @jobs_weakify(self)
        _statusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"等待开始".tr)
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(JobsSecondaryLabelColor)
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.controlBtnMutArr.firstObject.mas_bottom).offset(JobsWidth(20));
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                });
        });
    };return _statusLab;
}

@end
