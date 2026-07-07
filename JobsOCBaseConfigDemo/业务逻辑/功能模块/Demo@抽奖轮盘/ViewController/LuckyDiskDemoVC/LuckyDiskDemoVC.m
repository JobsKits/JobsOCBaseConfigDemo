//
//  LuckyDiskDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "LuckyDiskDemoVC.h"

@interface LuckyDiskDemoVC ()

Prop_strong() NSURL *videoURL;
Prop_strong() NSString *result;
Prop_strong() __kindof NSArray *itemTitleArray;      //< 奖品标题数组（懒加载）
Prop_strong() UIImageView *rotaryTable;
              //< 顶部灯光背景图（懒加载）
Prop_strong() UIView *itemBorderView;
                //< 高亮边框（懒加载）
Prop_strong() NSTimer *itemBorderTimer;
Prop_strong() NSTimer *fastTimer;
Prop_strong() NSTimer *slowTimer;
Prop_assign() NSInteger fastIndex;
Prop_assign() NSInteger slowIndex;
Prop_assign() NSInteger selectedIndex;
Prop_strong() UIButton *startButton;
                 //< 开始抽奖按钮（懒加载）
Prop_strong() UILabel *startLabel;
                   //< 按钮内部文字（懒加载）
Prop_strong() UIView *lotteryResultView;
             //< 抽奖结果弹窗（懒加载）
Prop_strong() UIView *lotteryResultBgView;
           //< 弹窗背景遮罩（懒加载）
Prop_strong() UILabel *resultLabel;
                  //< 弹窗中奖结果文案（懒加载）

@end

@implementation LuckyDiskDemoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    /// 容器 ScrollView
    UIScrollView *scrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
        scrollView
            .byBounces(NO)
            .byShowsVerticalScrollIndicator(NO)
            .byShowsHorizontalScrollIndicator(NO)
            .byContentSize(CGSizeMake(JobsMainScreen_WIDTH(), ScaleW(810)))
            .byFrame(CGRectMake(0,
                                JobsMainScreen_HEIGHT() > 800 ? -44 : -20,
                                JobsMainScreen_WIDTH(),
                                JobsMainScreen_HEIGHT() + (JobsMainScreen_HEIGHT() > 800 ? 44 : 20)))
            .addOn(self.view);
    });
    /// 背景图
    UIImageView *bgImageView =
    [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT() )];
    bgImageView.image = @"LuckDraw_bg".img;
    [scrollView addSubview:bgImageView];
    /// 顶部灯光转盘背景（懒加载 + alpha 唤起）
    [scrollView addSubview:self.rotaryTable];
    self.rotaryTable.frame = CGRectMake((JobsMainScreen_WIDTH() - ScaleW(366)) / 2.0,
                                        ScaleW(218),
                                        ScaleW(366),
                                        ScaleW(318));
    self.rotaryTable.byAlpha(1.0f);
    /// 灯光闪烁定时器
    self.itemBorderTimer =
    [NSTimer scheduledTimerWithTimeInterval:0.5
                                     target:self
                                   selector:@selector(itemBorderTimerEvent)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.itemBorderTimer
                                 forMode:NSRunLoopCommonModes];

    /// 奖品网格区域
    UIView *itemView =
    [[UIView alloc] initWithFrame:CGRectMake(ScaleW(25),
                                             ScaleW(225),
                                             JobsMainScreen_WIDTH() - ScaleW(50),
                                             ScaleW(248))];
    [scrollView addSubview:itemView];

    NSArray *itemImgArray =
    @[@"LuckDraw_1",@"LuckDraw_2",@"LuckDraw_3",@"LuckDraw_4",
      @"LuckDraw_10",@"LuckDraw_5",@"LuckDraw_9",@"LuckDraw_8",
      @"LuckDraw_7",@"LuckDraw_6"];

    // 上排 4 个
    for (int i = 0; i < 4; i++) {
        UIImageView *img =
        [[UIImageView alloc] initWithFrame:CGRectMake(i * ScaleW(82),
                                                      0,
                                                      ScaleW(78),
                                                      ScaleW(80))];
        img.image = ((NSString *)itemImgArray[i]).img;
        [itemView addSubview:img];

        UILabel *label =
        [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                  ScaleW(63),
                                                  ScaleW(78),
                                                  ScaleW(13))];
        label.byTextAlignment(NSTextAlignmentCenter);
        label.byTextCor([UIColor whiteColor]);
        label.byFont([UIFont systemFontOfSize:ScaleW(13)]);
        label.byText(self.itemTitleArray[i]);
        [img addSubview:label];
    }
    // 中间 2 个
    for (int i = 0; i < 2; i++) {
        UIImageView *img =
        [[UIImageView alloc] initWithFrame:CGRectMake(i * (ScaleW(78) + ScaleW(169)),
                                                      ScaleW(84),
                                                      ScaleW(78),
                                                      ScaleW(80))];
        img.image = ((NSString *)itemImgArray[i + 4]).img;
        [itemView addSubview:img];

        UILabel *label =
        [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                  ScaleW(63),
                                                  ScaleW(78),
                                                  ScaleW(13))];
        label.byTextAlignment(NSTextAlignmentCenter);
        label.byTextCor([UIColor whiteColor]);
        label.byFont([UIFont systemFontOfSize:ScaleW(13)]);
        label.byText(self.itemTitleArray[i + 4]);
        [img addSubview:label];
    }
    // 下排 4 个
    for (int i = 0; i < 4; i++) {
        UIImageView *img =
        [[UIImageView alloc] initWithFrame:CGRectMake(i * ScaleW(82),
                                                      ScaleW(168),
                                                      ScaleW(78),
                                                      ScaleW(80))];
        img.image = ((NSString *)itemImgArray[i + 6]).img;
        [itemView addSubview:img];

        UILabel *label =
        [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                  ScaleW(63),
                                                  ScaleW(78),
                                                  ScaleW(13))];
        label.byTextAlignment(NSTextAlignmentCenter);
        label.byTextCor([UIColor whiteColor]);
        label.byFont([UIFont systemFontOfSize:ScaleW(13)]);
        label.byText(self.itemTitleArray[i + 6]);
        [img addSubview:label];
    }
    // 高亮边框（懒加载：初始 alpha = 0）
    [itemView addSubview:self.itemBorderView];
    self.itemBorderView.frame = CGRectMake(ScaleW(-1),
                                           ScaleW(-1),
                                           ScaleW(80),
                                           ScaleW(82));
    // 开始抽奖按钮（懒加载）
    [itemView addSubview:self.startButton];
    self.startButton.frame = CGRectMake(ScaleW(82.5),
                                        ScaleW(93.5),
                                        ScaleW(160),
                                        ScaleW(60.5));
    [self.startButton setBackgroundImage:@"LuckDraw_button".img
                                forState:UIControlStateNormal];

    [self.startButton addTarget:self
                         action:@selector(startButtonEvent:)
               forControlEvents:UIControlEventTouchUpInside];
    self.startButton.byAlpha(1.0f);
    // 按钮内标题（懒加载）
    [self.startButton addSubview:self.startLabel];
    self.startLabel.frame = CGRectMake(ScaleW(56),
                                       ScaleW(22),
                                       ScaleW(82),
                                       ScaleW(15));
    self.startLabel.byFont([UIFont systemFontOfSize:ScaleW(15)]);
    self.startLabel.byTextCor(RGB_COLOR(65, 155, 9));
    self.startLabel.byText(@"开始抽奖");
    self.startLabel.byAlpha(1.0f);
}

#pragma mark —— 抽奖逻辑

- (void)getLotteryInfo {
    self.fastIndex = 0;
    self.slowIndex = -1;
    self.selectedIndex = arc4random() % 10;

    if (self.selectedIndex < 4) {
        self.result = self.itemTitleArray[self.selectedIndex];
    } else if (self.selectedIndex == 4) {
        self.result = @"2018跳币";
    } else if (self.selectedIndex == 5) {
        self.result = @"88跳币";
    } else if (self.selectedIndex == 6) {
        self.result = @"28朵花";
    } else if (self.selectedIndex == 7) {
        self.result = @"128跳币";
    } else if (self.selectedIndex == 8) {
        self.result = @"528跳币";
    } else if (self.selectedIndex == 9) {
        self.result = @"128朵花";
    }
    // 显示高亮边框（alpha 唤起）
    self.itemBorderView.byAlpha(1.0f);
    self.fastTimer =
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(fastTimerEvent)
                                   userInfo:nil
                                    repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.fastTimer
                                 forMode:NSRunLoopCommonModes];
}

- (void)startButtonEvent:(UIButton *)sender {
    self.startButton.userInteractionEnabled = NO;
    [self getLotteryInfo];
}
#pragma mark —— 边框灯光动画
- (void)itemBorderTimerEvent {
    if (self.rotaryTable.tag == 100) {
        self.rotaryTable.tag = 101;
        self.rotaryTable.image = @"bg_lamp_2".img;
    } else if (self.rotaryTable.tag == 101) {
        self.rotaryTable.tag = 100;
        self.rotaryTable.image = @"bg_lamp_1".img;
    }
}
#pragma mark —— 快速移动动画
- (void)fastTimerEvent {
    self.fastIndex = self.fastIndex + 1;

    NSInteger idx = self.fastIndex % 10;
    if (idx == 0) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 1) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 2) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(2 * 82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 3) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 4) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 5) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 6) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(2 * 82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 7) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 8) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 9) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    }

    if (self.fastIndex >= 29) {
        [self.fastTimer invalidate];
        self.fastTimer = nil;
        self.slowTimer =
        [NSTimer scheduledTimerWithTimeInterval:0.45
                                         target:self
                                       selector:@selector(slowTimerEvent)
                                       userInfo:nil
                                        repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.slowTimer
                                     forMode:NSRunLoopCommonModes];
    }
}
#pragma mark —— 慢速移动动画
- (void)slowTimerEvent {
    self.slowIndex = self.slowIndex + 1;
    NSInteger idx = self.slowIndex % 10;
    if (idx == 0) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 1) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 2) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(2 * 82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 3) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(-1), ScaleW(80), ScaleW(82)));
    } else if (idx == 4) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 5) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(3 * 82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 6) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(2 * 82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 7) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(82) - ScaleW(1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 8) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(2 * 84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    } else if (idx == 9) {
        self.itemBorderView.byFrame(CGRectMake(ScaleW(-1), ScaleW(84) - ScaleW(1), ScaleW(80), ScaleW(82)));
    }

    if (self.slowIndex >= self.selectedIndex) {
        [self.slowTimer invalidate];
        self.slowTimer = nil;
        dispatch_time_t delayTime =
        dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC));
        dispatch_after(delayTime, dispatch_get_main_queue(), ^{
            self.startButton.userInteractionEnabled = YES;
            [self showLotteryResultView];
        });
    }
}
#pragma mark —— 结果弹窗
- (void)showLotteryResultView {
    // 触发懒加载
    (void)self.lotteryResultBgView;
    (void)self.lotteryResultView;
    self.lotteryResultBgView.byAlpha(1.0f);
    self.lotteryResultBgView.byBgColor([UIColor clearColor]);
    self.lotteryResultView.byAlpha(1.0f);
    self.lotteryResultView.frame = CGRectMake(ScaleW(25),
                                              JobsMainScreen_HEIGHT(),
                                              ScaleW(325),
                                              ScaleW(386));
    // 更新中奖文案
    self.resultLabel.byText([NSString stringWithFormat:@"恭喜您获得%@!", self.result]);
    [UIView animateWithDuration:0.3 animations:^{
        self.lotteryResultView.frame = CGRectMake(ScaleW(25),
                                                  ScaleW(130),
                                                  ScaleW(325),
                                                  ScaleW(386));
        self.lotteryResultBgView.backgroundColor =
        [UIColor colorWithRed:0/255.0f
                        green:0/255.0f
                         blue:0/255.0f
                        alpha:0.7];
    }];
}

- (void)closeButtonEvent:(UIButton *)sender {
    [UIView animateWithDuration:0.2 animations:^{
        self.lotteryResultView.byAlpha(0.0f);

        self.lotteryResultBgView.byAlpha(0.0f);

    }];
}
#pragma mark —— 懒加载属性
- (__kindof NSArray *)itemTitleArray {
    if (!_itemTitleArray) {
        _itemTitleArray = jobsMakeMutArr(^(__kindof NSMutableArray<NSObject *> * _Nullable arr) {
            arr.add(@"3跳币")
                .add(@"嘉年华门票")
                .add(@"8跳币")
                .add(@"10朵花")
                .add(@"128朵花")
                .add(@"2018跳币")
                .add(@"528跳币")
                .add(@"128跳币")
                .add(@"28朵花")
                .add(@"88跳币");
        });
    };return _itemTitleArray;
}

- (UIImageView *)rotaryTable {
    if (!_rotaryTable) {
        _rotaryTable = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"bg_lamp_1".img)
                .byTag(100)
                .byAlpha(0.0f);   // 初始不显示，外部用 alpha = 1 唤起
        });
    };return _rotaryTable;
}

- (UIView *)itemBorderView {
    if (!_itemBorderView) {
        _itemBorderView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byAlpha(0.0f) // 初始隐藏
                .byLayer(^(CALayer *layer) {
                    layer
                        .byBorderColor(RGB_COLOR(247, 227, 2).CGColor)
                        .byBorderWidth(ScaleW(2));
                })
                .byCornerRadius(ScaleW(12));
        });
    };return _itemBorderView;
}

- (UIButton *)startButton {
    if (!_startButton) {
        _startButton =  UIButton.jobsInit().byAlpha(0.0f);
    };return _startButton;
}

- (UILabel *)startLabel {
    if (!_startLabel) {
        _startLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byAlpha(0.0f);
        });
    };return _startLabel;
}

- (UIView *)lotteryResultBgView {
    if (!_lotteryResultBgView) {
        _lotteryResultBgView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(0, 0, JobsMainScreen_WIDTH(), JobsMainScreen_HEIGHT()))
                .byBgColor(UIColor.clearColor)
                .byAlpha(0.0f)
                .addOn(self.view);
        });
    };return _lotteryResultBgView;
}

- (UIView *)lotteryResultView {
    if (!_lotteryResultView) {
        _lotteryResultView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byFrame(CGRectMake(ScaleW(25),
                                    JobsMainScreen_HEIGHT(),
                                    ScaleW(325),
                                    ScaleW(386)))
                .byAlpha(0.0f)
                .addOn(self.view);
        });
        // 关闭按钮
        UIButton *close =
        [[UIButton alloc] initWithFrame:CGRectMake(ScaleW(145),
                                                   0,
                                                   ScaleW(35),
                                                   ScaleW(35))];
        [close setImage:@"pop_video_close".img
                forState:UIControlStateNormal];
        [close addTarget:self
                 action:@selector(closeButtonEvent:)
       forControlEvents:UIControlEventTouchUpInside];
        [_lotteryResultView addSubview:close];
        // 弹窗背景图
        UIImageView *imageView =
        [[UIImageView alloc] initWithFrame:CGRectMake(0,
                                                      ScaleW(45),
                                                      ScaleW(325),
                                                      ScaleW(341))];
        imageView.image = @"bg_video".img;
        [_lotteryResultView addSubview:imageView];
        // 中奖结果文案（懒加载）
        if (!self.resultLabel) {
            self.resultLabel =
            [[UILabel alloc] initWithFrame:CGRectMake(0,
                                                      ScaleW(200),
                                                      ScaleW(325),
                                                      ScaleW(18))];
            self.resultLabel.font =
            [UIFont systemFontOfSize:ScaleW(18) weight:ScaleW(1.5)];
            self.resultLabel.byTextAlignment(NSTextAlignmentCenter);

            self.resultLabel.byTextCor(RGB_COLOR(243, 246, 25));

            [_lotteryResultView addSubview:self.resultLabel];
        }
    };return _lotteryResultView;
}

@end
