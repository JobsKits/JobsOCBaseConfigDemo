//
//  JobsTimerVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsTimerVC.h"

@interface JobsTimerVC ()
/// UI
Prop_strong()UILabel *countUpTitleLab;
Prop_strong()JobsCountdownView *countdownView;
Prop_strong()NSMutableArray <UIButton *>*btnMutArr;
Prop_strong()UILabel *countUpStatusLab;
Prop_strong()UITextView *tipsTextView;
/// Data
Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;
Prop_strong()NSArray <UIColor *>*btnBgCorArr;
Prop_assign()BOOL countUpTimerHasStarted;

-(void)layoutTimerControlButtons;
-(void)startCountUpTimer;
-(void)pauseCountUpTimer;
-(void)restartCountUpTimer;
-(void)stopCountUpTimer;
-(void)updateTimerStatusText:(NSString *)text;
-(void)showCountUpToastByTime:(CGFloat)time;
-(NSAttributedString *)normalTipAttributedStringWithText:(NSString *)text
                                                    font:(UIFont *)font
                                               textColor:(UIColor *)textColor;

@end

@implementation JobsTimerVC

- (void)dealloc{
    /// 定时器完全移除以后，才会走dealloc方法
    JobsLog(@"%@",JobsLocalFunc);
    [_countdownView.timer stop];
//    JobsRemoveNotification(self);
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
            data.byText(@"正计时".tr)
                .byFont(UIFontWeightRegularSize(16))
                .byTextCor(HEXCOLOR(0x3D4A58));
        })
    
        // 使用原则：底图有 + 底色有 = 优先使用底图数据
        // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
        // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
        .byBgCor(RGBA_COLOR(255, 238, 221, 1))
        //    self.viewModel.bgImage = @"启动页SLOGAN".img;
        .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
        .byNavBgImage(@"导航栏左侧底图".img);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.byBgColor(HEXCOLOR(0xF3F6FA));

    self.makeNavByAlpha(1);
    self.countUpTitleLab.byVisible(YES);
    self.countdownView.byVisible(YES);
    [self layoutTimerControlButtons];
    self.countUpStatusLab.byVisible(YES);
    self.tipsTextView.byVisible(YES);
    [self updateTimerControlButtons];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self updateTimerControlButtons];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.countdownView.timer stop];
    self.countUpTimerHasStarted = NO;
    [self.countdownView refreshData];
    [self updateTimerControlButtons];
}
#pragma mark —— 一些私有方法
-(void)layoutTimerControlButtons {
    /// 实现masonry水平固定间隔方法
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:JobsWidth(10)
                                     leadSpacing:JobsWidth(20)
                                     tailSpacing:JobsWidth(20)];
    /// 设置array的垂直方向的约束
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.countdownView.mas_bottom).offset(JobsWidth(12));
        make.height.mas_equalTo(JobsWidth(36));
    }];
}
/// Timer UI 状态同步
-(void)updateTimerControlButtons {
    id<TimerProtocol> timer = self.countdownView.timer;
    if (!timer || self.btnMutArr.count < 4) return;

    UIButton *startBtn  = self.btnMutArr[0];
    UIButton *pauseBtn  = self.btnMutArr[1];
    UIButton *restartBtn = self.btnMutArr[2];
    UIButton *stopBtn   = self.btnMutArr[3];

    BOOL isRunning = timer.isRunning;
    BOOL isPaused  = timer.isPaused;
    BOOL canStart = !isRunning && !isPaused;
    BOOL canPause = isRunning;
    BOOL canRestart = self.countUpTimerHasStarted;
    BOOL canStop = isRunning || isPaused;

    startBtn.userInteractionEnabled = canStart;
    pauseBtn.userInteractionEnabled = canPause;
    restartBtn.userInteractionEnabled = canRestart;
    stopBtn.userInteractionEnabled = canStop;

    startBtn.byAlpha(canStart ? 1.0 : 0.42);
    pauseBtn.byAlpha(canPause ? 1.0 : 0.42);
    restartBtn.byAlpha(canRestart ? 1.0 : 0.42);
    stopBtn.byAlpha(canStop ? 1.0 : 0.42);
}

-(void)startCountUpTimer{
    self.countUpTimerHasStarted = YES;
    [self.countdownView refreshData];
    [self.countdownView.timer start];
    [self updateTimerStatusText:@"正计时已开始".tr];
}

-(void)pauseCountUpTimer{
    [self.countdownView.timer pause];
    [self updateTimerStatusText:@"正计时已暂停，可重启或结束".tr];
}

-(void)restartCountUpTimer{
    self.countUpTimerHasStarted = YES;
    [self.countdownView.timer stop];
    [self.countdownView refreshData];
    [self.countdownView.timer start];
    [self updateTimerStatusText:@"正计时已重启，从 00:00 重新开始".tr];
}

-(void)stopCountUpTimer{
    self.countUpTimerHasStarted = NO;
    [self.countdownView.timer stop];
    [self.countdownView refreshData];
    [self updateTimerStatusText:@"正计时已结束，等待手动开始".tr];
}

-(void)updateTimerStatusText:(NSString *)text{
    self.countUpStatusLab.byText(text);
}

-(void)showCountUpToastByTime:(CGFloat)time{
    NSInteger seconds = MAX(0, (NSInteger)time);
    [NSString stringWithFormat:@"%ld%@",(long)seconds, @"秒到了，我被打印出来了！".tr].toast();
}

-(NSAttributedString *)normalTipAttributedStringWithText:(NSString *)text
                                                    font:(UIFont *)font
                                               textColor:(UIColor *)textColor{
    NSMutableParagraphStyle *paragraphStyle = NSMutableParagraphStyle.new;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    paragraphStyle.lineSpacing = JobsWidth(4);
    paragraphStyle.paragraphSpacing = 0;
    return [NSAttributedString.alloc initWithString:text ?: JobsEmpty
                                         attributes:@{
        NSFontAttributeName: font,
        NSForegroundColorAttributeName: textColor,
        NSKernAttributeName: @(0),
        NSParagraphStyleAttributeName: paragraphStyle
    }];
}
#pragma mark —— lazyLoad
-(UILabel *)countUpTitleLab{
    if (!_countUpTitleLab) {
        @jobs_weakify(self)
        _countUpTitleLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"正计时".tr)
                .byFont(UIFontWeightSemiboldSize(18))
                .byTextCor(HEXCOLOR(0x243447))
                .byTextAlignment(NSTextAlignmentLeft)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(24));
                });
        });
    };return _countUpTitleLab;
}

-(NSMutableArray<__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        @jobs_weakify(self)
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>*_Nullable data) {
            @jobs_strongify(self)
            for (NSUInteger idx = 0; idx < self.btnTitleMutArr.count; idx++) {
                UIButton *btn = UIButton.jobsInit()
                    .jobsResetBtnTitle(self.btnTitleMutArr[idx])
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightMediumSize(14))
                    .jobsResetBtnBgCor(self.btnBgCorArr[idx])
                    .jobsResetBtnCornerRadiusValue(JobsWidth(18))
                    .onClickBy(^(UIButton *btn){
                        @jobs_strongify(self)
                        if (btn.tag == 0) {
                            [self startCountUpTimer];
                        }else if (btn.tag == 1){
                            [self pauseCountUpTimer];
                        }else if (btn.tag == 2){
                            [self restartCountUpTimer];
                        }else{
                            [self stopCountUpTimer];
                        }
                        [self updateTimerControlButtons];
                    }).onLongPressGestureBy(^(id data){
                        JobsLog(@"");
                    })
                    .jobsResetBtnLayerBorderCor(JobsClearColor)
                    .jobsResetBtnLayerBorderWidth(0);
                btn.tag = idx;
                btn.addOn(self.view);
                data.add(btn);
            }
        });
    };return _btnMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data.add(@"开始".tr)
            .add(@"暂停".tr)
            .add(@"重启".tr)
            .add(@"结束".tr);
        });
    };return _btnTitleMutArr;
}

-(NSArray<UIColor *> *)btnBgCorArr{
    if (!_btnBgCorArr) {
        _btnBgCorArr = @[
            HEXCOLOR(0x2F80ED),
            HEXCOLOR(0xF2994A),
            HEXCOLOR(0x27AE60),
            HEXCOLOR(0xEB5757)
        ];
    };return _btnBgCorArr;
}

/// 内含定时器
-(JobsCountdownView *)countdownView{
    if (!_countdownView) {
        @jobs_weakify(self)
        _countdownView = JobsCountdownView.new;
        _countdownView.byCornerRadius(JobsWidth(16));
        _countdownView.objBlock = ^(id _Nullable data) {
            @jobs_strongify(self)
            if ([data isKindOfClass:NSNumber.class]) {
                [self showCountUpToastByTime:[data doubleValue]];
            }
        };
        _countdownView.jobsRichViewByModel(nil);
        _countdownView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view);
            make.top.equalTo(self.countUpTitleLab.mas_bottom).offset(JobsWidth(10));
            make.size.mas_equalTo(JobsCountdownView.viewSizeByModel(nil));
        });
    };return _countdownView;
}

-(UILabel *)countUpStatusLab{
    if (!_countUpStatusLab) {
        @jobs_weakify(self)
        _countUpStatusLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            UIButton *firstBtn = self.btnMutArr.firstObject;
            label.byText(@"请点击“开始”，正计时不会自动启动".tr)
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(HEXCOLOR(0x5F6B7A))
                .byTextAlignment(NSTextAlignmentCenter)
                .byNumberOfLines(2)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.top.equalTo(firstBtn.mas_bottom).offset(JobsWidth(10));
                });
        });
    };return _countUpStatusLab;
}

-(UITextView *)tipsTextView{
    if (!_tipsTextView) {
        @jobs_weakify(self)
        _tipsTextView = jobsMakeTextView(^(__kindof UITextView * _Nullable textView) {
            @jobs_strongify(self)
            UIFont *font = UIFontWeightRegularSize(13);
            UIColor *textColor = HEXCOLOR(0x5F6B7A);
            textView.byAttributedText([self normalTipAttributedStringWithText:@"这个 Demo 只展示 JobsTimer 正计时控制：点击“开始”后才进入正计时，每一秒 tick 都会显示 toast；可以手动暂停、重启和结束。倒计时按钮请进入独立的“倒计时按钮”Demo。".tr
                                                                         font:font
                                                                    textColor:textColor])
                .byTextAlignment(NSTextAlignmentLeft)
                .byEditable(NO)
                .bySelectable(NO)
                .byTextContainerInset(UIEdgeInsetsMake(JobsWidth(12), JobsWidth(12), JobsWidth(12), JobsWidth(12)))
                .byLineFragmentPadding(0)
                .byBgColor(JobsWhiteColor)
                .byCornerRadius(JobsWidth(10))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(20));
                    make.right.equalTo(self.view).offset(-JobsWidth(20));
                    make.top.equalTo(self.countUpStatusLab.mas_bottom).offset(JobsWidth(18));
                    make.height.mas_equalTo(JobsWidth(128));
                });
        });
    };return _tipsTextView;
}

@end
