//
//  TestBaseLabelVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "TestBaseLabelVC.h"

@interface TestBaseLabelVC ()
/// UI
Prop_strong()JobsBaseLabel *titleLab;
Prop_strong()BaseLabel *baseLabel;

@end

@implementation TestBaseLabelVC
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byFont(UIFontWeightRegularSize(16));
            })
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
            //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.makeNavByAlpha(1);
        self.titleLab.byAlpha(1);
        self.baseLabel.byAlpha(1);
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
    };
}

-(void)viewWillLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewWillLayoutSubviews)))(self, @selector(jobsViewWillLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewWillLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillLayoutSubviews];
    };
}

-(void)viewDidLayoutSubviews{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewDidLayoutSubviews)))(self, @selector(jobsViewDidLayoutSubviews));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLayoutSubviews{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLayoutSubviews];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(TestBaseLabelVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
    };
}
#pragma mark —— LazyLoad
-(JobsBaseLabel *)titleLab{
    if (!_titleLab) {
        _titleLab = JobsBaseLabel.new;
        _titleLab.jobsRichViewByModel(nil);
        _titleLab.getLabel().jobsOffsetY = JobsWidth(-2);
        _titleLab.getLabel().byTextCor(JobsWhiteColor);
        _titleLab.getLabel().byFont(UIFontWeightRegularSize(12));
        _titleLab.getLabel().byTextAlignment(NSTextAlignmentCenter);
        _titleLab.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(JobsWidth(100));
            make.left.equalTo(self.view).offset(JobsWidth(100));
            make.height.mas_equalTo(JobsWidth(26));
        });
        (_titleLab.getLabel()).actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
            JobsLog(@"JobsBaseLabel的Tap手势");
            return @1;
        });
        (_titleLab.getLabel()).actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
            JobsLog(@"JobsBaseLabel的LongPress手势");
            return @1;
        });
    }
    _titleLab.getLabel().byText(@" 真人           ".jobsTr());
    _titleLab.getBgImageView().byImage(@"优惠活动背景图_真人".img);
    _titleLab.getLabel().makeLabelByShowingType(UILabelShowingType_03);
    [_titleLab.getLabel() appointCornerCutToCircleByRoundingCorners:UIRectCornerTopLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(JobsWidth(8), JobsWidth(8))];
    return _titleLab;
}

-(BaseLabel *)baseLabel{
    if (!_baseLabel) {
        @jobs_weakify(self)
        _baseLabel = jobsMakeBaseLabel(^(__kindof BaseLabel * _Nullable label) {
            @jobs_strongify(self)
            label.byJobsOffsetX(JobsWidth(10))
                .byText(@"测试 -BaseLabel-".jobsTr())
                .byBgColor(JobsCyanColor);
            label.actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
                JobsLog(@"BaseLabel的Tap手势");
                return @1;
            });
            label.actionRetIDByGestureRecognizerBlock(^id(UIGestureRecognizer *data) {
                JobsLog(@"BaseLabel的LongPress手势");
                return @1;
            });
            label.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(JobsWidth(20));
                make.left.equalTo(self.view).offset(JobsWidth(100));
                make.height.mas_equalTo(JobsWidth(26));
            });
        });
    };return _baseLabel;
}

@end
