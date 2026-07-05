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
    [super loadView];
    
    if ([self.requestParams isKindOfClass:UIViewModel.class]) {
        self.viewModel = (UIViewModel *)self.requestParams;
        if(self.viewModel.pushOrPresent != ComingStyle_Unknown){
            self.pushOrPresent = self.viewModel.pushOrPresent;
        }
    }
    self.setupNavigationBarHidden = YES;
    
    {
        self.viewModel
            .byBackBtnTitleModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byText(@"返回".tr);
            })
            .byTextModelBlock(^(__kindof UITextModel * _Nullable data) {
                data.byTextCor(HEXCOLOR(0x3D4A58));
                data.byText(@"相关功能列表".tr);
                data.byFont(UIFontWeightRegularSize(16));
            })
        
            // 使用原则：底图有 + 底色有 = 优先使用底图数据
            // 以下2个属性的设置，涉及到的UI结论 请参阅父类（BaseViewController）的私有方法：-(void)setBackGround
            // self.viewModel.bgImage = @"内部招聘导航栏背景图".img;
            .byBgCor(RGBA_COLOR(255, 238, 221, 1))
                //    self.viewModel.bgImage = @"启动页SLOGAN".img;
            .byNavBgCor(RGBA_COLOR(255, 238, 221, 1))
            .byNavBgImage(@"导航栏左侧底图".img);    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.byBgColor(JobsYellowColor);
    self.makeNavByAlpha(1);
    self.signatureSloganLottieView.animationProgress = 0;
    [self.signatureSloganLottieView play];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.signatureSloganLottieView.animationProgress = 0;
    [self.signatureSloganLottieView play];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.signatureSloganLottieView stop];
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
        _signatureSloganLottieView.loopAnimation = YES;
        _signatureSloganLottieView.userInteractionEnabled = NO;
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
