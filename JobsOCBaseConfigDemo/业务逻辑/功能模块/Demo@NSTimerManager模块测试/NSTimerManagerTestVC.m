//
//  NSTimerManagerTestVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "NSTimerManagerTestVC.h"

@interface NSTimerManagerTestVC ()
/// UI
Prop_strong()UILabel *valueLab;
Prop_strong()NSMutableArray <__kindof UIButton *>*btnMutArr;
/// Data
Prop_strong()JobsTimer *timer;
Prop_strong()NSMutableArray <NSString *>*btnTitleMutArr;
// SEL是不可以保存到array数组中去的

@end

@implementation NSTimerManagerTestVC

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"NSTimerManager模块测试".tr);
        })
        //        self.viewModel.textModel.text = self.viewModel.textModel.attributedTitle.string;
        .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
            data.byFont(UIFontWeightRegularSize(16));
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
    
    self.makeNavByAlpha(1);
    
    [self test_masonry_horizontal_fixSpace];
    self.valueLab.byAlpha(1);

    
    @jobs_weakify(self)
    /// 开始
    ((UIButton *)self.btnMutArr[0]).onClickBy(^(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer start];
    });
    /// 暂停
    ((UIButton *)self.btnMutArr[1]).onClickBy(^(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer pause];
    });
    /// 继续
    ((UIButton *)self.btnMutArr[2]).onClickBy(^(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer resume];
    });
    /// 结束
    ((UIButton *)self.btnMutArr[3]).onClickBy(^(UIButton *data) {
        @jobs_strongify(self)
        [self reloadBtn:data];
        [self.timer stop];
        self.valueLab.byText(@"".tr);
    });
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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
}
#pragma mark —— 一些私有方法
-(void)reloadBtn:(UIButton *)button{
    for (UIButton *btn in self.btnMutArr) {
        btn.selected = NO;
    }button.selected = !button.selected;
}

-(void)test_masonry_horizontal_fixSpace {
    /// 实现masonry水平固定间隔方法
    [self.btnMutArr mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                withFixedSpacing:30
                                     leadSpacing:10
                                     tailSpacing:10];
    /// 设置array的垂直方向的约束
    [self.btnMutArr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(10));
        make.height.mas_equalTo(JobsWidth(30));
    }];
}
#pragma mark —— LazyLoad
-(JobsTimer *)timer{
    if (!_timer) {
        @jobs_weakify(self)
        _timer = jobsMakeTimer(^(JobsTimer * _Nullable timer) {
            timer
                /// 必须配置的项
                .byTimerType(JobsTimerTypeNSTimer)
                /// 计时器核心选择
                .byTimerStyle(TimerStyle_anticlockwise)
                /// 正计时模式
                .byTimeInterval(1)
                /// 跳动步长（频率间距）
                .byStartTime(10)
                /// ✅ 总时长
                .byTimeSecIntervalSinceDate(3)
                /// dispatch_after 延迟（这里等价 0）
                .byQueue(dispatch_get_main_queue())
                .byOnTick(^(CGFloat time){
                    @jobs_strongify(self)
                    JobsLog(@"正在倒计时...");
                    self.valueLab.byText([NSString stringWithFormat:@"%f",time]);
                    if (self.objBlock) self.objBlock(timer);
                })
                .byOnFinish(^(__kindof JobsTimer * _Nullable t){
                    @jobs_strongify(self)
                    JobsLog(@"倒计时结束...");
                    if (self.objBlock) self.objBlock(timer);
                });
            /// 这些是内部状态初始化，不暴露成 DSL 也可以
            timer.accumulatedElapsed = 0;   // 已经流逝的时间（总 elapsed，单位秒）
            timer.lastStartDate      = nil; // 最近一次 start/resume 的时间点（支持 pause/resume）
        });
    };return _timer;
}

-(UILabel *)valueLab{
    if (!_valueLab) {
        @jobs_weakify(self)
        _valueLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label
                .makeLabelByShowingType(UILabelShowingType_03)
                .byBgColor(HEXCOLOR(0xAE8330))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.height.mas_equalTo(JobsWidth(20));
                    make.center.equalTo(self.view);
                });
        });
    };return _valueLab;
}

-(NSMutableArray <__kindof UIButton *>*)btnMutArr{
    if (!_btnMutArr) {
        @jobs_weakify(self)
        _btnMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <__kindof UIButton *>* _Nullable data) {
            @jobs_strongify(self)
            for (NSString *title in self.btnTitleMutArr) {
                data.add(UIButton.jobsInit()
                         .jobsResetBtnTitle(title)
                         .jobsResetBtnTitleCor(JobsBlackColor)
                         .jobsResetBtnBgImage(@"弹窗取消按钮背景图".img)
                         .selectedStateBackgroundImageBy(@"弹窗取消按钮背景图".img)
                         .cornerCutToCircleWithCornerRadius(JobsWidth(8))
                         .setLayerBy(jobsMakeLocationModel(^(__kindof JobsLocationModel * _Nullable data) {
                             data
                                 .byLayerCor(HEXCOLOR(0xAE8330))
                                 .byJobsWidth(0.5f);
                         }))
                         .addOn(self.view));
            }
        });
    };return _btnMutArr;
}

-(NSMutableArray<NSString *> *)btnTitleMutArr{
    if (!_btnTitleMutArr) {
        _btnTitleMutArr = jobsMakeMutArr(^(__kindof NSMutableArray <NSString *>*_Nullable data) {
            data
                .add(@"开始".tr)
                .add(@"暂停".tr)
                .add(@"继续".tr)
                .add(@"结束".tr);
        });
    };return _btnTitleMutArr;
}

@end
