//
//  ViewController@5.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "ViewController@5.h"

static NSString * const JobsSignatureSloganLottieName = @"JobsSignatureSlogan";

@interface ViewController_5 ()

Prop_strong()LOTAnimationView *signatureSloganLottieView;

@end

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_8d10cb3927)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;
-(void)setAnimationProgress:(CGFloat)data;
-(void)setLoopAnimation:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation ViewController_5
- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
    JobsRemoveNotification(self);
}

- (instancetype)init{
    if (self = [super init]) {
        JobsLog(@"");
    };return self;
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_5.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
        self.bySetupNavigationBarHidden(YES);
        {
            self.viewModel
                .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                    data.byText(@"返回".jobsTr());
                })
                .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                    data
                        .byTextCor(JobsLabelColor)
                        .byText(@"相关功能列表".jobsTr())
                        .byFont(UIFontWeightRegularSize(16));
                })
                // 使用原则：底图有 + 底色有 = 优先使用底图数据
                // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
                // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
                .byBgCor(RGBA_COLOR(255, 238, 221, 1))
                    //    self.viewModel.bgImage = @"启动页SLOGAN".img;
                .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
                .byNavBgImage(@"导航栏左侧底图".img);    }
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_5.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
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
        self.signatureSloganLottieView.byAnimationProgress(0);
        [self.signatureSloganLottieView play];
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_5.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.signatureSloganLottieView.byAnimationProgress(0);
        [self.signatureSloganLottieView play];
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_5.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
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
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(ViewController_5.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.signatureSloganLottieView.stop;
    };
}
#pragma mark —— lazyLoad
-(LOTAnimationView *)signatureSloganLottieView{
    if (!_signatureSloganLottieView) {
        NSString *filePath = [NSBundle.mainBundle pathForResource:JobsSignatureSloganLottieName
                                                           ofType:@"json"];
        if (!filePath.length) {
            filePath = [NSBundle.mainBundle pathForResource:JobsSignatureSloganLottieName
                                                     ofType:@"json"
                                                inDirectory:@"其他/libs/Lottie资源"];
        }
        _signatureSloganLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:JobsSignatureSloganLottieName];
        _signatureSloganLottieView.byLoopAnimation(YES);
        _signatureSloganLottieView.byUserInteractionEnabled(NO);
        _signatureSloganLottieView
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.centerX.equalTo(self.view);
                make.centerY.equalTo(self.view).offset(-JobsWidth(56));
                make.size.mas_equalTo(CGSizeMake(JobsWidth(360), JobsWidth(190)));
            });
    };return _signatureSloganLottieView;
}

@end
