//
//  JobsImageRotationDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsImageRotationDemoVC.h"

@interface JobsImageRotationDemoVC ()

Prop_strong()UILabel *descriptionLab;
Prop_strong()UIButton *clockwiseBtn;
Prop_strong()UIButton *counterclockwiseBtn;
Prop_strong()UILabel *clockwiseLab;
Prop_strong()UILabel *counterclockwiseLab;
Prop_strong()UILabel *statusLab;
Prop_strong()NSMutableArray <UIButton *>*controlBtnMutArr;
Prop_strong()NSArray <NSString *>*controlTitleArr;
Prop_strong()JobsImageRotator *clockwiseRotator;
Prop_strong()JobsImageRotator *counterclockwiseRotator;

-(void)startRotations;
-(void)pauseRotations;
-(void)resumeRotations;
-(void)stopRotations;

@end

@implementation JobsImageRotationDemoVC

-(void)dealloc{
    [_clockwiseRotator stop];
    [_counterclockwiseRotator stop];
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
            data.byText(@"JobsImageRotation".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

-(void)viewDidLoad{
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0xF4F5F8));
    self.makeNavByAlpha(1);
    self.descriptionLab.byVisible(YES);
    self.clockwiseBtn.byVisible(YES);
    self.counterclockwiseBtn.byVisible(YES);
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
    [self.clockwiseRotator start];
    [self.counterclockwiseRotator start];
    self.statusLab.byText(@"旋转中：顺时针 1/60 秒｜逆时针 1/30 秒".tr);
}

-(void)pauseRotations{
    [self.clockwiseRotator pause];
    [self.counterclockwiseRotator pause];
    self.statusLab.byText(@"已暂停".tr);
}

-(void)resumeRotations{
    [self.clockwiseRotator resume];
    [self.counterclockwiseRotator resume];
    self.statusLab.byText(@"已继续".tr);
}

-(void)stopRotations{
    [self.clockwiseRotator stop];
    [self.counterclockwiseRotator stop];
    self.statusLab.byText(@"已停止并复位".tr);
}
#pragma mark —— lazyLoad
-(UILabel *)descriptionLab{
    if (!_descriptionLab) {
        @jobs_weakify(self)
        _descriptionLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"同一张时钟图，分别演示默认顺时针与逆时针；Timer 间隔越小，旋转越快。".tr)
                .byFont(UIFontWeightRegularSize(15))
                .byTextCor(HEXCOLOR(0x5F6B7A))
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

-(UIButton *)clockwiseBtn{
    if (!_clockwiseBtn) {
        @jobs_weakify(self)
        _clockwiseBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            button.jobsResetBtnImage(@"clock".img)
                .jobsResetBtnBgCor(HEXCOLOR(0x0A84FF))
                .jobsResetBtnCornerRadiusValue(JobsWidth(48))
                .byTintColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.descriptionLab.mas_bottom).offset(JobsWidth(28));
                    make.left.equalTo(self.view).offset(JobsWidth(54));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(96), JobsWidth(96)));
                });
        });
    };return _clockwiseBtn;
}

-(UIButton *)counterclockwiseBtn{
    if (!_counterclockwiseBtn) {
        @jobs_weakify(self)
        _counterclockwiseBtn = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
            @jobs_strongify(self)
            button.jobsResetBtnImage(@"clock".img)
                .jobsResetBtnBgCor(HEXCOLOR(0xBF5AF2))
                .jobsResetBtnCornerRadiusValue(JobsWidth(48))
                .byTintColor(JobsWhiteColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.clockwiseBtn);
                    make.size.equalTo(self.clockwiseBtn);
                    make.right.equalTo(self.view).offset(-JobsWidth(54));
                });
        });
    };return _counterclockwiseBtn;
}

-(UILabel *)clockwiseLab{
    if (!_clockwiseLab) {
        @jobs_weakify(self)
        _clockwiseLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"默认顺时针\n1/60 秒".tr)
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.clockwiseBtn.mas_bottom).offset(JobsWidth(10));
                    make.centerX.equalTo(self.clockwiseBtn);
                });
        });
    };return _clockwiseLab;
}

-(UILabel *)counterclockwiseLab{
    if (!_counterclockwiseLab) {
        @jobs_weakify(self)
        _counterclockwiseLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"逆时针\n1/30 秒".tr)
                .byFont(UIFontWeightMediumSize(14))
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.counterclockwiseBtn.mas_bottom).offset(JobsWidth(10));
                    make.centerX.equalTo(self.counterclockwiseBtn);
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
                btn.tag = idx;
                btn.onClickBy(^(UIButton *data) {
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
                .byTextCor(HEXCOLOR(0x5F6B7A))
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

-(JobsImageRotator *)clockwiseRotator{
    if (!_clockwiseRotator) {
        _clockwiseRotator = [[JobsImageRotator alloc] initWithTargetView:self.clockwiseBtn.imageView];
    };return _clockwiseRotator;
}

-(JobsImageRotator *)counterclockwiseRotator{
    if (!_counterclockwiseRotator) {
        _counterclockwiseRotator =
            [[JobsImageRotator alloc] initWithTargetView:self.counterclockwiseBtn.imageView
                                              direction:JobsImageRotationDirectionCounterclockwise
                                               interval:1.0 / 30.0];
    };return _counterclockwiseRotator;
}

@end
