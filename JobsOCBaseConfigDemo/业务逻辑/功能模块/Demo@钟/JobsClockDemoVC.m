//
//  JobsClockDemoVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JobsClockDemoVC.h"

/// 老工程的时钟实现位于手工第三方目录；Demo 层只读取其既有属性完成主题刷新。
@interface JobsClockView (JobsClockDemoTheme)

@property(nonatomic,strong,readonly) CAShapeLayer *dialLayer;
@property(nonatomic,strong,readonly) CAShapeLayer *tickLayer;
@property(nonatomic,strong,readonly) CAShapeLayer *centerDotLayer;
@property(nonatomic,strong,readonly) NSArray<UILabel *> *numberLabels;
@property(nonatomic,strong,readonly) CALayer *hourHand;
@property(nonatomic,strong,readonly) CALayer *minuteHand;

@end

@interface JobsClockDemoVC ()

Prop_strong()JobsClockView *clockView;

-(jobsByVoidBlock _Nonnull)applyClockTheme;

@end

@implementation JobsClockDemoVC
- (void)dealloc{
    JobsRemoveNotification(self);
    JobsLog(@"%@",JobsLocalFunc);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockDemoVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                data
                    .byTextCor(JobsLabelColor)
                    .byText(data.attributedTitle.string)
                    .byFont(UIFontWeightRegularSize(18));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byBgImage(@"新首页的底图".img)
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockDemoVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        if (@available(iOS 13.0, *)) {
            self.view.byBgColor(UIColor.systemBackgroundColor);
        } else {
            self.view.byBgColor(JobsSystemBackgroundColor);
        }
        self.clockView.byVisible(YES);
        self.applyClockTheme();
        @jobs_weakify(self)
        [self addNotificationName:JobsThemeDidChangeNotification
                            block:^(id _Nullable weakSelf,
                                    id _Nullable arg) {
            @jobs_strongify(self)
            self.applyClockTheme();
        }];
    };
}

- (void)viewDidAppear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockDemoVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        /// 视图展示后开始走表
        self.clockView.startByTimerType(JobsTimerTypeGCD);
    };
}

- (void)viewWillDisappear:(BOOL)animated {
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockDemoVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        /// 离开页面就停表，避免后台白跑
        [self.clockView stop];
    };
}

-(void)traitCollectionDidChange:(UITraitCollection *)previousTraitCollection{
    jobsByUITraitCollectionBlock action = ((jobsByUITraitCollectionBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JobsClockDemoVC.class, @selector(jobsTraitCollectionDidChange)))(self, @selector(jobsTraitCollectionDidChange));
    if (action) action(previousTraitCollection);
}

-(jobsByUITraitCollectionBlock _Nonnull)jobsTraitCollectionDidChange{
    @jobs_weakify(self)
    return ^(UITraitCollection * previousTraitCollection){
        @jobs_strongify(self)
        if (!self) return;
        [super traitCollectionDidChange:previousTraitCollection];
        if (@available(iOS 13.0, *)) {
            if ([self.traitCollection hasDifferentColorAppearanceComparedToTraitCollection:previousTraitCollection]) {
                self.applyClockTheme();
            }
        }
    };
}

-(jobsByVoidBlock _Nonnull)applyClockTheme{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        UIColor *labelColor = JobsLabelColor;
        UIColor *secondaryLabelColor = JobsSecondaryLabelColor;
        if (@available(iOS 13.0, *)) {
            labelColor = [labelColor resolvedColorWithTraitCollection:self.traitCollection];
            secondaryLabelColor = [secondaryLabelColor resolvedColorWithTraitCollection:self.traitCollection];
        }
        self.clockView.dialLayer.byStrokeColor(labelColor.CGColor);
        self.clockView.tickLayer.byStrokeColor(labelColor.CGColor);
        self.clockView.centerDotLayer.byFillColor(labelColor.CGColor);
        self.clockView.hourHand.byBackgroundColor(labelColor.CGColor);
        self.clockView.minuteHand.byBackgroundColor(secondaryLabelColor.CGColor);
        [self.clockView.numberLabels enumerateObjectsUsingBlock:^(UILabel * _Nonnull label,
                                                                  NSUInteger idx,
                                                                  BOOL * _Nonnull stop) {
            label.byTextCor(JobsLabelColor);
        }];
    };
}
#pragma mark —— LazyLoad
- (JobsClockView *)clockView {
    if (!_clockView) {
        @jobs_weakify(self)
        _clockView = JobsClockView.new
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                @jobs_strongify(self)
                make.center.equalTo(self.view);
                make.width.height.mas_equalTo(220);
            });
    };return _clockView;
}

@end
