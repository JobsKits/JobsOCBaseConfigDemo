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

@implementation JXCategoryViewVerticalShowSubBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(HEXCOLOR(0x8A2E17));
    self.titleWritingLottieView.alpha = 1;
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self playPageTitleWritingAnimation];
}

-(void)listDidAppear{
    if (!self.isViewLoaded) return;
    [self playPageTitleWritingAnimation];
}

-(void)listDidDisappear{
    if (!self.isViewLoaded) return;
    [self.titleWritingLottieView stop];
    self.titleWritingLottieView.animationProgress = 0;
}
#pragma mark —— 一些私有方法
-(void)playPageTitleWritingAnimation{
    [self reloadTitleWritingLottieViewIfNeeded];
    [self.view layoutIfNeeded];
    [self.titleWritingLottieView stop];
    self.titleWritingLottieView.animationProgress = 0;
    self.titleWritingLottieView.alpha = 1;
    [self.titleWritingLottieView playFromProgress:0
                                       toProgress:1
                                   withCompletion:nil];
}

-(NSString *)resolvedPageTitle{
    return isValue(self.pageTitle) ? self.pageTitle : @"主标题".tr;
}

-(NSString *)titleWritingLottieName{
    NSString *lottieName = JobsCategoryTitleWritingLottieNameMap()[self.resolvedPageTitle];
    return isValue(lottieName) ? lottieName : JobsCategoryTitleWritingLottieDefaultName;
}

-(void)reloadTitleWritingLottieViewIfNeeded{
    NSString *lottieName = self.titleWritingLottieName;
    if (_titleWritingLottieView &&
        [self.currentTitleWritingLottieName isEqualToString:lottieName]) return;
    if (_titleWritingLottieView) {
        [_titleWritingLottieView stop];
        [_titleWritingLottieView removeFromSuperview];
        _titleWritingLottieView = nil;
    }
    self.currentTitleWritingLottieName = lottieName;
    self.titleWritingLottieView.alpha = 1;
}

-(NSString *)titleWritingLottieFilePathByName:(NSString *)lottieName{
    NSString *filePath = [NSBundle.mainBundle pathForResource:lottieName
                                                       ofType:@"json"];
    if (!filePath.length) {
        filePath = [NSBundle.mainBundle pathForResource:lottieName
                                                 ofType:@"json"
                                            inDirectory:@"其他/libs/Lottie资源"];
    };return filePath;
}
#pragma mark —— lazyLoad
-(LOTAnimationView *)titleWritingLottieView{
    if (!_titleWritingLottieView) {
        NSString *lottieName = self.titleWritingLottieName;
        NSString *filePath = [self titleWritingLottieFilePathByName:lottieName];
        if (!filePath.length &&
            ![lottieName isEqualToString:JobsCategoryTitleWritingLottieDefaultName]) {
            lottieName = JobsCategoryTitleWritingLottieDefaultName;
            filePath = [self titleWritingLottieFilePathByName:lottieName];
        }
        self.currentTitleWritingLottieName = lottieName;
        _titleWritingLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:lottieName];
        _titleWritingLottieView.loopAnimation = NO;
        _titleWritingLottieView.userInteractionEnabled = NO;
        _titleWritingLottieView.animationSpeed = 1;
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
    [_titleWritingLottieView stop];
    [_titleWritingLottieView removeFromSuperview];
    _titleWritingLottieView = nil;
    self.currentTitleWritingLottieName = nil;
}

@end
