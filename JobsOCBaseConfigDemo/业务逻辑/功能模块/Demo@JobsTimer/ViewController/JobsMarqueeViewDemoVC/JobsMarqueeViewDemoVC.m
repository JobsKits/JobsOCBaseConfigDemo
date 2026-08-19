//
//  JobsMarqueeViewDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月7日，星期二.
//

#import "JobsMarqueeViewDemoVC.h"

@interface JobsMarqueeViewDemoVC (){
    UIScrollView *_demoScrollView;
}

Prop_strong()UIView *contentView;
Prop_strong()JobsMarqueeView *leftContinuousMarquee;
Prop_strong()JobsMarqueeView *topFrequencyMarquee;
Prop_strong()JobsMarqueeView *bannerMarquee;
Prop_strong()JobsMarqueeView *rightContinuousMarquee;
Prop_strong()NSArray<JobsMarqueeView *> *marqueeArr;
Prop_strong()UILabel *tipLab;

-(UILabel *)sectionLabelWithTitle:(NSString *)title
                         topView:(UIView *)topView
                        topOffset:(CGFloat)topOffset;
-(NSArray<UIButton *> *)noticeButtonsWithPrefix:(NSString *)prefix
                                          color:(UIColor *)color
                                          count:(NSUInteger)count;
-(JobsRetNSArrayUIButtonByVoidBlock _Nonnull)bannerButtons;
-(UIButton *)demoButtonWithTitle:(NSString *)title
                        subTitle:(nullable NSString *)subTitle
                           color:(UIColor *)color
                             tag:(NSInteger)tag;
-(jobsByBtnBlock _Nonnull)demoButtonTapped;
-(jobsByVoidBlock _Nonnull)startAllMarquees;
-(jobsByVoidBlock _Nonnull)pauseAllMarquees;
-(jobsByVoidBlock _Nonnull)stopAllMarquees;

@end

@implementation JobsMarqueeViewDemoVC
-(void)dealloc{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeViewDemoVC.class, @selector(stopAllMarquees)))(self, @selector(stopAllMarquees)))();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeViewDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"JobsMarqueeView".jobsTr())
                    .byFont(UIFontWeightRegularSize(16))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeViewDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.scrollView.byVisible(YES);
        self.contentView.byVisible(YES);
        self.tipLab.byVisible(YES);
        self.leftContinuousMarquee.byVisible(YES);
        self.topFrequencyMarquee.byVisible(YES);
        self.bannerMarquee.byVisible(YES);
        self.rightContinuousMarquee.byVisible(YES);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeViewDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.startAllMarquees();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsMarqueeViewDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopAllMarquees();
    };
}
#pragma mark —— Actions
-(jobsByBtnBlock _Nonnull)demoButtonTapped{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        NSString *text = sender.currentTitle ?: @"JobsMarqueeView";
        [NSString stringWithFormat:@"%@%@", @"点击：".jobsTr(), text].toast();
    };
}

-(jobsByVoidBlock _Nonnull)startAllMarquees{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (JobsMarqueeView *view in self.marqueeArr) {
            view.start();
        }
    };
}

-(jobsByVoidBlock _Nonnull)pauseAllMarquees{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (JobsMarqueeView *view in self.marqueeArr) {
            view.pause();
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopAllMarquees{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        for (JobsMarqueeView *view in self.marqueeArr) {
            view.jobsStop();
        }
    };
}
#pragma mark —— Factories
-(UILabel *)sectionLabelWithTitle:(NSString *)title
                         topView:(UIView *)topView
                        topOffset:(CGFloat)topOffset{
    @jobs_weakify(self)
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        @jobs_strongify(self)
        label.byText(title.jobsTr())
            .byFont(UIFontWeightMediumSize(14))
            .byTextCor(JobsSecondaryLabelColor)
            .byNumberOfLines(1)
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(JobsWidth(16));
                make.right.equalTo(self.contentView).offset(-JobsWidth(16));
                if (topView) {
                    make.top.equalTo(topView.mas_bottom).offset(topOffset);
                }else{
                    make.top.equalTo(self.contentView).offset(topOffset);
                }
                make.height.mas_equalTo(JobsWidth(22));
            });
    });
}

-(NSArray<UIButton *> *)noticeButtonsWithPrefix:(NSString *)prefix
                                          color:(UIColor *)color
                                          count:(NSUInteger)count{
    NSMutableArray<UIButton *> *buttons = NSMutableArray.array;
    for (NSUInteger idx = 0; idx < count; idx++) {
        NSString *title = [NSString stringWithFormat:@"%@ · %@ %lu", prefix.jobsTr(), @"公告".jobsTr(), (unsigned long)idx + 1];
        NSString *subTitle = idx % 2 == 0 ? @"JobsOCTimerMgr 驱动".jobsTr() : @"按钮事件会被复制".jobsTr();
        [buttons addObject:[self demoButtonWithTitle:title
                                            subTitle:subTitle
                                               color:color
                                                 tag:idx]];
    };return buttons.copy;
}

-(JobsRetNSArrayUIButtonByVoidBlock _Nonnull)bannerButtons{
    @jobs_weakify(self)
    return ^NSArray<UIButton *> *{
        @jobs_strongify(self)
        if (!self) return nil;
        return @[
            [self demoButtonWithTitle:@"轮播图 · 活动一".jobsTr()
                             subTitle:@"fillBounds + PageControl".jobsTr()
                                color:HEXCOLOR(0x2F80ED)
                                  tag:100],
            [self demoButtonWithTitle:@"轮播图 · 活动二".jobsTr()
                             subTitle:@"支持手动拖拽后恢复".jobsTr()
                                color:HEXCOLOR(0x27AE60)
                                  tag:101],
            [self demoButtonWithTitle:@"轮播图 · 活动三".jobsTr()
                             subTitle:@"一屏一页间隔滚动".jobsTr()
                                color:HEXCOLOR(0x9B51E0)
                                  tag:102]
        ];
    };
}

-(UIButton *)demoButtonWithTitle:(NSString *)title
                        subTitle:(NSString *)subTitle
                           color:(UIColor *)color
                             tag:(NSInteger)tag{
    @jobs_weakify(self)
    return jobsMakeButton(^(__kindof UIButton * _Nullable button) {
        button
            .jobsResetBtnTitle(subTitle.length ? [NSString stringWithFormat:@"%@\n%@", title.jobsTr(), subTitle.jobsTr()] : title.jobsTr())
            .jobsResetBtnTitleCor(JobsWhiteColor)
            .jobsResetBtnTitleFont(subTitle.length ? UIFontWeightRegularSize(13) : UIFontWeightMediumSize(15))
            .jobsResetBtnBgCor(color)
            .jobsResetBtnCornerRadiusValue(JobsWidth(8))
            .byTitleLabel(^(__kindof UILabel * _Nullable label) {
                label
                    .byNumberOfLines(subTitle.length ? 2 : 1)
                    .byTextAlignment(NSTextAlignmentCenter);
            })
            .onClickBy(^(__kindof UIButton * _Nullable button) {
                weak_self.demoButtonTapped(button);
            })
            .byTag(tag);
    });
}
#pragma mark —— LazyLoad
-(UIScrollView *)scrollView{
    if (!_demoScrollView) {
        @jobs_weakify(self)
        _demoScrollView = jobsMakeScrollView(^(__kindof UIScrollView * _Nullable scrollView) {
            @jobs_strongify(self)
            scrollView.byShowsVerticalScrollIndicator(YES)
                .byAlwaysBounceVertical(YES)
                .byContentInsetAdjustmentBehavior(UIScrollViewContentInsetAdjustmentNever)
                .byBgColor(JobsClearColor)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.right.bottom.equalTo(self.view);
                    make.top.equalTo(self.gk_navigationBar.mas_bottom);
                });
        });
    };return _demoScrollView;
}

-(UIView *)contentView{
    if (!_contentView) {
        @jobs_weakify(self)
        _contentView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(JobsClearColor)
                .addOn(self.scrollView)
                .byAdd(^(MASConstraintMaker *make) {
                    @jobs_strongify(self)
                    make.edges.equalTo(self.scrollView);
                    make.width.equalTo(self.scrollView);
                });
        });
    };return _contentView;
}

-(UILabel *)tipLab{
    if (!_tipLab) {
        @jobs_weakify(self)
        _tipLab = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            @jobs_strongify(self)
            label.byText(@"跑马灯和轮播图共用 JobsMarqueeView；连续滚动看起来像公告流，fillBounds + interval 就是轮播图。".jobsTr())
                .byFont(UIFontWeightRegularSize(13))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(0)
                .byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(8))
                .addOn(self.contentView)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.contentView).offset(JobsWidth(16));
                    make.right.equalTo(self.contentView).offset(-JobsWidth(16));
                    make.top.equalTo(self.contentView).offset(JobsWidth(14));
                    make.height.mas_equalTo(JobsWidth(58));
                });
        });
    };return _tipLab;
}

-(JobsMarqueeView *)leftContinuousMarquee{
    if (!_leftContinuousMarquee) {
        UILabel *titleLab = [self sectionLabelWithTitle:@"横向连续跑马灯"
                                                topView:self.tipLab
                                              topOffset:JobsWidth(14)];
        _leftContinuousMarquee = (((JobsMarqueeView.alloc.init.byDirection(JobsMarqueeDirectionLeft)).byContinuousWithSpeed(42)).byItemSizeMode(JobsMarqueeItemSizeModeFitContent)).byDataSourceButtons([self noticeButtonsWithPrefix:@"向左连续"
                                                                               color:HEXCOLOR(0xF2994A)
                                                                               count:4]);
        _leftContinuousMarquee.byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(8))
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.contentView).offset(JobsWidth(16));
                make.right.equalTo(self.contentView).offset(-JobsWidth(16));
                make.top.equalTo(titleLab.mas_bottom).offset(JobsWidth(6));
                make.height.mas_equalTo(JobsWidth(50));
            });
    };return _leftContinuousMarquee;
}

-(JobsMarqueeView *)topFrequencyMarquee{
    if (!_topFrequencyMarquee) {
        UILabel *titleLab = [self sectionLabelWithTitle:@"纵向间隔公告"
                                                topView:self.leftContinuousMarquee
                                              topOffset:JobsWidth(16)];
        _topFrequencyMarquee = (((JobsMarqueeView.alloc.init.byDirection(JobsMarqueeDirectionTop)).byFrequencyWithInterval(1.2)).byItemSizeMode(JobsMarqueeItemSizeModeFillBounds)).byDataSourceButtons([self noticeButtonsWithPrefix:@"向上翻页"
                                                                             color:HEXCOLOR(0x56CCF2)
                                                                             count:3]);
        _topFrequencyMarquee.byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(8))
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.height.equalTo(self.leftContinuousMarquee);
                make.top.equalTo(titleLab.mas_bottom).offset(JobsWidth(6));
            });
    };return _topFrequencyMarquee;
}

-(JobsMarqueeView *)bannerMarquee{
    if (!_bannerMarquee) {
        UILabel *titleLab = [self sectionLabelWithTitle:@"轮播图"
                                                topView:self.topFrequencyMarquee
                                              topOffset:JobsWidth(16)];
        _bannerMarquee = (((((JobsMarqueeView.alloc.init.byDirection(JobsMarqueeDirectionLeft)).byFrequencyWithInterval(2.0)).byItemSizeMode(JobsMarqueeItemSizeModeFillBounds)).byManualScrollEnabled(YES)).byPageControlEnabled(YES)).byDataSourceButtons(self.bannerButtons());
        _bannerMarquee.byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(10))
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.equalTo(self.leftContinuousMarquee);
                make.top.equalTo(titleLab.mas_bottom).offset(JobsWidth(6));
                make.height.mas_equalTo(JobsWidth(118));
            });
    };return _bannerMarquee;
}

-(JobsMarqueeView *)rightContinuousMarquee{
    if (!_rightContinuousMarquee) {
        UILabel *titleLab = [self sectionLabelWithTitle:@"反向连续跑马灯"
                                                topView:self.bannerMarquee
                                              topOffset:JobsWidth(16)];
        _rightContinuousMarquee = (((JobsMarqueeView.alloc.init.byDirection(JobsMarqueeDirectionRight)).byContinuousWithSpeed(36)).byItemSizeMode(JobsMarqueeItemSizeModeFitContent)).byDataSourceButtons([self noticeButtonsWithPrefix:@"向右连续"
                                                                                color:HEXCOLOR(0xEB5757)
                                                                                count:4]);
        _rightContinuousMarquee.byBgColor(JobsSecondarySystemBackgroundColor)
            .byCornerRadius(JobsWidth(8))
            .addOn(self.contentView)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.right.height.equalTo(self.leftContinuousMarquee);
                make.top.equalTo(titleLab.mas_bottom).offset(JobsWidth(6));
                make.bottom.equalTo(self.contentView).offset(-JobsWidth(22));
            });
    };return _rightContinuousMarquee;
}

-(NSArray<JobsMarqueeView *> *)marqueeArr{
    if (!_marqueeArr) {
        _marqueeArr = @[
            self.leftContinuousMarquee,
            self.topFrequencyMarquee,
            self.bannerMarquee,
            self.rightContinuousMarquee
        ];
    };return _marqueeArr;
}

@end
