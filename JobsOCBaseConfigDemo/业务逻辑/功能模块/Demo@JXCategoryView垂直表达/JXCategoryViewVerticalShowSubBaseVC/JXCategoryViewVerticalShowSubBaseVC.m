//
//  JXCategoryViewVerticalShowSubBaseVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryViewVerticalShowSubBaseVC.h"

static NSString * const JobsCategoryTitleWritingLottieDefaultName = @"JobsCategoryTitleWriting";

static NSDictionary<NSString *, NSString *> *JobsCategoryTitleWritingLottieNameMap(void) {
    static NSDictionary<NSString *, NSString *> *map = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        map = @{
            @"豆花": @"JobsCategoryTitleWriting_DouHua",
            @"莲子羹": @"JobsCategoryTitleWriting_LianZiGeng",
            @"蒸肉": @"JobsCategoryTitleWriting_ZhengRou",
            @"排骨": @"JobsCategoryTitleWriting_PaiGu",
            @"美女": @"JobsCategoryTitleWriting_MeiNv",
            @"豪车": @"JobsCategoryTitleWriting_HaoChe"
        };
    });return map;
}

@interface JXCategoryViewVerticalShowSubBaseVC ()

Prop_strong()LOTAnimationView *titleWritingLottieView;
Prop_copy()NSString *currentTitleWritingLottieName;

@end

// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_BEGIN JXCategoryViewVerticalShowSubBaseVC
@interface JXCategoryViewVerticalShowSubBaseVC (JobsPropertyDSLSetterAutogen_2d6d0d7e30)
-(void)setCurrentTitleWritingLottieName:(NSString * _Nullable)data;
@end
// JOBS_PROPERTY_DSL_SETTER_DECLARATION_AUTOGEN_END JXCategoryViewVerticalShowSubBaseVC

// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_BEGIN LOTAnimationView
@interface LOTAnimationView (JobsLocalPropertyDSLAutogen_2d6d0d7e30)
-(JobsRetLOTAnimationViewByBOOLBlock _Nonnull)byLoopAnimation;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationProgress;
-(JobsRetLOTAnimationViewByCGFloatBlock _Nonnull)byAnimationSpeed;
-(void)setAnimationProgress:(CGFloat)data;
-(void)setAnimationSpeed:(CGFloat)data;
-(void)setLoopAnimation:(BOOL)data;
@end
// JOBS_LOCAL_PROPERTY_DSL_DECLARATION_AUTOGEN_END LOTAnimationView

@implementation JXCategoryViewVerticalShowSubBaseVC

-(JobsRetJXCategoryViewVerticalShowSubBaseVCByStrBlock _Nonnull)byPageTitle{
    @jobs_weakify(self)
    return ^__kindof JXCategoryViewVerticalShowSubBaseVC *_Nullable(NSString *_Nullable data){
        @jobs_strongify(self)
        self.pageTitle = data;
        return self;
    };
}

- (void)viewDidLoad {
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowSubBaseVC.class, @selector(jobsViewDidLoad)))(self, @selector(jobsViewDidLoad));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsViewDidLoad{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidLoad];
        self.view.byBgColor(JobsSystemBackgroundColor);
        self.titleWritingLottieView.byAlpha(1);
    };
}

-(void)viewDidAppear:(BOOL)animated{
    jobsByBOOLBlock action = ((jobsByBOOLBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowSubBaseVC.class, @selector(jobsViewDidAppear)))(self, @selector(jobsViewDidAppear));
    if (action) action(animated);
}

-(jobsByBOOLBlock _Nonnull)jobsViewDidAppear{
    @jobs_weakify(self)
    return ^(BOOL animated){
        @jobs_strongify(self)
        if (!self) return;
        [super viewDidAppear:animated];
        self.playPageTitleWritingAnimation();
    };
}

-(jobsByVoidBlock _Nonnull)listDidAppear{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isViewLoaded) return;
        self.playPageTitleWritingAnimation();
    };
}

-(void)listDidDisappear{
    jobsByVoidBlock action = ((jobsByVoidBlock (*)(__typeof__(self), SEL))JobsBlockInstanceMethodIMP(JXCategoryViewVerticalShowSubBaseVC.class, @selector(jobsListDidDisappear)))(self, @selector(jobsListDidDisappear));
    if (action) action();
}

-(jobsByVoidBlock _Nonnull)jobsListDidDisappear{
    @jobs_weakify(self)
    return ^{
        @jobs_strongify(self)
        if (!self) return;
        if (!self.isViewLoaded) return;
        self.titleWritingLottieView.stop;
        self.titleWritingLottieView.byAnimationProgress(0);
    };
}
#pragma mark —— 一些私有方法
-(jobsByVoidBlock _Nonnull)playPageTitleWritingAnimation{
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

-(JobsRetStrByVoidBlock _Nonnull)resolvedPageTitle{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        return isValue(self.pageTitle) ? self.pageTitle : @"主标题".jobsTr();
    };
}

-(JobsRetStrByVoidBlock _Nonnull)titleWritingLottieName{
    @jobs_weakify(self)
    return ^NSString *{
        @jobs_strongify(self)
        if (!self) return nil;
        NSString *lottieName = JobsCategoryTitleWritingLottieNameMap()[self.resolvedPageTitle()];
        return isValue(lottieName) ? lottieName : JobsCategoryTitleWritingLottieDefaultName;
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
        };return filePath;
    };
}
#pragma mark —— lazyLoad
-(LOTAnimationView *)titleWritingLottieView{
    if (!_titleWritingLottieView) {
        NSString *lottieName = self.titleWritingLottieName();
        NSString *filePath = self.titleWritingLottieFilePathByName(lottieName);
        if (!filePath.length &&
            ![lottieName isEqualToString:JobsCategoryTitleWritingLottieDefaultName]) {
            lottieName = JobsCategoryTitleWritingLottieDefaultName;
            filePath = self.titleWritingLottieFilePathByName(lottieName);
        }
        self.byCurrentTitleWritingLottieName(lottieName);
        _titleWritingLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:lottieName];
        _titleWritingLottieView.byLoopAnimation(NO);
        _titleWritingLottieView.byUserInteractionEnabled(NO);
        _titleWritingLottieView.byAnimationSpeed(1);
        _titleWritingLottieView
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.view).offset(JobsWidth(72));
                make.centerX.equalTo(self.view);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(330), JobsWidth(110)));
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
}

// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_BEGIN JXCategoryViewVerticalShowSubBaseVC
-(JobsRetJXCategoryViewVerticalShowSubBaseVCByStrBlock _Nonnull)byCurrentTitleWritingLottieName{
    @jobs_weakify(self)
    return ^__kindof JXCategoryViewVerticalShowSubBaseVC * _Nullable(NSString * _Nullable data){
        @jobs_strongify(self)
        [self setCurrentTitleWritingLottieName:data];
        return self;
    };
}
// JOBS_PROPERTY_DSL_IMPLEMENTATION_AUTOGEN_END JXCategoryViewVerticalShowSubBaseVC
@end
