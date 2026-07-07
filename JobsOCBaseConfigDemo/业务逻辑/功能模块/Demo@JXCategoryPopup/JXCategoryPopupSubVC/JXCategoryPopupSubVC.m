//
//  JXCategoryPopupSubVC.m
//  JobsOCBaseConfigDemo
//
//  Created by Jobs on 2026年5月13日，星期三.
//

#import "JXCategoryPopupSubVC.h"

static NSString * const JobsCategoryPopupTitleLottieDefaultName = @"JobsCategoryTitleWriting";

@interface JXCategoryPopupSubVC ()

Prop_strong()UIImageView *backgroundImageView;
Prop_strong()UIView *contentGlassView;
Prop_strong()LOTAnimationView *titleWritingLottieView;
Prop_strong()UILabel *mainTitleLabel;

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
            data.byTextCor(HEXCOLOR(0x3D4A58));
            data.byText(@"".tr);
            data.byFont(UIFontWeightRegularSize(16));
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
    self.mainTitleLabel.alpha = 1;
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

-(NSString *)titleWritingLottieFilePath{
    NSString *filePath = [NSBundle.mainBundle pathForResource:JobsCategoryPopupTitleLottieDefaultName
                                                       ofType:@"json"];
    if (!filePath.length) {
        filePath = [NSBundle.mainBundle pathForResource:JobsCategoryPopupTitleLottieDefaultName
                                                 ofType:@"json"
                                            inDirectory:@"其他/libs/Lottie资源"];
    };return filePath;
}

-(void)playTitleWritingLottie{
    self.mainTitleLabel.text = self.resolvedPageTitle;
    [self.titleWritingLottieView stop];
    self.titleWritingLottieView.animationProgress = 0;
    [self.titleWritingLottieView play];
}

-(UIImageView *)backgroundImageView{
    if (!_backgroundImageView) {
        _backgroundImageView = UIImageView.new;
        _backgroundImageView.image = @"导航栏左侧底图".img;
        _backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        _backgroundImageView.userInteractionEnabled = NO;
        _backgroundImageView.clipsToBounds = YES;
        _backgroundImageView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        });
    };return _backgroundImageView;
}

-(UIView *)contentGlassView{
    if (!_contentGlassView) {
        _contentGlassView = UIView.new;
        _contentGlassView.byBgColor(RGBA_COLOR(255, 255, 255, 0.36));
        _contentGlassView.layer.cornerRadius = JobsWidth(22);
        _contentGlassView.layer.borderWidth = 1;
        _contentGlassView.layer.borderColor = RGBA_COLOR(255, 255, 255, 0.55).CGColor;
        _contentGlassView.layer.shadowColor = HEXCOLOR(0x7C4F2A).CGColor;
        _contentGlassView.layer.shadowOpacity = 0.18f;
        _contentGlassView.layer.shadowOffset = CGSizeMake(0, JobsWidth(10));
        _contentGlassView.layer.shadowRadius = JobsWidth(18);
        _contentGlassView.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.top.equalTo(self.view).offset(JobsWidth(42));
            make.left.right.equalTo(self.view).inset(JobsWidth(24));
            make.height.mas_equalTo(JobsWidth(210));
        });
    };return _contentGlassView;
}

-(LOTAnimationView *)titleWritingLottieView{
    if (!_titleWritingLottieView) {
        NSString *filePath = self.titleWritingLottieFilePath;
        _titleWritingLottieView = filePath.length ? [LOTAnimationView animationWithFilePath:filePath] : [LOTAnimationView animationNamed:JobsCategoryPopupTitleLottieDefaultName];
        _titleWritingLottieView.loopAnimation = YES;
        _titleWritingLottieView.userInteractionEnabled = NO;
        _titleWritingLottieView.animationSpeed = 0.9f;
        _titleWritingLottieView
            .byContentMode(UIViewContentModeScaleAspectFit)
            .byBgColor(JobsClearColor)
            .addOn(self.view)
            .byAdd(^(MASConstraintMaker *make) {
                make.top.equalTo(self.contentGlassView).offset(JobsWidth(26));
                make.centerX.equalTo(self.contentGlassView);
                make.size.mas_equalTo(CGSizeMake(JobsWidth(330), JobsWidth(110)));
            });
    };return _titleWritingLottieView;
}

-(UILabel *)mainTitleLabel{
    if (!_mainTitleLabel) {
        _mainTitleLabel = UILabel.new;
        _mainTitleLabel.text = self.resolvedPageTitle;
        _mainTitleLabel.font = UIFontWeightBoldSize(JobsWidth(34));
        _mainTitleLabel.textColor = HEXCOLOR(0x7A4D1F);
        _mainTitleLabel.textAlignment = NSTextAlignmentCenter;
        _mainTitleLabel.adjustsFontSizeToFitWidth = YES;
        _mainTitleLabel.minimumScaleFactor = 0.58f;
        _mainTitleLabel.layer.shadowColor = JobsWhiteColor.CGColor;
        _mainTitleLabel.layer.shadowOpacity = 0.9f;
        _mainTitleLabel.layer.shadowOffset = CGSizeMake(0, JobsWidth(2));
        _mainTitleLabel.layer.shadowRadius = JobsWidth(8);
        _mainTitleLabel.addOn(self.view).byAdd(^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.titleWritingLottieView);
            make.top.equalTo(self.titleWritingLottieView.mas_bottom).offset(JobsWidth(4));
            make.left.right.equalTo(self.contentGlassView).inset(JobsWidth(24));
            make.height.mas_equalTo(JobsWidth(52));
        });
    };return _mainTitleLabel;
}

-(void)setPageTitle:(NSString *)pageTitle{
    _pageTitle = pageTitle.copy;
    if (!self.isViewLoaded) return;
    self.mainTitleLabel.text = self.resolvedPageTitle;
    [self playTitleWritingLottie];
}

@end
