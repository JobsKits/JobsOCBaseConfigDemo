//
//  JXCategoryPopupSubVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryPopupSubVC.h"

static NSString * const JobsCategoryPopupTitleLottieDefaultName = @"JobsCategoryTitleWriting_QuanBuYouXi";

static NSDictionary<NSString *, NSString *> *JobsCategoryPopupTitleWritingLottieNameMap(void) {
    static NSDictionary<NSString *, NSString *> *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary<NSString *, NSString *> *rawMap = @{
            @"全部游戏": @"JobsCategoryTitleWriting_QuanBuYouXi",
            @"真人": @"JobsCategoryTitleWriting_ZhenRen",
            @"体育": @"JobsCategoryTitleWriting_TiYu",
            @"电子": @"JobsCategoryTitleWriting_DianZi",
            @"棋牌": @"JobsCategoryTitleWriting_QiPai",
            @"彩票": @"JobsCategoryTitleWriting_CaiPiao"
        };
        NSMutableDictionary<NSString *, NSString *> *mutableMap = NSMutableDictionary.dictionary;
        [rawMap enumerateKeysAndObjectsUsingBlock:^(NSString * _Nonnull title, NSString * _Nonnull lottieName, BOOL * _Nonnull stop) {
            mutableMap[title] = lottieName;
            NSString *localizedTitle = title.jobsTr();
            if (isValue(localizedTitle)) mutableMap[localizedTitle] = lottieName;
        }];
        map = mutableMap.copy;
    });return map;
}

@interface JXCategoryPopupSubVC ()

Prop_strong()UIImageView *backgroundImageView;
Prop_strong()UIView *contentGlassView;
Prop_strong()LOTAnimationView *titleWritingLottieView;
Prop_copy()NSString *currentTitleWritingLottieName;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryPopupSubVC
@interface JXCategoryPopupSubVC (JobsPropertyDSLSetterAutogen_095d5ec8fa)
-(void)setCurrentTitleWritingLottieName:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryPopupSubVC

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_095d5ec8fa)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationSpeed;
-(void)setAnimationProgress:(CGFloat)data;
-(void)setAnimationSpeed:(CGFloat)data;
-(void)setLoopAnimation:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation JXCategoryPopupSubVC

-(JobsRetJXCategoryPopupSubVCByStrBlock _Nonnull)byPageTitle{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupSubVC *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.pageTitle = data;
        return self;
    };
}

- (void)dealloc{
    JobsLog(@"%@",JobsLocalFunc);
//    JobsRemoveNotification(self);
}

-(void)loadView{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupSubVC.class, @selector(jobsLoadView)))(self, @selector(jobsLoadView));
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
                    .byText(@"".jobsTr())
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
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupSubVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.backgroundImageView.byAlpha(1);
        self.contentGlassView.byAlpha(1);
        self.titleWritingLottieView.byAlpha(1);
        self.playTitleWritingLottie();
    };
}

-(void)viewWillAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupSubVC.class, @selector(jobsViewWillAppear)))(self, @selector(jobsViewWillAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillAppear:animated];
        self.playTitleWritingLottie();
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupSubVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.playTitleWritingLottie();
    };
}

-(void)viewWillDisappear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryPopupSubVC.class, @selector(jobsViewWillDisappear)))(self, @selector(jobsViewWillDisappear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewWillDisappear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewWillDisappear:animated];
        self.titleWritingLottieView.stop;
    };
}
#pragma mark —— lazyLoad
-(JobsRetStrByVoidBlock _Nonnull)resolvedPageTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return isValue(self.pageTitle) ? self.pageTitle : @"全部游戏".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleWritingLottieName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *lottieName = JobsCategoryPopupTitleWritingLottieNameMap()[self.resolvedPageTitle()];
        return isValue(lottieName) ? lottieName : JobsCategoryPopupTitleLottieDefaultName;
    };
}

-(JobsRetStrByStrBlock _Nonnull)titleWritingLottieFilePathByName{
    @jobs_weakify(self)
    return ^NSString *(NSString * lottieName){
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *filePath = [NSBundle.mainBundle pathForResource:lottieName
                                                           ofType:@"json"];
        if (!filePath.length) {
            filePath = [NSBundle.mainBundle pathForResource:lottieName
                                                     ofType:@"json"
                                                inDirectory:@"其他/libs/Lottie资源"];
        }
        if (!filePath.length) {
            filePath = [NSBundle.mainBundle pathForResource:lottieName
                                                     ofType:@"json"
                                                inDirectory:@"其他/资源文件管理/Lottie资源"];
        };return filePath;
    };
}

-(jobsByVoidBlock _Nonnull)reloadTitleWritingLottieViewIfNeeded{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        NSString *lottieName = self.titleWritingLottieName();
        if (_titleWritingLottieView &&
            [self.currentTitleWritingLottieName isEqualToString:lottieName]) return;
        if (_titleWritingLottieView) {
            _titleWritingLottieView.stop;
            [_titleWritingLottieView removeFromSuperview];
            _titleWritingLottieView = nil;
        }
        self.byCurrentTitleWritingLottieName(lottieName);
        self.titleWritingLottieView.byAlpha(1);
    };
}

-(jobsByVoidBlock _Nonnull)playTitleWritingLottie{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        self.reloadTitleWritingLottieViewIfNeeded();
        [self.view layoutIfNeeded];
        self.titleWritingLottieView.stop;
        self.titleWritingLottieView.byAnimationProgress(0);
        self.titleWritingLottieView.byAlpha(1);
        [self.titleWritingLottieView playFromProgress:0
                                           toProgress:1
                                       withCompletion:nil];
    };
}

-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = jobsMakeImageView(^(__kindof UIImageView * _Nullable imageView) {
            imageView
                .byImage(@"导航栏左侧底图".img)
                .byContentMode(UIViewContentModeScaleAspectFill)
                .byUserInteractionEnabled(NO)
                .byClipsToBounds(YES)
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.edges.equalTo(self.view);
                });
        });
    };return _backgroundImageView;
}

-(UIView *)contentGlassView{
    if (!_contentGlassView) {
        _contentGlassView = jobsMakeView(^(__kindof UIView * _Nullable view) {
            view
                .byBgColor(RGBA_COLOR(255, 255, 255, 0.36))
                .byLayer(^(__kindof CALayer * _Nullable layer) {
                    layer
                        .byCornerRadius(JobsWidth(22))
                        .byBorderWidth(1)
                        .byBorderColor(RGBA_COLOR(255, 255, 255, 0.55).CGColor)
                        .byShadowColor(HEXCOLOR(0x7C4F2A).CGColor)
                        .byShadowOpacity(0.18f)
                        .byShadowOffset(CGSizeMake(0, JobsWidth(10)))
                        .byShadowRadius(JobsWidth(18));
                })
                .addOn(self.view)
                .byAdd(^(MASConstraintMaker *make) {
                    make.top.equalTo(self.view).offset(JobsWidth(40));
                    make.left.right.equalTo(self.view).inset(JobsWidth(24));
                    make.height.mas_equalTo(JobsWidth(178));
                });
        });
    };return _contentGlassView;
}

-(LOTAnimationView *)titleWritingLottieView{
    if (!_titleWritingLottieView) {
        NSString *lottieName = self.titleWritingLottieName();
        NSString *filePath = self.titleWritingLottieFilePathByName(lottieName);
        if (!filePath.length &&
            ![lottieName isEqualToString:JobsCategoryPopupTitleLottieDefaultName]) {
            lottieName = JobsCategoryPopupTitleLottieDefaultName;
            filePath = self.titleWritingLottieFilePathByName(lottieName);
        }
        self.byCurrentTitleWritingLottieName(lottieName);
        _titleWritingLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:lottieName];
        _titleWritingLottieView.byLoopAnimation(NO);
        _titleWritingLottieView.byUserInteractionEnabled(NO);
        _titleWritingLottieView.byAnimationSpeed(1.05f);
        _titleWritingLottieView
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.center.equalTo(self.contentGlassView);
                make.left.right.equalTo(self.contentGlassView).inset(JobsWidth(18));
                make.height.mas_equalTo(JobsWidth(118));
            });
    };return _titleWritingLottieView;
}

-(void)setPageTitle:(NSString *)pageTitle{
    _pageTitle = pageTitle.copy;
    if (!self.isViewLoaded) return;
    _titleWritingLottieView.stop;
    [_titleWritingLottieView removeFromSuperview];
    _titleWritingLottieView = nil;
    self.currentTitleWritingLottieName = nil;
    self.playTitleWritingLottie();
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryPopupSubVC
-(JobsRetJXCategoryPopupSubVCByStrBlock _Nonnull)byCurrentTitleWritingLottieName{
    @jobs_weakify(self)
    return ^__kindof JXCategoryPopupSubVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCurrentTitleWritingLottieName:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryPopupSubVC
@end

// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN LOTAnimationView
@implementation LOTAnimationView (JobsLocalPropertyDSLAutogen_095d5ec8fa)
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationSpeed{
    @jobs_weakify(self)
    return ^__kindof LOTAnimationView * _Nullable(CGFloat data){
        @jobs_strongify(self)
        [self setAnimationSpeed:data];
        return self;
    };
}
@end
// JOBS_LOCAL_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END LOTAnimationView
