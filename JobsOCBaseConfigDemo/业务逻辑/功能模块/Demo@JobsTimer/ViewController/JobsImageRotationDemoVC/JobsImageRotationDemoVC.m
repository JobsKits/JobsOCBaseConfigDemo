//
//  JobsImageRotationDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月24日，星期五.
//

#import "JobsImageRotationDemoVC.h"

static NSTimeInterval const JobsClockwiseMinuteHandInterval = 1.0 / 60.0;
static NSTimeInterval const JobsCounterclockwiseMinuteHandInterval = 1.0 / 30.0;
static CGFloat const JobsHourHandIntervalMultiplier = 12.0;

@interface JobsImageRotationDemoVC ()

Prop_strong()UILabel *descriptionLab;
Prop_strong()UIButton *clockwiseBtn;
Prop_strong()UIButton *counterclockwiseBtn;
Prop_strong()UIView *clockwiseDialView;
Prop_strong()UIView *counterclockwiseDialView;
Prop_strong()CAShapeLayer *clockwiseDialLayer;
Prop_strong()CAShapeLayer *counterclockwiseDialLayer;
Prop_strong()UIView *clockwiseHourHandContainerView;
Prop_strong()UIView *clockwiseMinuteHandContainerView;
Prop_strong()UIView *counterclockwiseHourHandContainerView;
Prop_strong()UIView *counterclockwiseMinuteHandContainerView;
Prop_strong()UIView *clockwiseHourHandView;
Prop_strong()UIView *clockwiseMinuteHandView;
Prop_strong()UIView *counterclockwiseHourHandView;
Prop_strong()UIView *counterclockwiseMinuteHandView;
Prop_strong()UIView *clockwiseCenterDotView;
Prop_strong()UIView *counterclockwiseCenterDotView;
Prop_strong()UILabel *clockwiseLab;
Prop_strong()UILabel *counterclockwiseLab;
Prop_strong()UILabel *statusLab;
Prop_strong()NSMutableArray <UIButton *>*controlBtnMutArr;
Prop_strong()NSArray <NSString *>*controlTitleArr;
Prop_strong()JobsImageRotator *clockwiseRotator;
Prop_strong()JobsImageRotator *counterclockwiseRotator;
Prop_strong()JobsImageRotator *clockwiseHourHandRotator;
Prop_strong()JobsImageRotator *counterclockwiseHourHandRotator;

-(void)startRotations;
-(void)pauseRotations;
-(void)resumeRotations;
-(void)stopRotations;
-(void)updateDialLayer:(CAShapeLayer *)dialLayer
            inDialView:(UIView *)dialView;

@end

@implementation JobsImageRotationDemoVC

-(void)dealloc{
    [_clockwiseRotator stop];
    [_counterclockwiseRotator stop];
    [_clockwiseHourHandRotator stop];
    [_counterclockwiseHourHandRotator stop];
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
    self.clockwiseDialView.byVisible(YES);
    self.counterclockwiseDialView.byVisible(YES);
    self.clockwiseDialLayer.byHidden(NO);
    self.counterclockwiseDialLayer.byHidden(NO);
    self.clockwiseHourHandView.byVisible(YES);
    self.clockwiseMinuteHandView.byVisible(YES);
    self.counterclockwiseHourHandView.byVisible(YES);
    self.counterclockwiseMinuteHandView.byVisible(YES);
    self.clockwiseCenterDotView.byVisible(YES);
    self.counterclockwiseCenterDotView.byVisible(YES);
    self.clockwiseLab.byVisible(YES);
    self.counterclockwiseLab.byVisible(YES);
    self.statusLab.byVisible(YES);
    for (UIButton *btn in self.controlBtnMutArr) {
        btn.byVisible(YES);
    }
}

-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self updateDialLayer:self.clockwiseDialLayer
               inDialView:self.clockwiseDialView];
    [self updateDialLayer:self.counterclockwiseDialLayer
               inDialView:self.counterclockwiseDialView];
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
    [self.clockwiseHourHandRotator start];
    [self.counterclockwiseHourHandRotator start];
    self.statusLab.byText(@"走字中：顺时针 1/60 秒｜逆时针 1/30 秒".tr);
}

-(void)pauseRotations{
    [self.clockwiseRotator pause];
    [self.counterclockwiseRotator pause];
    [self.clockwiseHourHandRotator pause];
    [self.counterclockwiseHourHandRotator pause];
    self.statusLab.byText(@"已暂停".tr);
}

-(void)resumeRotations{
    [self.clockwiseRotator resume];
    [self.counterclockwiseRotator resume];
    [self.clockwiseHourHandRotator resume];
    [self.counterclockwiseHourHandRotator resume];
    self.statusLab.byText(@"已继续".tr);
}

-(void)stopRotations{
    [self.clockwiseRotator stop];
    [self.counterclockwiseRotator stop];
    [self.clockwiseHourHandRotator stop];
    [self.counterclockwiseHourHandRotator stop];
    self.statusLab.byText(@"已停止并复位".tr);
}

-(void)updateDialLayer:(CAShapeLayer *)dialLayer
            inDialView:(UIView *)dialView{
    CGFloat size = MIN(CGRectGetWidth(dialView.bounds),
                       CGRectGetHeight(dialView.bounds));
    if (size <= 0) return;
    CGPoint center = CGPointMake(CGRectGetMidX(dialView.bounds),
                                 CGRectGetMidY(dialView.bounds));
    CGFloat radius = size / 2.0 - JobsWidth(2);
    UIBezierPath *dialPath = UIBezierPath.byBezierPathWithOvalInRect(
        CGRectMake(center.x - radius,
                   center.y - radius,
                   radius * 2.0,
                   radius * 2.0)
    );
    for (NSUInteger idx = 0; idx < 12; idx++) {
        CGFloat angle = (CGFloat)idx / 12.0 * M_PI * 2.0 - M_PI_2;
        CGFloat tickLength = idx % 3 == 0 ? JobsWidth(10) : JobsWidth(7);
        CGPoint outerPoint = CGPointMake(center.x + cos(angle) * radius,
                                         center.y + sin(angle) * radius);
        CGPoint innerPoint = CGPointMake(center.x + cos(angle) * (radius - tickLength),
                                         center.y + sin(angle) * (radius - tickLength));
        dialPath.byMoveToPoint(innerPoint)
            .byAddLineToPoint(outerPoint);
    }
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    dialLayer.byPath(dialPath.CGPath)
        .byFrame(dialView.bounds);
    [CATransaction commit];
}
#pragma mark —— lazyLoad
-(UILabel *)descriptionLab{
    if (!_descriptionLab) {
        @jobs_weakify(self)
        _descriptionLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"表盘固定不动，只演示时针与分针按顺时针 / 逆时针走字；不显示阿拉伯数字与秒针。".tr)
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
            button.jobsResetBtnBgCor(HEXCOLOR(0x0A84FF))
                .jobsResetBtnCornerRadiusValue(JobsWidth(48))
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
            button.jobsResetBtnBgCor(HEXCOLOR(0xBF5AF2))
                .jobsResetBtnCornerRadiusValue(JobsWidth(48))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.clockwiseBtn);
                    make.size.equalTo(self.clockwiseBtn);
                    make.right.equalTo(self.view).offset(-JobsWidth(54));
                });
        });
    };return _counterclockwiseBtn;
}

-(UIView *)clockwiseDialView{
    if (!_clockwiseDialView) {
        _clockwiseDialView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .addOn(self.clockwiseBtn)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.clockwiseBtn).insets(UIEdgeInsetsMake(JobsWidth(10),
                                                                                  JobsWidth(10),
                                                                                  JobsWidth(10),
                                                                                  JobsWidth(10)));
                });
        });
    };return _clockwiseDialView;
}

-(UIView *)counterclockwiseDialView{
    if (!_counterclockwiseDialView) {
        _counterclockwiseDialView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .addOn(self.counterclockwiseBtn)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.counterclockwiseBtn).insets(UIEdgeInsetsMake(JobsWidth(10),
                                                                                         JobsWidth(10),
                                                                                         JobsWidth(10),
                                                                                         JobsWidth(10)));
                });
        });
    };return _counterclockwiseDialView;
}

-(CAShapeLayer *)clockwiseDialLayer{
    if (!_clockwiseDialLayer) {
        _clockwiseDialLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            layer.byStrokeColorUIColor(JobsWhiteColor)
                .byFillColorUIColor(JobsClearColor)
                .byLineWidth(JobsWidth(2))
                .byLineCap(kCALineCapRound)
                .addOn(self.clockwiseDialView.layer);
        });
    };return _clockwiseDialLayer;
}

-(CAShapeLayer *)counterclockwiseDialLayer{
    if (!_counterclockwiseDialLayer) {
        _counterclockwiseDialLayer = jobsMakeCAShapeLayer(^(__kindof CAShapeLayer * _Nullable layer) {
            layer.byStrokeColorUIColor(JobsWhiteColor)
                .byFillColorUIColor(JobsClearColor)
                .byLineWidth(JobsWidth(2))
                .byLineCap(kCALineCapRound)
                .addOn(self.counterclockwiseDialView.layer);
        });
    };return _counterclockwiseDialLayer;
}

-(UIView *)clockwiseHourHandContainerView{
    if (!_clockwiseHourHandContainerView) {
        _clockwiseHourHandContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .byTransform(CGAffineTransformMakeRotation(-M_PI / 3.0))
                .addOn(self.clockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.clockwiseDialView);
                });
        });
    };return _clockwiseHourHandContainerView;
}

-(UIView *)clockwiseMinuteHandContainerView{
    if (!_clockwiseMinuteHandContainerView) {
        _clockwiseMinuteHandContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .byTransform(CGAffineTransformMakeRotation(M_PI / 3.0))
                .addOn(self.clockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.clockwiseDialView);
                });
        });
    };return _clockwiseMinuteHandContainerView;
}

-(UIView *)counterclockwiseHourHandContainerView{
    if (!_counterclockwiseHourHandContainerView) {
        _counterclockwiseHourHandContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .byTransform(CGAffineTransformMakeRotation(-M_PI / 3.0))
                .addOn(self.counterclockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.counterclockwiseDialView);
                });
        });
    };return _counterclockwiseHourHandContainerView;
}

-(UIView *)counterclockwiseMinuteHandContainerView{
    if (!_counterclockwiseMinuteHandContainerView) {
        _counterclockwiseMinuteHandContainerView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsClearColor)
                .byUserInteractionEnabled(NO)
                .byTransform(CGAffineTransformMakeRotation(M_PI / 3.0))
                .addOn(self.counterclockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.counterclockwiseDialView);
                });
        });
    };return _counterclockwiseMinuteHandContainerView;
}

-(UIView *)clockwiseHourHandView{
    if (!_clockwiseHourHandView) {
        _clockwiseHourHandView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsBlackColor)
                .byCornerRadius(JobsWidth(3))
                .byUserInteractionEnabled(NO)
                .addOn(self.clockwiseHourHandContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.clockwiseHourHandContainerView);
                    make.bottom.equalTo(self.clockwiseHourHandContainerView.mas_centerY).offset(JobsWidth(3));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(6), JobsWidth(23)));
                });
        });
    };return _clockwiseHourHandView;
}

-(UIView *)clockwiseMinuteHandView{
    if (!_clockwiseMinuteHandView) {
        _clockwiseMinuteHandView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsWhiteColor)
                .byCornerRadius(JobsWidth(2))
                .byUserInteractionEnabled(NO)
                .addOn(self.clockwiseMinuteHandContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.clockwiseMinuteHandContainerView);
                    make.bottom.equalTo(self.clockwiseMinuteHandContainerView.mas_centerY).offset(JobsWidth(3));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(4), JobsWidth(30)));
                });
        });
    };return _clockwiseMinuteHandView;
}

-(UIView *)counterclockwiseHourHandView{
    if (!_counterclockwiseHourHandView) {
        _counterclockwiseHourHandView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsBlackColor)
                .byCornerRadius(JobsWidth(3))
                .byUserInteractionEnabled(NO)
                .addOn(self.counterclockwiseHourHandContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.counterclockwiseHourHandContainerView);
                    make.bottom.equalTo(self.counterclockwiseHourHandContainerView.mas_centerY).offset(JobsWidth(3));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(6), JobsWidth(23)));
                });
        });
    };return _counterclockwiseHourHandView;
}

-(UIView *)counterclockwiseMinuteHandView{
    if (!_counterclockwiseMinuteHandView) {
        _counterclockwiseMinuteHandView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsWhiteColor)
                .byCornerRadius(JobsWidth(2))
                .byUserInteractionEnabled(NO)
                .addOn(self.counterclockwiseMinuteHandContainerView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.centerX.equalTo(self.counterclockwiseMinuteHandContainerView);
                    make.bottom.equalTo(self.counterclockwiseMinuteHandContainerView.mas_centerY).offset(JobsWidth(3));
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(4), JobsWidth(30)));
                });
        });
    };return _counterclockwiseMinuteHandView;
}

-(UIView *)clockwiseCenterDotView{
    if (!_clockwiseCenterDotView) {
        _clockwiseCenterDotView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsBlackColor)
                .byCornerRadius(JobsWidth(4))
                .byUserInteractionEnabled(NO)
                .addOn(self.clockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self.clockwiseDialView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(8), JobsWidth(8)));
                });
        });
    };return _clockwiseCenterDotView;
}

-(UIView *)counterclockwiseCenterDotView{
    if (!_counterclockwiseCenterDotView) {
        _counterclockwiseCenterDotView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsBlackColor)
                .byCornerRadius(JobsWidth(4))
                .byUserInteractionEnabled(NO)
                .addOn(self.counterclockwiseDialView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.center.equalTo(self.counterclockwiseDialView);
                    make.size.mas_equalTo(CGSizeMake(JobsWidth(8), JobsWidth(8)));
                });
        });
    };return _counterclockwiseCenterDotView;
}

-(UILabel *)clockwiseLab{
    if (!_clockwiseLab) {
        @jobs_weakify(self)
        _clockwiseLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"顺时针走字\n分针 1/60 秒".tr)
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
            label.byText(@"逆时针走字\n分针 1/30 秒".tr)
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
        _clockwiseRotator =
            [[JobsImageRotator alloc] initWithTargetView:self.clockwiseMinuteHandContainerView
                                              direction:JobsImageRotationDirectionClockwise
                                               interval:JobsClockwiseMinuteHandInterval];
    };return _clockwiseRotator;
}

-(JobsImageRotator *)counterclockwiseRotator{
    if (!_counterclockwiseRotator) {
        _counterclockwiseRotator =
            [[JobsImageRotator alloc] initWithTargetView:self.counterclockwiseMinuteHandContainerView
                                              direction:JobsImageRotationDirectionCounterclockwise
                                               interval:JobsCounterclockwiseMinuteHandInterval];
    };return _counterclockwiseRotator;
}

-(JobsImageRotator *)clockwiseHourHandRotator{
    if (!_clockwiseHourHandRotator) {
        _clockwiseHourHandRotator =
            [[JobsImageRotator alloc] initWithTargetView:self.clockwiseHourHandContainerView
                                              direction:JobsImageRotationDirectionClockwise
                                               interval:JobsClockwiseMinuteHandInterval * JobsHourHandIntervalMultiplier];
    };return _clockwiseHourHandRotator;
}

-(JobsImageRotator *)counterclockwiseHourHandRotator{
    if (!_counterclockwiseHourHandRotator) {
        _counterclockwiseHourHandRotator =
            [[JobsImageRotator alloc] initWithTargetView:self.counterclockwiseHourHandContainerView
                                              direction:JobsImageRotationDirectionCounterclockwise
                                               interval:JobsCounterclockwiseMinuteHandInterval * JobsHourHandIntervalMultiplier];
    };return _counterclockwiseHourHandRotator;
}

@end
