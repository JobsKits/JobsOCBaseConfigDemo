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
            NSString *localizedTitle = title.tr;
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

@implementation JXCategoryPopupSubVC
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
            data
                .byTextCor(HEXCOLOR(0x3D4A58))
                .byText(@"".tr)
                .byFont(UIFontWeightRegularSize(16));
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
    self.view.byBgColor(HEXCOLOR(0xF7E7D2));
    self.backgroundImageView.alpha = 1;
    self.contentGlassView.alpha = 1;
    self.titleWritingLottieView.alpha = 1;
    [self playTitleWritingLottie];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self playTitleWritingLottie];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self playTitleWritingLottie];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.titleWritingLottieView stop];
}
#pragma mark —— lazyLoad
-(NSString *)resolvedPageTitle{
    return isValue(self.pageTitle) ? self.pageTitle : @"全部游戏".tr;
}

-(NSString *)titleWritingLottieName{
    NSString *lottieName = JobsCategoryPopupTitleWritingLottieNameMap()[self.resolvedPageTitle];
    return isValue(lottieName) ? lottieName : JobsCategoryPopupTitleLottieDefaultName;
}

-(NSString *)titleWritingLottieFilePathByName:(NSString *)lottieName{
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

-(void)playTitleWritingLottie{
    [self reloadTitleWritingLottieViewIfNeeded];
    [self.view layoutIfNeeded];
    [self.titleWritingLottieView stop];
    self.titleWritingLottieView.animationProgress = 0;
    self.titleWritingLottieView.alpha = 1;
    [self.titleWritingLottieView playFromProgress:0
                                       toProgress:1
                                   withCompletion:nil];
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
        NSString *lottieName = self.titleWritingLottieName;
        NSString *filePath = [self titleWritingLottieFilePathByName:lottieName];
        if (!filePath.length &&
            ![lottieName isEqualToString:JobsCategoryPopupTitleLottieDefaultName]) {
            lottieName = JobsCategoryPopupTitleLottieDefaultName;
            filePath = [self titleWritingLottieFilePathByName:lottieName];
        }
        self.currentTitleWritingLottieName = lottieName;
        _titleWritingLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:lottieName];
        _titleWritingLottieView.loopAnimation = NO;
        _titleWritingLottieView.userInteractionEnabled = NO;
        _titleWritingLottieView.animationSpeed = 1.05f;
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
    [_titleWritingLottieView stop];
    [_titleWritingLottieView removeFromSuperview];
    _titleWritingLottieView = nil;
    self.currentTitleWritingLottieName = nil;
    [self playTitleWritingLottie];
}

@end
