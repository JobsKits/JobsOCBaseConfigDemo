//
//  UILabelScrollingDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年7月17日，星期五.
//

#import "UILabelScrollingDemoVC.h"

@interface UILabelScrollingDemoVC ()

Prop_strong()UILabel *continuousLabel;
Prop_strong()UILabel *pingPongLabel;
Prop_strong()UILabel *shortLabel;
Prop_strong()NSArray<UIButton *> *controlButtons;
Prop_assign(getter=isPaused)BOOL paused;
Prop_assign()BOOL usesAlternativeCopy;

-(JobsRetUILabelScrollingDemoVCByBOOLBlock _Nonnull)byPaused;
-(jobsByVoidBlock _Nonnull)buildInterface;
-(UILabel *)sectionLabelWithText:(NSString *)text
                         topView:(UIView *)topView
                       topOffset:(CGFloat)topOffset;
-(JobsRetViewByViewBlock _Nonnull)cardBelowView;
-(JobsRetNSAttributedStringByBOOLBlock _Nonnull)pingPongAttributedTextWithAlternative;
-(jobsByVoidBlock _Nonnull)startLabels;
-(jobsByVoidBlock _Nonnull)stopLabels;
-(jobsByBtnBlock _Nonnull)controlButtonTapped;
-(jobsByVoidBlock _Nonnull)switchCopy;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN UILabelScrollingDemoVC
@interface UILabelScrollingDemoVC (JobsPropertyDSLSetterAutogen_883f79b8f0)
-(void)setControlButtons:(NSArray<UIButton *> * _Nullable)data;
-(void)setUsesAlternativeCopy:(BOOL)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END UILabelScrollingDemoVC

@implementation UILabelScrollingDemoVC

-(JobsRetUILabelScrollingDemoVCByBOOLBlock _Nonnull)byPaused{
    @jobs_weakify(self)
    return ^__kindof UILabelScrollingDemoVC *_Nullable(BOOL value){
        @jobs_strongify(self)
        if (!self) return nil;
        [self setPaused:value];
        return self;
    };
}

-(void)dealloc{
    (((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabelScrollingDemoVC.class, @selector(stopLabels)))(self, @selector(stopLabels)))();
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabelScrollingDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data.byText(@"CoreText UILabel 文字滚动".jobsTr())
                    .byFont(UIFontWeightSemiboldSize(17))
                    .byTextCor(JobsLabelColor);
            })
            .byBgCor(JobsSystemBackgroundColor)
            .byNavBgCor(JobsSystemBackgroundColor);
    };
}

-(void)viewDidLoad{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabelScrollingDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.buildInterface();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabelScrollingDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        [self.view layoutIfNeeded];
        self.startLabels();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(UILabelScrollingDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.stopLabels();
    };
}
#pragma mark —— UI
-(jobsByVoidBlock _Nonnull)buildInterface{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        @jobs_weakify(self)
        UILabel *introLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"CoreText 完整排版 + CALayer 绘制 + JobsTimer 驱动。只有文字溢出时才进入滚动管线。".jobsTr())
                .byFont(UIFontWeightRegularSize(14))
                .byTextCor(JobsSecondaryLabelColor)
                .byNumberOfLines(0)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.top.equalTo(self.gk_navigationBar.mas_bottom).offset(JobsWidth(20));
                    make.height.mas_equalTo(JobsWidth(58));
                });
        });

        UILabel *continuousTitle = [self sectionLabelWithText:@"模式一：连续跑马灯"
                                                       topView:introLabel
                                                     topOffset:JobsWidth(18)];
        UIView *continuousCard = self.cardBelowView(continuousTitle);
        JobsLabelScrollConfiguration *continuousConfiguration = JobsLabelScrollConfiguration.continuousConfiguration();
        continuousConfiguration.bySpeed(38);
        continuousConfiguration.bySpacing(JobsWidth(40));
        self.continuousLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"CoreText UILabel 连续跑马灯：完整文案会从头到尾循环展示，动态切换后仍然保持可见。".jobsTr())
                .byFont(UIFontWeightMediumSize(18))
                .byTextCor(HEXCOLOR(0x00A8FF))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByClipping)
                .addOn(continuousCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(continuousCard).offset(JobsWidth(16));
                    make.right.equalTo(continuousCard).offset(-JobsWidth(16));
                    make.top.bottom.equalTo(continuousCard);
                });
        });
        self.continuousLabel.byTextScroll(continuousConfiguration);

        UILabel *pingPongTitle = [self sectionLabelWithText:@"模式二：左右往返"
                                                     topView:continuousCard
                                                   topOffset:JobsWidth(18)];
        UIView *pingPongCard = self.cardBelowView(pingPongTitle);
        JobsLabelScrollConfiguration *pingPongConfiguration = JobsLabelScrollConfiguration.pingPongConfiguration();
        pingPongConfiguration.bySpeed(30);
        pingPongConfiguration.byEdgePause(0.7);
        self.pingPongLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byAttributedText(self.pingPongAttributedTextWithAlternative(NO))
                .byNumberOfLines(1)
                .byLineBreakMode(NSLineBreakByClipping)
                .addOn(pingPongCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(pingPongCard).offset(JobsWidth(16));
                    make.right.equalTo(pingPongCard).offset(-JobsWidth(16));
                    make.top.bottom.equalTo(pingPongCard);
                });
        });
        self.pingPongLabel.byTextScroll(pingPongConfiguration);

        UILabel *shortTitle = [self sectionLabelWithText:@"边界验证：短文案不滚动"
                                                  topView:pingPongCard
                                                topOffset:JobsWidth(18)];
        UIView *shortCard = self.cardBelowView(shortTitle);
        self.shortLabel = jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
            label.byText(@"短文案：保持 UILabel 原生绘制".jobsTr())
                .byFont(UIFontWeightMediumSize(17))
                .byTextCor(JobsLabelColor)
                .byNumberOfLines(1)
                .addOn(shortCard)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(shortCard).offset(JobsWidth(16));
                    make.right.equalTo(shortCard).offset(-JobsWidth(16));
                    make.top.bottom.equalTo(shortCard);
                });
        });
        self.shortLabel.byTextScroll(JobsLabelScrollConfiguration.continuousConfiguration());

        NSArray<NSString *> *titles = @[@"暂停".jobsTr(), @"继续".jobsTr(), @"切换文案".jobsTr()];
        NSArray<UIColor *> *colors = @[HEXCOLOR(0xFF922B), HEXCOLOR(0x2ED158), HEXCOLOR(0x1296DB)];
        NSMutableArray<UIButton *> *buttons = NSMutableArray.array;
        for (NSUInteger index = 0; index < titles.count; index++) {
            UIButton *button = jobsMakeButton(^(__kindof UIButton * _Nullable button) {
                button.jobsResetBtnTitle(titles[index])
                    .jobsResetBtnTitleCor(JobsWhiteColor)
                    .jobsResetBtnTitleFont(UIFontWeightSemiboldSize(16))
                    .jobsResetBtnBgCor(colors[index])
                    .jobsResetBtnCornerRadiusValue(JobsWidth(12))
                    .onClickBy(^(__kindof UIButton * _Nullable button) {
                        weak_self.controlButtonTapped(button);
                    })
                    .byTag(index)
                    .addOn(self.view);
            });
            [buttons addObject:button];
        }
        self.byControlButtons(buttons.copy);
        [self.controlButtons mas_distributeViewsAlongAxis:MASAxisTypeHorizontal
                                          withFixedSpacing:JobsWidth(12)
                                               leadSpacing:JobsWidth(24)
                                               tailSpacing:JobsWidth(24)];
        [self.controlButtons mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(shortCard.mas_bottom).offset(JobsWidth(24));
            make.height.mas_equalTo(JobsWidth(52));
        }];
    };
}

-(UILabel *)sectionLabelWithText:(NSString *)text
                         topView:(UIView *)topView
                       topOffset:(CGFloat)topOffset{
    return jobsMakeLabel(^(__kindof UILabel * _Nullable label) {
        label.byText(text.jobsTr())
            .byFont(UIFontWeightSemiboldSize(17))
            .byTextCor(JobsSecondaryLabelColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.left.equalTo(self.view).offset(JobsWidth(24));
                make.right.equalTo(self.view).offset(-JobsWidth(24));
                make.top.equalTo(topView.mas_bottom).offset(topOffset);
                make.height.mas_equalTo(JobsWidth(24));
            });
    });
}

-(JobsRetViewByViewBlock _Nonnull)cardBelowView{
    @jobs_weakify(self)
    return ^UIView *(UIView * topView){
        @jobs_strongify(self)
        if (!self) return nil;
        return jobsMakeView(^(__kindof UIView * _Nullable view) {
            view.byBgColor(JobsSecondarySystemBackgroundColor)
                .byCornerRadius(JobsWidth(14))
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.left.equalTo(self.view).offset(JobsWidth(24));
                    make.right.equalTo(self.view).offset(-JobsWidth(24));
                    make.top.equalTo(topView.mas_bottom).offset(JobsWidth(10));
                    make.height.mas_equalTo(JobsWidth(70));
                });
        });
    };
}

-(JobsRetNSAttributedStringByBOOLBlock _Nonnull)pingPongAttributedTextWithAlternative{
    @jobs_weakify(self)
    return ^NSAttributedString *(BOOL alternative){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *text = alternative
            ? @"切换之后富文本仍然完整：CoreText + JobsTimer ✅，继续左右往返".jobsTr()
            : @"完整保留不同字体、颜色和 Emoji 🚀，到达边界以后自动折返".jobsTr();
        NSMutableAttributedString *result = [NSMutableAttributedString.alloc initWithString:text
                                                                                  attributes:@{
            NSFontAttributeName: UIFontWeightRegularSize(18),
            NSForegroundColorAttributeName: HEXCOLOR(0x00A8FF)
        }];
        NSString *highlight = alternative ? @"CoreText + JobsTimer" : @"不同字体、颜色";
        NSRange highlightRange = [text rangeOfString:highlight];
        if (highlightRange.location != NSNotFound) {
            [result addAttributes:@{
                NSFontAttributeName: UIFontWeightSemiboldSize(20),
                NSForegroundColorAttributeName: HEXCOLOR(0xFF922B)
            } range:highlightRange];
        }return result;
    };
}
#pragma mark —— Actions
-(jobsByVoidBlock _Nonnull)startLabels{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.continuousLabel.byStartTextScroll();
        self.pingPongLabel.byStartTextScroll();
        self.shortLabel.byStartTextScroll();
        if (self.isPaused) {
            if (self.continuousLabel) self.continuousLabel.byPauseTextScroll();
            if (self.pingPongLabel) self.pingPongLabel.byPauseTextScroll();
        }
    };
}

-(jobsByVoidBlock _Nonnull)stopLabels{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (self.continuousLabel) self.continuousLabel.byStopTextScroll();
        if (self.pingPongLabel) self.pingPongLabel.byStopTextScroll();
        if (self.shortLabel) self.shortLabel.byStopTextScroll();
    };
}

-(jobsByBtnBlock _Nonnull)controlButtonTapped{
    @jobs_weakify(self)
    return ^(UIButton * sender){
        @jobs_strongify(self)
        if (!self) return;
        if (sender.tag == 0) {
            self.byPaused(YES);
            if (self.continuousLabel) self.continuousLabel.byPauseTextScroll();
            if (self.pingPongLabel) self.pingPongLabel.byPauseTextScroll();
        }else if (sender.tag == 1){
            self.byPaused(NO);
            if (self.continuousLabel) self.continuousLabel.byResumeTextScroll();
            if (self.pingPongLabel) self.pingPongLabel.byResumeTextScroll();
        }else{
            self.switchCopy();
        }
    };
}

-(jobsByVoidBlock _Nonnull)switchCopy{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.byUsesAlternativeCopy(!self.usesAlternativeCopy);
        self.continuousLabel.text = self.usesAlternativeCopy
            ? @"切换成功：第一个 UILabel 仍有真实文案，CoreText 会重新排版并继续连续滚动。".jobsTr()
            : @"CoreText UILabel 连续跑马灯：完整文案会从头到尾循环展示，动态切换后仍然保持可见。".jobsTr();
        self.pingPongLabel.byAttributedText(self.pingPongAttributedTextWithAlternative(self.usesAlternativeCopy));
        self.continuousLabel.byReloadTextScroll();
        self.pingPongLabel.byReloadTextScroll();
        if (self.isPaused) {
            if (self.continuousLabel) self.continuousLabel.byPauseTextScroll();
            if (self.pingPongLabel) self.pingPongLabel.byPauseTextScroll();
        }
    };
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN UILabelScrollingDemoVC
-(JobsRetUILabelScrollingDemoVCByBOOLBlock _Nonnull)byUsesAlternativeCopy{
    @jobs_weakify(self)
    return ^__kindof UILabelScrollingDemoVC * _Nullable(BOOL data){
        @jobs_strongify(self)
        [self setUsesAlternativeCopy:data];
        return self;
    };
}

-(JobsRetUILabelScrollingDemoVCByNSArrayUIButtonBlock _Nonnull)byControlButtons{
    @jobs_weakify(self)
    return ^__kindof UILabelScrollingDemoVC * _Nullable(NSArray<UIButton *> * _Nullable data){
        @jobs_strongify(self)
        [self setControlButtons:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END UILabelScrollingDemoVC
@end
